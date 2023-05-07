ItemfinderFunction:
	callba CheckForHiddenItems
	and a
	ld hl, .Script_FoundSomething
	jr z, .got_script_pointer
	dec a
	ld hl, .Script_NothingOnMap	
	jr z, .got_script_pointer
	ld hl, .Script_FoundNothing
.got_script_pointer
	call QueueScript
	ld a, 1
	ld [wItemEffectSucceeded], a
	ret

.ItemfinderSound
	ld c, 4
.sfx_loop
	push bc
	ld de, SFX_SECOND_PART_OF_ITEMFINDER
	call WaitPlaySFX
	ld de, SFX_TRANSACTION
	call WaitPlaySFX
	pop bc
	dec c
	jr nz, .sfx_loop
	ret

.Script_FoundSomething:
	reloadmappart
	special UpdateTimePals
	callasm .ItemfinderSound
	farwritetext ItemfinderFoundItemText
	closetextend

.Script_FoundNothing:
	reloadmappart
	special UpdateTimePals
	farwritetext ItemfinderNotRespondingText
	closetextend

.Script_NothingOnMap:
	reloadmappart
	special UpdateTimePals
	farwritetext ItemfinderCantFindAnyItemsInAreaText
	closetextend
