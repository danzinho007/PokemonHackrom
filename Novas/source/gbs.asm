GBS = 1
LOAD_ADDRESS EQU $3F20

INCLUDE "includes.asm"

numtodigits: MACRO
	; \1: value, \2: digits
	if (\2) > 1
		numtodigits (\1) / 10, (\2) - 1
	endc
	db ((\1) % 10) + "0"
ENDM

SECTION "GBS Header", ROM0[LOAD_ADDRESS - $70]
	newcharmap header
	db "GBS"         ;signature
	db 1             ;version
	db NUM_MUSIC - 1 ;number of songs
	db 1             ;first song
	dw LOAD_ADDRESS  ;load address
	dw GBS_Init      ;init address
	dw GBS_Play      ;play address
	dw wStack        ;stack pointer
	db 0             ;rTMA
	db 0             ;rTAC
GBS_TitleText:
	db "Pokemon Prism (v"
	numtodigits VERSION_MAJOR, 1
	db "."
	numtodigits VERSION_MINOR, 2
	db "."
	numtodigits BUILD_NUMBER, 4
	db ")"
	ds GBS_TitleText - @ + 32
GBS_AuthorText:
	db ""
	ds GBS_AuthorText - @ + 32
GBS_CopyrightText:
	db "2017 RainbowDevs 2001 Nintendo"
	ds GBS_CopyrightText - @ + 32

SECTION "GBS home bank", ROM0[LOAD_ADDRESS]

GetFarByte::
; retrieve a single byte from a:hl, and return it in a.
	; bankswitch to new bank
	call StackCallInBankA

	ld a, [hl]
GenericDummyFunction::
	ret

	ds 3

; RST $08
	jr StackFarCall

INCLUDE "home/jumptable.asm"

	ds 1

; RST $28
	jr Jumptable

GBS_Init:
	di
	inc a
	ld e, a
	ld d, 0
	ld a, 1 << VBLANK
	ldh [rIE], a
	ld a, 1 << 5 ; stereo on
	ld [wOptions], a
	ei
	call TurnSoundOff
	jr PlayMusic

INCLUDE "home/farcall.asm"
INCLUDE "home/audio.asm"

GBS_Play:
	call UpdateSound
	reti

ByteFill::
; fill bc bytes with the value of a, starting at hl
	inc b  ; we bail the moment b hits 0, so include the last run
	inc c  ; same thing; include last byte
	jr .HandleLoop
.PutByte
	ld [hli], a
.HandleLoop
	dec c
	jr nz, .PutByte
	dec b
	jr nz, .PutByte
	ret
