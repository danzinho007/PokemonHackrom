; WARNING: this frameset is larger than 0x7f tiles.
; Tile 0x7f is reserved for whitespace, so it has been skipped, but only in this file.
; This means 0x7f is now 0x80, 0x80 is 0x81, and so on.; The graphics are unaffected. No padding tiles are added.
; You will need to map them yourself accordingly if you want to use more than 0x7f tiles.
; Please look for this notice in extras/pokemontools/gfx.py for more info.
; If extras/ does not exist, this file is probably out of date, and you should remake it.

	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
	dw .frame7
	dw .frame8
.frame1
	db $00 ; bitmask
	db $00, $00, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $00, $4d, $4e, $00
.frame2
	db $01 ; bitmask
	db $00, $00, $4f, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $00, $00, $6d, $6e, $00, $00
.frame3
	db $02 ; bitmask
	db $00, $00, $6f, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $80, $81, $82, $83, $84, $85, $86, $67, $2c, $87, $88, $89, $8a, $8b, $00, $00, $00, $00
.frame4
	db $03 ; bitmask
	db $8c, $00, $8d, $8e, $8f, $90, $91, $92, $93, $94, $95, $96, $97, $2c, $98, $99, $9a, $9b, $9c, $80, $9d, $9e, $9f, $a0, $a1, $a2, $67, $a3, $a4, $a5, $a6, $a7, $00, $00, $00, $00
.frame5
	db $04 ; bitmask
	db $a8, $a9, $8d, $8e, $aa, $ab, $ac, $ad, $92, $93, $ae, $af, $b0, $b1, $2c, $98, $99, $b2, $9b, $9c, $80, $9d, $9e, $9f, $b3, $b4, $a2, $67, $a3, $b5, $b6, $b7, $a7, $00, $00, $b8, $00
.frame6
	db $05 ; bitmask
	db $b9, $ba, $bb, $bc, $bd, $be, $bf, $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $9b, $cb, $cc, $cd, $ce, $cf, $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7, $a7, $00, $00, $d8, $00
.frame7
	db $06 ; bitmask
	db $00, $00, $d9, $da, $db, $dc, $dd, $de, $df, $e0, $e1, $e2, $e3, $e4, $e5, $e6, $e7, $e8, $e9, $ea, $eb, $ec, $ed, $ee, $ef, $f0, $f1, $f2, $f3, $f4, $4c, $00, $f5, $f6, $00
.frame8
	db $07 ; bitmask
	db $f7
