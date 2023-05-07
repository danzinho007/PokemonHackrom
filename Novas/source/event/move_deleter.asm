MoveDeletion:
	ld hl, .IntroText
	call PrintText
	call YesNoBox
	jr c, .declined
	ld hl, .AskWhichMonText
	call PrintText
	callba SelectMonFromParty
	jr c, .declined
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Moves + 1
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	and a
	jr z, .onlyonemove
	ld hl, .AskWhichMoveText
	call PrintText
	call LoadStandardMenuHeader
	callba ChooseMoveToDelete
	push af
	call ReturnToMapWithSpeechTextbox
	pop af
	jr c, .declined
	ld a, [wMenuCursorY]
	push af
	ld a, [wCurSpecies]
	ld [wd265], a
	call GetMoveName
	ld hl, .ConfirmDeleteText
	call PrintText
	call YesNoBox
	pop bc
	jr c, .declined
	call .DeleteMove
	call WaitSFX
	ld de, SFX_MOVE_DELETED
	call PlayWaitSFX
	ld hl, .MoveDeletedText
	jp PrintText

.egg
	ld hl, .EggText
	jp PrintText

.declined
	ld hl, .DeclinedDeletionText
	jp PrintText

.onlyonemove
	ld hl, .OnlyOneMoveText
	jp PrintText

.OnlyOneMoveText
	; That #mon knows only one move.
	text_jump MoveDeleter_OneMove

.ConfirmDeleteText
	; Oh, make it forget @ ?
	text_jump MoveDeleter_Confirm

.MoveDeletedText
	; Done! Your #mon forgot the move.
	text_jump MoveDeleter_Done

.EggText
	; An EGG doesn't know any moves!
	text_jump MoveDeleter_Egg

.DeclinedDeletionText
	; No? Come visit me again.
	text_jump MoveDeleter_Cancelled

.AskWhichMoveText
	; Which move should it forget, then?
	text_jump MoveDeleter_WhichMove

.IntroText
	; Um… Oh, yes, I'm the MOVE DELETER. I can make #mon forget moves. Shall I make a #mon forget?
	text_jump MoveDeleter_Intro

.AskWhichMonText
	; Which #mon?
	text_jump MoveDeleter_WhichMon

.DeleteMove
	ld a, b
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, wPartyMon1Moves
	add hl, bc
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	push bc
	inc b
.loop
	ld a, b
	cp NUM_MOVES + 1
	jr z, .okay
	inc hl
	ld a, [hld]
	ld [hl], a
	inc hl
	inc b
	jr .loop

.okay
	xor a
	ld [hl], a
	pop bc

	ld a, b
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, wPartyMon1PP
	add hl, bc
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	inc b
.loop2
	ld a, b
	cp NUM_MOVES + 1
	jr z, .done
	inc hl
	ld a, [hld]
	ld [hl], a
	inc hl
	inc b
	jr .loop2

.done
	xor a
	ld [hl], a
	ret
