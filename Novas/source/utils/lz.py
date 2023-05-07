# -*- coding: utf-8 -*-
"""
Pokemon Crystal data de/compression.
"""

"""
A rundown of Pokemon Crystal's compression scheme:

Control commands occupy bits 5-7.
Bits 0-4 serve as the first parameter <n> for each command.
"""
lz_commands = {
    'literal':   0, # n values for n bytes
    'iterate':   1, # one value for n bytes
    'alternate': 2, # alternate two values for n bytes
    'blank':     3, # zero for n bytes
}

"""
Repeater commands repeat any data that was just decompressed.
They take an additional signed parameter <s> to mark a relative starting point.
These wrap around (positive from the start, negative from the current position).
"""
lz_commands.update({
    'repeat':    4, # n bytes starting from s
    'flip':      5, # n bytes in reverse bit order starting from s
    'reverse':   6, # n bytes backwards starting from s
})

"""
The long command is used when 5 bits aren't enough. Bits 2-4 contain a new control code.
Bits 0-1 are appended to a new byte as 8-9, allowing a 10-bit parameter.
"""
lz_commands.update({
    'long':      7, # n is now 10 bits for a new control code
})
max_length = 1 << 10 # can't go higher than 10 bits
lowmax     = 1 <<  5 # standard 5-bit param

"""
If 0xff is encountered instead of a command, decompression ends.
"""
lz_end = 0xff


bit_flipped = [
    sum(((byte >> i) & 1) << (7 - i) for i in range(8))
    for byte in range(0x100)
]

# Compressed class removed in favor of lzcomp.c

class Decompressed:
    """
    Interpret and decompress lz-compressed data, usually 2bpp.
    """

    """
    Usage:
        data = Decompressed(lz).output
    or
        data = Decompressed().decompress(lz)
    or
        d = Decompressed()
        d.lz = lz
        data = d.decompress()

    To decompress from offset 0x80000 in a rom:
        data = Decompressed(rom, start=0x80000).output
    """

    lz = None
    start = 0
    commands = lz_commands
    debug = False

    arg_names = 'lz', 'start', 'commands', 'debug'

    def __init__(self, *args, **kwargs):
        self.__dict__.update(dict(zip(self.arg_names, args)))
        self.__dict__.update(kwargs)

        self.command_names = dict(map(reversed, self.commands.items()))
        self.address = self.start

        if self.lz is not None:
            self.decompress()

        if self.debug: print(self.command_list())


    def command_list(self):
        """
        Print a list of commands that were used. Useful for debugging.
        """

        text = ''

        output_address = 0
        for name, attrs in self.used_commands:
            length     = attrs['length']
            address    = attrs['address']
            offset     = attrs['offset']
            direction  = attrs['direction']

            text += '{2:03x} {0}: {1}'.format(name, length, output_address)
            text += '\t' + ' '.join(
                '{:02x}'.format(int(byte))
                for byte in self.lz[ address : address + attrs['cmd_length'] ]
            )

            if offset is not None:
                repeated_data = self.output[ offset : offset + length * direction : direction ]
                if name == 'flip':
                    repeated_data = map(bit_flipped.__getitem__, repeated_data)
                text += ' [' + ' '.join(map('{:02x}'.format, repeated_data)) + ']'

            text += '\n'
            output_address += length

        return text


    def decompress(self, lz=None):

        if lz is not None:
            self.lz = lz

        self.lz = bytearray(self.lz)

        self.used_commands = []
        self.output = []

        while 1:

            cmd_address = self.address
            self.offset = None
            self.direction = None

            if (self.byte == lz_end):
                self.next()
                break

            self.cmd = (self.byte & 0b11100000) >> 5

            if self.cmd_name == 'long':
                # 10-bit length
                self.cmd = (self.byte & 0b00011100) >> 2
                self.length = (self.next() & 0b00000011) * 0x100
                self.length += self.next() + 1
            else:
                # 5-bit length
                self.length = (self.next() & 0b00011111) + 1

            self.__class__.__dict__[self.cmd_name](self)

            self.used_commands += [(
                self.cmd_name,
                {
                    'length':     self.length,
                    'address':    cmd_address,
                    'offset':     self.offset,
                    'cmd_length': self.address - cmd_address,
                    'direction':  self.direction,
                }
            )]

        # Keep track of the data we just decompressed.
        self.compressed_data = self.lz[self.start : self.address]


    @property
    def byte(self):
        return self.lz[ self.address ]

    def next(self):
        byte = self.byte
        self.address += 1
        return byte

    @property
    def cmd_name(self):
        return self.command_names.get(self.cmd)


    def get_offset(self):

        if self.byte >= 0x80: # negative
            # negative
            offset = self.next() & 0x7f
            offset = len(self.output) - offset - 1
        else:
            # positive
            offset =  self.next() * 0x100
            offset += self.next()

        self.offset = offset


    def literal(self):
        """
        Copy data directly.
        """
        self.output  += self.lz[ self.address : self.address + self.length ]
        self.address += self.length

    def iterate(self):
        """
        Write one byte repeatedly.
        """
        self.output += [self.next()] * self.length

    def alternate(self):
        """
        Write alternating bytes.
        """
        alts = [self.next(), self.next()]
        self.output += [ alts[x & 1] for x in range(self.length) ]

    def blank(self):
        """
        Write zeros.
        """
        self.output += [0] * self.length

    def flip(self):
        """
        Repeat flipped bytes from output.

        Example: 11100100 -> 00100111
        """
        self._repeat(table=bit_flipped)

    def reverse(self):
        """
        Repeat reversed bytes from output.
        """
        self._repeat(direction=-1)

    def repeat(self):
        """
        Repeat bytes from output.
        """
        self._repeat()

    def _repeat(self, direction=1, table=None):
        self.get_offset()
        self.direction = direction
        # Note: appends must be one at a time (this way, repeats can draw from themselves if required)
        for i in range(self.length):
            byte = self.output[ self.offset + i * direction ]
            self.output.append( table[byte] if table else byte )
