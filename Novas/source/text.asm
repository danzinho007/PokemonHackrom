INCLUDE "includes.asm"

SECTION "Pokedex Entries 001-064", ROMX
PokedexEntries1:: INCLUDE "data/pokedex/entries_1.asm"

SECTION "Pokedex Entries 065-254", ROMX
PokedexEntries2:: INCLUDE "data/pokedex/entries_2.asm"
PokedexEntries3:: INCLUDE "data/pokedex/entries_3.asm"
PokedexEntries4:: INCLUDE "data/pokedex/entries_4.asm"

SECTION "Text 1", ROMX
INCLUDE "text/common_1.ctf"

SECTION "Text 2", ROMX
INCLUDE "text/common_2.ctf"

SECTION "Text 3", ROMX
INCLUDE "text/common_3.ctf"

SECTION "Text 4", ROMX
INCLUDE "text/common_4.ctf"

SECTION "Text 5", ROMX
INCLUDE "text/common_5.ctf"

SECTION "Text 6", ROMX
INCLUDE "text/common_6.ctf"

SECTION "Text 7", ROMX
INCLUDE "text/common_7.ctf"

SECTION "Text 8", ROMX
INCLUDE "text/common_8.ctf"

SECTION "Text 9", ROMX
INCLUDE "text/common_9.ctf"

SECTION "Text 10", ROMX
INCLUDE "text/common_10.ctf"

SECTION "Standard Text", ROMX
INCLUDE "text/stdtext.ctf"

SECTION "Judge Text", ROMX
INCLUDE "text/judge.ctf"

SECTION "Battle Text", ROMX
INCLUDE "text/battle.ctf"
