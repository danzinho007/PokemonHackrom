; Game Boy hardware interrupts

SECTION "vblank", ROM0
	jp VBlank

GetFarWRAMByte::
	call StackCallInWRAMBankA

	ld a, [hl]
	ret

SECTION "lcd", ROM0
	jp wLCD

GetFarByte::
	; retrieve a single byte from a:hl, and return it in a.
	; bankswitch to new bank
	call StackCallInBankA

	ld a, [hl]
	ret

SECTION "timer", ROM0
	scf
	reti

PlayStereoCry::
	call PlayStereoCry2
	jp WaitSFX

SECTION "serial", ROM0
	jp Serial

FarCopyWRAM::
	call StackCallInWRAMBankA

	rst CopyBytes
	ret

SECTION "joypad", ROM0
	reti
