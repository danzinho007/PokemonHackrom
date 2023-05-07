UpdateCageKeyDoorsScript::
	writebyte 0
	pushvar
.loop
	pullvar
	scall GetCageKeyDoorArrayPointer
	sif true
		cmdwitharrayargs
		db changeblock_command, %111, 2, 3, 4
		endcmdwitharrayargs
	popvar
	addvar 1
	pushvar
	comparevartobyte wCageKeyDoorsArrayLength
	if_equal 1, .loop
	popvar
	return_if_callback_else_end

HandleCageKeyDoor::
	scall GetCageKeyDoorArrayPointer
	sif true
		end
	playsound SFX_READ_TEXT_2
	opentext
	checkitem CAGE_KEY
	sif false
		jumptext .need_key_text
	writetext .want_to_unlock_text
	yesorno
	sif false
		closetextend
	writetext .unlocked_text
	setevent -1
	takeitem CAGE_KEY, 1
	playsound SFX_ENTER_DOOR
	scall UpdateCageKeyDoorsScript
	refreshscreen 0
	reloadmappart
	closetextend

.need_key_text
	ctxt "You need a Cage"
	line "Key to unlock"
	cont "this door."
	done

.want_to_unlock_text
	ctxt "Do you want to"
	line "unlock this door?"
	done

.unlocked_text
	ctxt "Unlocked the"
	line "door!"
	sdone

GetCageKeyDoorArrayPointer:
	copybytetohalfwordvar wCageKeyDoorsArrayPointer
	loadarray -1, 5
	copybytetovar wCageKeyDoorsArrayBank
	copyvartobyte wScriptArrayBank
	readarrayhalfword 0
	checkevent -1
	end
