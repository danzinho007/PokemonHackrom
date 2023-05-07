macro_newline EQUS "\n"

	enum_start

	enum scall_command
scall: MACRO
	db scall_command
	dw \1 ; pointer
	ENDM

	enum farscall_command
farscall: MACRO
	db farscall_command
	dba \1
	ENDM

	enum ptcall_command
ptcall: MACRO
	db ptcall_command
	dw \1 ; pointer
	ENDM

	enum jump_command
jump: MACRO
	db jump_command
	dw \1 ; pointer
	ENDM

	enum farjump_command
farjump: MACRO
	db farjump_command
	dba \1
	ENDM

	enum ptjump_command
ptjump: MACRO
	db ptjump_command
	dw \1 ; pointer
	ENDM

	enum if_equal_command
if_equal: MACRO
	db if_equal_command
	db \1 ; byte
	dw \2 ; pointer
	ENDM

	enum if_not_equal_command
if_not_equal: MACRO
	db if_not_equal_command
	db \1 ; byte
	dw \2 ; pointer
	ENDM

	enum iffalse_command
iffalse: MACRO
	db iffalse_command
	dw \1 ; pointer
	ENDM

	enum iftrue_command
iftrue: MACRO
	db iftrue_command
	dw \1 ; pointer
	ENDM

	enum if_greater_than_command
if_greater_than: MACRO
	db if_greater_than_command
	db \1 ; byte
	dw \2 ; pointer
	ENDM

	enum if_less_than_command
if_less_than: MACRO
	db if_less_than_command
	db \1 ; byte
	dw \2 ; pointer
	ENDM

	enum jumpstd_command
jumpstd: MACRO
	db jumpstd_command
	db \1 ; predefined_script
	ENDM

	enum fieldmovepokepic_command
fieldmovepokepic: MACRO
	db fieldmovepokepic_command
	ENDM

	enum callasm_command
callasm: MACRO
	db callasm_command
	if strcmp("\1", "-1")
		dba \1
	else
		db \1
		dw -1
	endc
	ENDM

	enum special_command
special: MACRO
	db special_command
	db (\1Special - SpecialsPointers) / 3
	ENDM

add_special: MACRO
\1Special::
	dba \1
ENDM

	enum ptcallasm_command
ptcallasm: MACRO
	db ptcallasm_command
	dw \1 ; asm
	ENDM

	enum checkmaptriggers_command
checkmaptriggers: MACRO
	db checkmaptriggers_command
	map \1 ; map
	ENDM

	enum domaptrigger_command
domaptrigger: MACRO
	db domaptrigger_command
	map \1 ; map
	db \2 ; trigger_id
	ENDM

	enum checktriggers_command
checktriggers: MACRO
	db checktriggers_command
	ENDM

	enum dotrigger_command
dotrigger: MACRO
	db dotrigger_command
	db \1 ; trigger_id
	ENDM

	enum writebyte_command
writebyte: MACRO
	db writebyte_command
	db \1 ; value
	ENDM

	enum addvar_command
addvar: MACRO
	db addvar_command
	db \1 ; value
	ENDM

	enum random_command
random: MACRO
	db random_command
	IF _NARG == 1
		db \1 ; input
	ELSE
		db 0
	ENDC
	ENDM

	enum readarrayhalfword_command
readarrayhalfword: MACRO
	db readarrayhalfword_command
	db \1 ; array entry index
	ENDM

	enum copybytetovar_command
copybytetovar: MACRO
	db copybytetovar_command
	dw \1 ; address
	ENDM

	enum copyvartobyte_command
copyvartobyte: MACRO
	db copyvartobyte_command
	dw \1 ; address
	ENDM

	enum loadvar_command
loadvar: MACRO
	db loadvar_command
	dw \1 ; address
	db \2 ; value
	ENDM

	enum checkcode_command
checkcode: MACRO
	db checkcode_command
	db \1 ; variable_id
	ENDM

	enum writevarcode_command
writevarcode: MACRO
	db writevarcode_command
	db \1 ; variable_id
	ENDM

	enum writecode_command
writecode: MACRO
	db writecode_command
	db \1 ; variable_id
	db \2 ; value
	ENDM

	enum giveitem_command
giveitem: MACRO
	db giveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	ENDM

	enum takeitem_command
takeitem: MACRO
	db takeitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	ENDM

	enum checkitem_command
checkitem: MACRO
	db checkitem_command
	db \1 ; item
	ENDM

	enum givemoney_command
givemoney: MACRO
	db givemoney_command
	db \1 ; account
	dt \2 ; money
	ENDM

	enum takemoney_command
takemoney: MACRO
	db takemoney_command
	db \1 ; account
	dt \2 ; money
	ENDM

	enum checkmoney_command
checkmoney: MACRO
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
	ENDM

	enum givecoins_command
givecoins: MACRO
	db givecoins_command
	dw \1 ; coins
	ENDM

	enum takecoins_command
takecoins: MACRO
	db takecoins_command
	dw \1 ; coins
	ENDM

	enum checkcoins_command
checkcoins: MACRO
	db checkcoins_command
	dw \1 ; coins
	ENDM

	enum writehalfword_command
writehalfword: MACRO
	db writehalfword_command
	dw \1 ; halfword to store
	ENDM

	enum pushhalfword_command
pushhalfword: MACRO
	db pushhalfword_command
	dw \1 ; halfword to push
	ENDM

	enum pushhalfwordvar_command
pushhalfwordvar: MACRO
	db pushhalfwordvar_command
	ENDM

	enum checktime_command
checktime: MACRO
	db checktime_command
	db \1 ; time
	ENDM

checkmorn EQUS "checktime 1 << MORN"
checkday  EQUS "checktime 1 << DAY"
checknite EQUS "checktime 1 << NITE"

	enum checkpoke_command
checkpoke: MACRO
	db checkpoke_command
	db \1 ; pkmn
	ENDM

	enum givepoke_command
givepoke: MACRO
	db givepoke_command
	db \1 ; pokemon
	db \2 ; level
	if _NARG >= 3
	db \3 ; item
	if _NARG >= 4
	db \4 ; trainer
	if \4
	dw \5 ; trainer_name_pointer
	dw \6 ; pkmn_nickname
	endc
	else
	db 0
	endc
	else
	db NO_ITEM, 0
	endc
	ENDM

	enum giveegg_command
giveegg: MACRO
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
	ENDM

	enum copyhalfwordvartovar_command
copyhalfwordvartovar: MACRO
	db copyhalfwordvartovar_command
	ENDM

	enum copyvartohalfwordvar_command
copyvartohalfwordvar: MACRO
	db copyvartohalfwordvar_command
	ENDM

	enum checkevent_command
checkevent: MACRO
	db checkevent_command
	dw \1 ; event_flag
	ENDM

	enum clearevent_command
clearevent: MACRO
	db clearevent_command
	dw \1 ; event_flag
	ENDM

	enum setevent_command
setevent: MACRO
	db setevent_command
	dw \1 ; event_flag
	ENDM

	enum checkflag_command
checkflag: MACRO
	db checkflag_command
	dw \1 ; engine_flag
	ENDM

	enum clearflag_command
clearflag: MACRO
	db clearflag_command
	dw \1 ; engine_flag
	ENDM

	enum setflag_command
setflag: MACRO
	db setflag_command
	dw \1 ; engine_flag
	ENDM

	enum wildon_command
wildon: MACRO
	db wildon_command
	ENDM

	enum wildoff_command
wildoff: MACRO
	db wildoff_command
	ENDM

	enum warpmod_command
warpmod: MACRO
	db warpmod_command
	db \1 ; warp_id
	map \2 ; map
	ENDM

	enum blackoutmod_command
blackoutmod: MACRO
	db blackoutmod_command
	map \1 ; map
	ENDM

	enum warp_command
warp: MACRO
	db warp_command
	map \1 ; map
	db \2 ; x
	db \3 ; y
	ENDM

	enum readmoney_command
readmoney: MACRO
	db readmoney_command
	db \1 ; account
	db \2 ; memory
	ENDM

	enum readcoins_command
readcoins: MACRO
	db readcoins_command
	db \1 ; memory
	ENDM

	enum variablestablerandom_command
variablestablerandom: MACRO
	db variablestablerandom_command
	db \1 ; index
	db \2 ; upper bound
	ENDM

	enum pokenamemem_command
pokenamemem: MACRO
	db pokenamemem_command
	db \1 ; pokemon
	db \2 ; memory
	ENDM

	enum itemtotext_command
itemtotext: MACRO
	db itemtotext_command
	db \1 ; item
	db \2 ; memory
	ENDM

	enum mapnametotext_command
mapnametotext: MACRO
	db mapnametotext_command
	db \1 ; memory
	ENDM

	enum trainertotext_command
trainertotext: MACRO
	db trainertotext_command
	db \1 ; trainer_id
	db \2 ; trainer_group
	db \3 ; memory
	ENDM

	enum stringtotext_command
stringtotext: MACRO
	db stringtotext_command
	dw \1 ; text_pointer
	db \2 ; memory
	ENDM

	enum itemnotify_command
itemnotify: MACRO
	db itemnotify_command
	ENDM

	enum pocketisfull_command
pocketisfull: MACRO
	db pocketisfull_command
	ENDM

	enum opentext_command
opentext: MACRO
	db opentext_command
	ENDM

	enum refreshscreen_command
refreshscreen: MACRO
	db refreshscreen_command
	ENDM

	enum closetext_command
closetext: MACRO
	db closetext_command
	ENDM

current_cmdwitharrayargs = 0

cmdwitharrayargs_length: MACRO
	db .__cmdwitharrayargs\1End - .__cmdwitharrayargs\1
macro_newline
.__cmdwitharrayargs\1
macro_newline
ENDM

doendcmdwitharrayargslabel: MACRO
.__cmdwitharrayargs\1End
ENDM

	enum cmdwitharrayargs_command
cmdwitharrayargs: MACRO
	db cmdwitharrayargs_command
	IF _NARG == 1
		db \1
	ELSE
		cmdwitharrayargs_length {d:current_cmdwitharrayargs} ; skip offset (for script conditionals)
	ENDC
	ENDM

endcmdwitharrayargs: MACRO
	doendcmdwitharrayargslabel {d:current_cmdwitharrayargs}
current_cmdwitharrayargs = current_cmdwitharrayargs + 1
ENDM

customarraycmd: MACRO
	db \1_command ; command
	db \2 ; length
	shift
; just do a hardcode for now
	if _NARG == 2
		db (\2 - 1)
		db $00
	elif _NARG == 3
		db (\3 - 1) << 2 | (\2 - 1)
		db $00
	elif _NARG == 4
		db (\4 - 1) << 4 | (\3 - 1) << 2 | (\2 - 1)
		db $00
	elif _NARG == 5
		db (\5 - 1) << 6 | (\4 - 1) << 4 | (\3 - 1) << 2 | (\2 - 1)
		db $00
	elif _NARG == 6
		db (\5 - 1) << 6 | (\4 - 1) << 4 | (\3 - 1) << 2 | (\2 - 1)
		db (\6 - 1)
	elif _NARG == 7
		db (\5 - 1) << 6 | (\4 - 1) << 4 | (\3 - 1) << 2 | (\2 - 1)
		db (\7 - 1) << 2 | (\6 - 1)
	elif _NARG == 8
		db (\5 - 1) << 6 | (\4 - 1) << 4 | (\3 - 1) << 2 | (\2 - 1)
		db (\8 - 1) << 4 | (\7 - 1) << 2 | (\6 - 1)
	else
		db (\5 - 1) << 6 | (\4 - 1) << 4 | (\3 - 1) << 2 | (\2 - 1)
		db (\9 - 1) << 6 | (\8 - 1) << 4 | (\7 - 1) << 2 | (\6 - 1)
	endc
	ENDM

	enum farwritetext_command
farwritetext: MACRO
	db farwritetext_command
	if _NARG == 2
		dbw \1, \2
	else
		dba \1
	endc
	ENDM

	enum writetext_command
writetext: MACRO
	db writetext_command
	dw \1 ; text_pointer
	ENDM

	enum repeattext_command
repeattext: MACRO
	db repeattext_command
	ENDM

	enum yesorno_command
yesorno: MACRO
	db yesorno_command
	ENDM

	enum loadmenudata_command
loadmenudata: MACRO
	db loadmenudata_command
	dw \1 ; data
	ENDM

	enum closewindow_command
closewindow: MACRO
	db closewindow_command
	ENDM

	enum jumptextfaceplayer_command
jumptextfaceplayer: MACRO
	db jumptextfaceplayer_command
	dw \1 ; text_pointer
	ENDM

	enum farjumptext_command
farjumptext: MACRO
	db farjumptext_command
	if strcmp("\1", "-1")
		dba \1
	else
		db \1
		dw -1
	endc
	ENDM

	enum jumptext_command
jumptext: MACRO
	db jumptext_command
	dw \1 ; text_pointer
	ENDM

	enum waitbutton_command
waitbutton: MACRO
	db waitbutton_command
	ENDM

	enum buttonsound_command
buttonsound: MACRO
	db buttonsound_command
	ENDM

	enum pokepic_command
pokepic: MACRO
	db pokepic_command
	db \1 ; pokemon
	ENDM

	enum closepokepic_command
closepokepic: MACRO
	db closepokepic_command
	ENDM

	enum eventvarop_command
readeventvar: MACRO
	db eventvarop_command
	db (\1) & $3f
	ENDM
writeeventvar: MACRO
	db eventvarop_command
	db ((\1) & $3f) | $40
	ENDM
addeventvar: MACRO
	db eventvarop_command
	db ((\1) & $3f) | $80
	ENDM
compareeventvar: MACRO
	db eventvarop_command
	db ((\1) & $3f) | $c0
	ENDM

	enum verticalmenu_command
verticalmenu: MACRO
	db verticalmenu_command
	ENDM

	enum scrollingmenu_command
scrollingmenu: MACRO
	db scrollingmenu_command
	db \1 ; flags
	ENDM

	enum randomwildmon_command
randomwildmon: MACRO
	db randomwildmon_command
	ENDM

	enum loadmemtrainer_command
loadmemtrainer: MACRO
	db loadmemtrainer_command
	ENDM

	enum loadwildmon_command
loadwildmon: MACRO
	db loadwildmon_command
	if _NARG == 2
		db \1 ; pokemon
		db \2 ; level
	elif _NARG > 2
		db \1 ; pokemon
		db \2 | $80 ; level, additional data flag
		db \3 ; item
		if _NARG > 3
			db \4 ; move 1
		else
			db $00
		endc
		if _NARG > 4
			db \5 ; move 2
		else
			db $00
		endc
		if _NARG > 5
			db \6 ; move 3
		else
			db $00
		endc
		if _NARG > 6
			db \7 ; move 4
		else
			db $00
		endc
	endc
	ENDM

	enum loadtrainer_command
loadtrainer: MACRO
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
	ENDM

	enum startbattle_command
startbattle: MACRO
	db startbattle_command
	ENDM

	enum reloadmapafterbattle_command
reloadmapafterbattle: MACRO
	db reloadmapafterbattle_command
	ENDM

	enum addhalfwordtovar_command
addhalfwordtovar: MACRO
	db addhalfwordtovar_command
	dw \1
	ENDM

	enum trainertext_command
trainertext: MACRO
	db trainertext_command
	db \1 ; which_text
	ENDM

	enum trainerflagaction_command
trainerflagaction: MACRO
	db trainerflagaction_command
	db \1 ; action
	ENDM

	enum winlosstext_command
winlosstext: MACRO
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
	ENDM

	enum scripttalkafter_command
scripttalkafter: MACRO
	db scripttalkafter_command
	ENDM

	enum end_if_just_battled_command
end_if_just_battled: MACRO
	db end_if_just_battled_command
	ENDM

	enum check_just_battled_command
check_just_battled: MACRO
	db check_just_battled_command
	ENDM

	enum setlasttalked_command
setlasttalked: MACRO
	db setlasttalked_command
	db \1 ; person
	ENDM

	enum applymovement_command
applymovement: MACRO
	db applymovement_command
	db \1 ; person
	dw \2 ; data
	ENDM

	enum applymovement2_command
applymovement2: MACRO
	db applymovement2_command
	dw \1 ; data
	ENDM

	enum faceplayer_command
faceplayer: MACRO
	db faceplayer_command
	ENDM

	enum faceperson_command
faceperson: MACRO
	db faceperson_command
	db \1 ; person1
	db \2 ; person2
	ENDM

	enum variablesprite_command
variablesprite: MACRO
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
	ENDM

	enum disappear_command
disappear: MACRO
	db disappear_command
	db \1 ; person
	ENDM

	enum appear_command
appear: MACRO
	db appear_command
	db \1 ; person
	ENDM

	enum follow_command
follow: MACRO
	db follow_command
	db \1 ; person2
	db \2 ; person1
	ENDM

	enum stopfollow_command
stopfollow: MACRO
	db stopfollow_command
	ENDM

	enum moveperson_command
moveperson: MACRO
	db moveperson_command
	db \1 ; person
	db \2 ; x
	db \3 ; y
	ENDM

	enum writepersonxy_command
writepersonxy: MACRO
	db writepersonxy_command
	db \1 ; person
	ENDM

	enum loademote_command
loademote: MACRO
	db loademote_command
	db \1 ; bubble
	ENDM

	enum showemote_command
showemote: MACRO
	db showemote_command
	db \1 ; bubble
	db \2 ; person
	db \3 ; time
IF _NARG >= 4
	db \4 ; flag
ELSE
	db 1
ENDC
	ENDM

	enum spriteface_command
spriteface: MACRO
	db spriteface_command
	db \1 ; person
	db \2 ; facing
	ENDM

	enum follownotexact_command
follownotexact: MACRO
	db follownotexact_command
	db \1 ; person2
	db \2 ; person1
	ENDM

	enum earthquake_command
earthquake: MACRO
	db earthquake_command
	db \1 ; param
	ENDM

	enum changemap_command
changemap: MACRO
	db changemap_command
	db BANK(\1) ; map_bank
	dw \1 ; map_data_pointer
	ENDM

	enum changeblock_command
changeblock: MACRO
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
	ENDM

	enum reloadmap_command
reloadmap: MACRO
	db reloadmap_command
	ENDM

	enum reloadmappart_command
reloadmappart: MACRO
	db reloadmappart_command
	ENDM

	enum writecmdqueue_command
writecmdqueue: MACRO
	db writecmdqueue_command
	dw \1 ; queue_pointer
	ENDM

	enum delcmdqueue_command
delcmdqueue: MACRO
	db delcmdqueue_command
	db \1 ; byte
	ENDM

	enum playmusic_command
playmusic: MACRO
	db playmusic_command
	dw \1 ; music_pointer
	ENDM

	enum encountermusic_command
encountermusic: MACRO
	db encountermusic_command
	ENDM

	enum musicfadeout_command
musicfadeout: MACRO
	db musicfadeout_command
	dw \1 ; music
	db \2 ; fadetime
	ENDM

	enum playmapmusic_command
playmapmusic: MACRO
	db playmapmusic_command
	ENDM

	enum dontrestartmapmusic_command
dontrestartmapmusic: MACRO
	db dontrestartmapmusic_command
	ENDM

	enum cry_command
cry: MACRO
	db cry_command
	db \1 ; cry_id
	ENDM

	enum playsound_command
playsound: MACRO
	db playsound_command
	dw \1 ; sound_pointer
	ENDM

	enum waitsfx_command
waitsfx: MACRO
	db waitsfx_command
	ENDM

	enum warpsound_command
warpsound: MACRO
	db warpsound_command
	ENDM

	enum copyvarbytetovar_command
copyvarbytetovar: MACRO
	db copyvarbytetovar_command
	ENDM

	enum newloadmap_command
newloadmap: MACRO
	db newloadmap_command
	db \1 ; which_method
	ENDM

	enum pause_command
pause: MACRO
	db pause_command
	db \1 ; length
	ENDM

	enum deactivatefacing_command
deactivatefacing: MACRO
	db deactivatefacing_command
	db \1 ; time
	ENDM

	enum priorityjump_command
priorityjump: MACRO
	db priorityjump_command
	dw \1 ; pointer
	ENDM

	enum warpcheck_command
warpcheck: MACRO
	db warpcheck_command
	ENDM

	enum ptpriorityjump_command
ptpriorityjump: MACRO
	db ptpriorityjump_command
	dw \1 ; pointer
	ENDM

	enum return_command
return: MACRO
	db return_command
	ENDM

	enum end_command
end: MACRO
	db end_command
	ENDM

	enum reloadandreturn_command
reloadandreturn: MACRO
	db reloadandreturn_command
	db \1 ; which_method
	ENDM

	enum end_all_command
end_all: MACRO
	db end_all_command
	ENDM

	enum pokemart_command
pokemart: MACRO
	db pokemart_command
	db \1 ; dialog_id
	db \2 ; mart_id
	ENDM

	enum elevator_command
elevator: MACRO
	db elevator_command
	dw \1 ; floor_list_pointer
	ENDM

	enum scriptstartasmf_command
scriptstartasmf: MACRO
	db scriptstartasmf_command
	ENDM

	enum pophalfwordvar_command
pophalfwordvar: MACRO
	db pophalfwordvar_command
	ENDM

	enum skip
	enum skip

	enum pushbyte_command
pushbyte: MACRO
	db pushbyte_command
	db \1 ; byte
	ENDM

	enum fruittree_command
fruittree: MACRO
	db fruittree_command
	db \1 ; tree_id
	ENDM

	enum swapbyte_command
swapbyte: MACRO
	db swapbyte_command
	db \1 ; byte
	ENDM

	enum loadarray_command
loadarray: MACRO
	db loadarray_command
	dw \1 ; array pointer
	if _NARG == 2
		db \2 ; array size
	else
		db \1EntrySizeEnd - \1
	endc
	ENDM

	enum verbosegiveitem_command
verbosegiveitem: MACRO
	db verbosegiveitem_command
	db \1 ; item
if _NARG == 2
	db \2 ; quantity
else
	db 1
endc
	ENDM

	enum verbosegiveitem2_command
verbosegiveitem2: MACRO
	db verbosegiveitem2_command
	db \1 ; item
	db \2 ; var
	ENDM

	enum swarm_command
swarm: MACRO
	db swarm_command
	db \1 ; flag
	map \2 ; map
	ENDM

	enum killsfx_command
killsfx: MACRO
	db killsfx_command
	ENDM

	enum checkiteminbox_command
checkiteminbox: MACRO
	db checkiteminbox_command
	db \1
	ENDM

	enum warpfacing_command
warpfacing: MACRO
	db warpfacing_command
	db \1 ; facing
	map \2 ; map
	db \3 ; x
	db \4 ; y
	ENDM

	enum battletowertext_command
battletowertext: MACRO
	db battletowertext_command
	db \1 ; memory
	ENDM

	enum landmarktotext_command
landmarktotext: MACRO
	db landmarktotext_command
	db \1 ; id
	db \2 ; memory
	ENDM

	enum trainerclassname_command
trainerclassname: MACRO
	db trainerclassname_command
	db \1 ; id
	db \2 ; memory
	ENDM

	enum name_command
name: MACRO
	db name_command
	db \1 ; type
	db \2 ; id
	db \3 ; memory
	ENDM

	enum wait_command
wait: MACRO
	db wait_command
	db \1 ; duration
	ENDM

	enum loadscrollingmenudata_command
loadscrollingmenudata: MACRO
	db loadscrollingmenudata_command
	dw \1
	ENDM

;Prism Custom
	enum backupcustchar_command
backupcustchar: MACRO
	db backupcustchar_command
	ENDM

	enum restorecustchar_command
restorecustchar: MACRO
	db restorecustchar_command
	ENDM

	enum addhalfwordvartovar_command
addhalfwordvartovar: MACRO
	db addhalfwordvartovar_command
	ENDM

	enum addhalfwordtohalfwordvar_command
addhalfwordtohalfwordvar: MACRO
	db addhalfwordtohalfwordvar_command
	dw \1
	ENDM

	enum givecraftingEXP_command
givecraftingEXP: MACRO
	db givecraftingEXP_command
	db \1
	ENDM

	enum copybytetohalfwordvar_command
copybytetohalfwordvar: MACRO
	db copybytetohalfwordvar_command
	dw \1
	ENDM

	enum givetm_command
givetm: MACRO
	db givetm_command
	db \1 ; TM
	ENDM

	enum skip

	enum itemplural_command
itemplural: MACRO
	db itemplural_command
	db \1 ; string buffer
	ENDM

	enum pullvar_command
pullvar: MACRO
	db pullvar_command
	ENDM

	enum setplayersprite_command
setplayersprite: MACRO
	db setplayersprite_command
	db \1 ; character model index (0-5)
	ENDM

	enum setplayercolor_command
setplayercolor: MACRO
	db setplayercolor_command
	db \1
if \1 == 0
	RGB \2, \3, \4 ; clothes
	db \5 ; race
endc
	ENDM

	enum loadsignpost_command
loadsignpost: MACRO
	db loadsignpost_command
	IF _NARG == 2
		dw AddSignpostHeader
	ELSE
		dw \1
	endc
	ENDM

signpostheader: MACRO
	if \1 == 0
		db \1
	elif \1 >= TX_COMPRESSED
		db \1 + 1
	else
		db \1
	endc
	ENDM

	enum checkpokemontype_command ;Check if the selected Pokemon is part type or has a move of the type.
checkpokemontype: MACRO
	db checkpokemontype_command
	db \1 ;type
	ENDM

	enum isinarray_command
isinarray: MACRO
	db isinarray_command
	dw \1 ; pointer to bytes to compare against
	dw \2 ; pointer to array
	dn \3, \4 ; bytes to compare, skip amount
	db \5 ; number of entries in array
	ENDM

	enum pusharray_command
pusharray: MACRO
	db pusharray_command
	ENDM

	enum poparray_command
poparray: MACRO
	db poparray_command
	ENDM

	enum startmirrorbattle_command
startmirrorbattle: MACRO
	db startmirrorbattle_command
	ENDM

	enum comparevartobyte_command
comparevartobyte: MACRO
	db comparevartobyte_command
	dw \1
	ENDM

	enum backupsecondpokemon_command
backupsecondpokemon: MACRO
	db backupsecondpokemon_command
	ENDM

	enum restoresecondpokemon_command
restoresecondpokemon: MACRO
	db restoresecondpokemon_command
	ENDM

	enum loadhalfwordvar_command
loadhalfwordvar: MACRO
	db loadhalfwordvar_command
	db \1
	ENDM

	enum pullhalfwordvar_command
pullhalfwordvar: MACRO
	db pullhalfwordvar_command
	ENDM

	enum divideby_command
divideby: MACRO
	db divideby_command
	db \1
	ENDM

	enum isinsingulararray_command
isinsingulararray: MACRO
	db isinsingulararray_command
	dw \1
	ENDM

	enum getnthstring_command
getnthstring: MACRO
	db getnthstring_command
	dw \1
	db \2
	ENDM

	enum readpersonxy_command
readpersonxy: MACRO
	db readpersonxy_command
	db \1 ; object to read
	dw \2 ; pointer to storage
	ENDM

	enum return_if_callback_else_end_command
return_if_callback_else_end: MACRO
	db return_if_callback_else_end_command
	ENDM

current_copycmd = 0

copycmd_length: MACRO
	db .__copycmd\1End - .__copycmd\1
macro_newline
.__copycmd\1
macro_newline
ENDM

doendcopycmdlabel: MACRO
.__copycmd\1End
ENDM

	enum copy_command
copy: MACRO
	db copy_command
	dw \1
	IF _NARG == 2
		db \1
	ELSE
		copycmd_length {d:current_copycmd} ; length
	ENDC
	ENDM

endcopy: MACRO
	doendcopycmdlabel {d:current_copycmd}
current_copycmd = current_copycmd + 1
ENDM

	enum switch_command
switch: MACRO
	db switch_command
	db \1
	ENDM

	enum multiplyvar_command
multiplyvar: MACRO
	db multiplyvar_command
	db \1
	ENDM

	enum seteventvar_command
seteventvar: MACRO
	if (((\2) < -1) || ((\2) > 2)) && ((\2) != $ff)
		fail "Invalid argument to seteventvar; only values of -1, 0, 1 or 2 are permitted."
	endc
	db seteventvar_command
	db (((\2) & 3) << 6) | ((\1) & $3f)
	ENDM

	enum callasmf_command
callasmf: MACRO
	db callasmf_command
	if strcmp("\1", "-1")
		dba \1
	else
		db \1
		dw -1
	endc
	ENDM

	enum jumptable_command
scriptjumptable: MACRO
	db jumptable_command
	dw \1
	ENDM

	enum anonjumptable_command
anonjumptable: MACRO
	db anonjumptable_command
	ENDM

	enum varblocks_command
varblocks: MACRO
	db varblocks_command
	dw \1
	ENDM

	enum addbytetovar_command
addbytetovar: MACRO
	db addbytetovar_command
	dw \1
	ENDM

	enum paragraphdelay_command
paragraphdelay: MACRO
	db paragraphdelay_command
	ENDM

	enum playwaitsfx_command
playwaitsfx: MACRO
	db playwaitsfx_command
	dw \1
	ENDM

	enum scriptstartasm_command
scriptstartasm: MACRO
	db scriptstartasm_command
	ENDM

scriptstopasm: MACRO
	; This is not a command; this simply closes a scriptstartasm so that the script continues right after this macro
	call ScriptStopASM
	ENDM

	enum copystring_command
copystring: MACRO
	db copystring_command
	db \1
	ENDM

	enum endtext_command
endtext: MACRO
	db endtext_command
	ENDM

	enum pushvar_command
pushvar: MACRO
	db pushvar_command
	ENDM

	enum popvar_command
popvar: MACRO
	db popvar_command
	ENDM

	enum swapvar_command
swapvar: MACRO
	db swapvar_command
	ENDM

	enum getweekday_command
getweekday: MACRO
	db getweekday_command
	ENDM

	enum toggle_command
toggle: MACRO
	db toggle_command
	dw \1 ; event flag
	if _NARG == 1
		dw 0, 0
	else
		dw \2 ; iffalse
		if _NARG > 2
			shift
		endc
		dw \2 ; iftrue
	endc
	ENDM

	enum skip

then_command EQU scriptstartasm_command ;we can't use scriptstartasm with conditionals, so...

	enum selse_command
selse: MACRO
	db selse_command
	ENDM

	enum sendif_command
sendif: MACRO
	db sendif_command
	ENDM

	enum siffalse_command
	enum siftrue_command
	enum sifgt_command
	enum siflt_command
	enum sifeq_command
	enum sifne_command
sif: MACRO
parameterized_if_command = 1
if_parameter_offset = 0
if !strcmp("\1", "=") || !strcmp("\1", "==")
	db sifeq_command
elif !strcmp("\1", "!=") || !strcmp("\1", "<>")
	db sifne_command
elif !strcmp("\1", ">")
	db sifgt_command
elif !strcmp("\1", "<")
	db siflt_command
elif !strcmp("\1", ">=")
if_parameter_offset = -1
	db sifgt_command
elif !strcmp("\1", "<=")
if_parameter_offset = 1
	db siflt_command
elif !strcmp("\1", "true")
parameterized_if_command = 0
	db siftrue_command
elif !strcmp("\1", "false")
parameterized_if_command = 0
	db siffalse_command
else
	fail "Invalid condition to sif"
endc
if parameterized_if_command
	db (\2) + if_parameter_offset
	if _NARG == 3
		if !strcmp("\3", "then")
			db then_command
		endc
	endc
elif _NARG == 2
	if !strcmp("\2", "then")
		db then_command
	endc
endc
	ENDM

	enum readarray_command
readarray: MACRO
	db readarray_command
	db \1 ; index within array
	ENDM

	enum givetmnomessage_command
givetmnomessage: MACRO
	db givetmnomessage_command
	db \1
	ENDM

	enum findpokemontype_command
findpokemontype: MACRO
	db findpokemontype_command
	db \1
	ENDM

	enum startpokeonly_command
startpokeonly: MACRO
	db startpokeonly_command
	map \1
	db \2
	ENDM

	enum endpokeonly_command
endpokeonly: MACRO
	db endpokeonly_command
	map \1
	db \2
	ENDM

	enum fadetomapmusic_command
fadetomapmusic: MACRO
	db fadetomapmusic_command
	db \1 ; fade time
	ENDM

	enum menuanonjumptable_command
menuanonjumptable: MACRO
	db menuanonjumptable_command
	dw \1
	ENDM
	
	enum modifyeventvar_command
inceventvar: MACRO
	db modifyeventvar_command
	db ((\1) & $3f) | $80
	ENDM

deceventvar: MACRO
	db modifyeventvar_command
	db ((\1) & $3f) | $c0
	ENDM

addtoeventvar: MACRO
	db modifyeventvar_command
	db ((\1) & $3f) | $40
	db \2
	ENDM

seteventvartovalue: MACRO
	db modifyeventvar_command
	db (\1) & $3f
	db \2
	ENDM
	
	enum showtext_command
showtext: MACRO
	db showtext_command
	dw \1
	ENDM

	enum closetextend_command
closetextend: MACRO
	db closetextend_command
	ENDM

	enum toggleevent_command
toggleevent: MACRO
	db toggleevent_command
	dw \1
	ENDM
