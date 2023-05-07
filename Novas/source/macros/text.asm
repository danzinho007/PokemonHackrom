text   EQUS "db " ; Start writing text.
scroll EQUS "db $4c," ; Autoscroll to the next line (like cont, but no button press)
next   EQUS "db $4e," ; Move a line down.
line   EQUS "db $4f," ; Start writing at the bottom line.
para   EQUS "db $51," ; Start a new paragraph.
cont   EQUS "db $55," ; Scroll to the next line.
sdone  EQUS "db $56"  ; Like done, but with a cursorless prompt
done   EQUS "db $57"  ; End a text box.
prompt EQUS "db $58"  ; Prompt the player to end a text box (initiating some other event).

page   EQUS "db $50,"
nl     EQUS "db $5f," ; Write text on the next line. Used outside of scripting.

ctxt: MACRO
	fail "ctxt must be run through textcomp!"
ENDM

ct: MACRO
	fail "ct must be run through textcomp!"
ENDM

	enum_start 0
	enum TX_RAM
text_from_ram: MACRO
	db TX_RAM
	dw \1
	ENDM

	enum START_ASM
start_asm: MACRO
	db START_ASM
	ENDM

	enum TX_NUM
deciram: MACRO
	db TX_NUM
	dw \1 ; address
	dn ((\2) & $f), ((\3) & $f) ; bytes, digits
	ENDM
	
	enum TX_COMPRESSED

text_far: MACRO
	db HIGH(\1) - ($40 - (LEAST_CHAR - $40))
	db LOW(\1)
	db BANK(\1)
ENDM

text_jump: MACRO
	db HIGH(\1) - ($40 - (LEAST_CHAR - $40))
	db LOW(\1)
	db BANK(\1) | $80
ENDM
