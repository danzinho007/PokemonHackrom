map: MACRO
	rept _NARG
		db GROUP_\1, MAP_\1
		shift
	endr
ENDM

roam_map: MACRO
; A map and an arbitrary number of some more maps.

	map \1
	db  \2

	rept \2
	map \3
	shift
	endr

	db 0
ENDM

person_event: MACRO
person_event_narg = _NARG
	db \1 ; sprite
	db \2 + 4 ; y
	db \3 + 4 ; x
	db \4 ; movement function
	dn \5, \6 ; radius: y, x
	db \7 ; clock_hour
	db \8 ; clock_daytime
	shift
	dn \8, \9 ; color, function
	shift
	db \9
	IF \8 == PERSONTYPE_JUMPSTD
		shift
		db \9 ; std
		IF person_event_narg == 14
			shift
			db \9
		ELSE
			db 0
		ENDC
	ELIF \8 == PERSONTYPE_MART
		shift
		db \9 ; mart type
		shift
		db \9 ; mart ID
	ELSE
		shift
		dw \9 ; pointer
	ENDC
	shift
	dw \9 ; event flag
	ENDM

signpost: MACRO
boolean_or = 0
	db \1 ; y
	db \2 ; x
	db \3 ; function
	IF \3 == SIGNPOST_JUMPSTD
boolean_or = 1
	ELIF \3 == SIGNPOST_JUMPSTDNOSFX
boolean_or = 1
	ENDC
	IF boolean_or == 1
		db \4
		IF _NARG == 5
			db \5
		ELSE
			db 0
		ENDC
	ELSE
		dw \4 ; pointer
	ENDC
	ENDM

XY_TRIGGER_SIZE EQU 7

xy_trigger: MACRO
	db \1 ; number
	db \2 ; y
	db \3 ; x
	IF _NARG == 5
		dw \5 ; event
	ELSE
		dw 0
	ENDC
	dw \4 ; script
	ENDM

warp_def: MACRO
	db \1 ; y
	db \2 ; x
	db \3 ; warp_to
	map \4 ; map
	ENDM

dummy_warp: MACRO
	db \1 ; y
	db \2 ; x
	db -1, 0, 0
	ENDM

map_header: MACRO
	; label, tileset, permission, location, music, phone service flag, time of day, fishing group
\1_MapHeader:
	db BANK(\1_SecondMapHeader), \2, \3
	dw \1_SecondMapHeader
	db \4, \5
	dn \6, \7
	db \8
ENDM


map_header_2: MACRO
; label, map, border block, connections
\1_SecondMapHeader::
	db \3
	db \2_HEIGHT, \2_WIDTH
	db BANK(\1_BlockData)
	dw \1_BlockData
	db BANK(\1_MapScriptHeader)
	dw \1_MapScriptHeader
	dw \1_MapEventHeader
	db \4
ENDM

connection: MACRO
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: x/y
;\5: offset?
;\6: strip length
;\7: this map id

	map \2
if !strcmp("\1", "north")
	dw wDecompressScratch + \2_WIDTH * (\2_HEIGHT - 3) + \5
	dw wOverworldMap + \4 + 3
	db \6
	db \2_WIDTH
	db \2_HEIGHT * 2 - 1
	db (\4 - \5) * -2
	dw wOverworldMap + \2_HEIGHT * (\2_WIDTH + 6) + 1
elif !strcmp("\1", "south")
	dw wDecompressScratch + \5
	dw wOverworldMap + (\7_HEIGHT + 3) * (\7_WIDTH + 6) + \4 + 3
	db \6
	db \2_WIDTH
	db 0
	db (\4 - \5) * -2
	dw wOverworldMap + \2_WIDTH + 7
elif !strcmp("\1", "west")
	dw wDecompressScratch + (\2_WIDTH * \5) + \2_WIDTH - 3
	dw wOverworldMap + (\7_WIDTH + 6) * (\4 + 3)
	db \6
	db \2_WIDTH
	db (\4 - \5) * -2
	db \2_WIDTH * 2 - 1
	dw wOverworldMap + \2_WIDTH * 2 + 6
elif !strcmp("\1", "east")
	dw wDecompressScratch + (\2_WIDTH * \5)
	dw wOverworldMap + (\7_WIDTH + 6) * (\4 + 3 + 1) - 3
	db \6
	db \2_WIDTH
	db (\4 - \5) * -2
	db 0
	dw wOverworldMap + \2_WIDTH + 7
endc

ENDM

mapgroup: MACRO
GROUP_\1 EQU const_value
	enum MAP_\1
\1_HEIGHT EQU \2
\1_WIDTH EQU \3
ENDM

newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

elevfloor: MACRO
	db \1, \2
	map \3
ENDM

itemball: MACRO
if _NARG == 2
	db \1, \2
else
	db \1, 1
endc
ENDM

stonetable: MACRO
	db \1, \2
	dw \3
ENDM

maptrigger: MACRO
	dw \1, 0
ENDM

eventflagchangeblock: MACRO
	dw \1
	db \2, \3, \4
ENDM
