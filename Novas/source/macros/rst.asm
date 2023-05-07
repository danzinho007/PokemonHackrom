FarCall           EQU $08
GenericBankswitch EQU $10
AddNTimes         EQU $18
Predef            EQU $20
JumpTable         EQU $28
CopyBytes         EQU $30

callba: MACRO ; bank, address
	rst FarCall
	dbw BANK(\1), \1
	ENDM

jpba: MACRO
	rst FarCall
	dbw BANK(\1) | $80, \1
	ENDM

jumptable: MACRO
	rst JumpTable
	if _NARG > 0
	dw \1 | $8000
	endc
	ENDM

bankpushcall: MACRO
	rst FarCall
	db BANK(\1)
	dw \2
	ENDM

bankpushjp: MACRO
	rst FarCall
	db BANK(\1) | $80
	dw \2
	ENDM

anonbankpush: MACRO
	rst FarCall
	db BANK(\1) | $80
	dw .anonPtr\@
.anonPtr\@
	ENDM

rbk: MACRO ;ROM bank switch
	_bankswitch_macro \1, $00, $e0, $7f
ENDM

wbk: MACRO ;WRAM bank switch
	_bankswitch_macro \1, $90, $f0, $07, rSVBK
ENDM

vbk: MACRO ;VRAM bank switch
	_bankswitch_macro \1, $98, $f8, $01, rVBK
ENDM

sbk: MACRO ;SRAM bank switch
	_bankswitch_macro \1, $80, $e8, $0f
ENDM

scls: MACRO ;SRAM close
	rst GenericBankswitch
	db $9a
ENDM

_bankswitch_macro: MACRO
	; THIS IS NOT THE MACRO YOU WANT TO USE. It starts with an underscore for a reason. Use the macros defined above.
	; user-supplied argument, offset for immediate banks, offset for register banks, bitmask for immediate banks, register if register is A (optional)
	IF !(STRCMP("\1", "b") && STRCMP("\1", "B"))
		rst GenericBankswitch
		db \3
	ELIF !(STRCMP("\1", "c") && STRCMP("\1", "C"))
		rst GenericBankswitch
		db \3 + 1
	ELIF !(STRCMP("\1", "d") && STRCMP("\1", "D"))
		rst GenericBankswitch
		db \3 + 2
	ELIF !(STRCMP("\1", "e") && STRCMP("\1", "E"))
		rst GenericBankswitch
		db \3 + 3
	ELIF !(STRCMP("\1", "h") && STRCMP("\1", "H"))
		rst GenericBankswitch
		db \3 + 4
	ELIF !(STRCMP("\1", "l") && STRCMP("\1", "L"))
		rst GenericBankswitch
		db \3 + 5
	ELIF !(STRCMP("\1", "a") && STRCMP("\1", "A"))
		IF _NARG > 4
			ldh [\5], a
		ELSE
			rst GenericBankswitch
			db \3 + 7
		ENDC
	ELIF !(STRCMP("\1", "[hl]") && STRCMP("\1", "[HL]") && STRCMP("\1", "[Hl]") && STRCMP("\1", "[hL]"))
		rst GenericBankswitch
		db \3 + 6
	ELSE
		rst GenericBankswitch
		db \2 + ((\1) & \4)
	ENDC
ENDM
