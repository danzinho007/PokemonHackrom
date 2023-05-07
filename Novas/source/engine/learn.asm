LearnMove:
	call LoadTileMapToTempTileMap
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes

.loop
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	rst AddNTimes
	ld d, h
	ld e, l
	ld b, NUM_MOVES
; Get the first empty move slot.  This routine also serves to
; determine whether the Pokemon learning the moves already has
; all four slots occupied, in which case one would need to be
; deleted.
.next
	ld a, [hl]
	and a
	jr z, .learn
	inc hl
	dec b
	jr nz, .next
; If we're here, we enter the routine for forgetting a move
; to make room for the new move we're trying to learn.
	push de
	call ForgetMove
	pop de
	jp c, .cancel

	push hl
	push de
	ld [wd265], a

	ld b, a
	ld a, [wBattleMode]
	and a
	jr z, .not_disabled
	ld a, [wDisabledMove]
	cp b
	jr nz, .not_disabled
	xor a
	ld [wDisabledMove], a
	ld [wPlayerDisableCount], a
.not_disabled

	call GetMoveName
	ld a, 3
	ld [wcf64], a
	ld hl, Text_1_2_and_Poof ; 1, 2 and…
	call PrintText
	pop de
	pop hl

.learn
	ld a, [wPutativeTMHMMove]
	ld [hl], a
	ld bc, MON_PP - MON_MOVES
	add hl, bc

	push hl
	push de
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop de
	pop hl
	ld [hl], a
	
	ld hl, wMovesObtained
	ld a, [wPutativeTMHMMove]
	ld c, a
	ld b, SET_FLAG
	predef FlagAction

	ld a, [wBattleMode]
	and a
	jp z, .learned

	ld a, [wCurPartyMon]
	ld b, a
	ld a, [wCurBattleMon]
	cp b
	jp nz, .learned

	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jp nz, .learned

	ld h, d
	ld l, e
	ld de, wBattleMonMoves
	ld bc, NUM_MOVES
	rst CopyBytes
	ld bc, wPartyMon1PP - (wPartyMon1Moves + NUM_MOVES)
	add hl, bc
	ld de, wBattleMonPP
	ld bc, NUM_MOVES
	rst CopyBytes
	jp .learned

.cancel
	ld hl, Text_StopLearning ; Stop learning <MOVE>?
	call PrintText
	call YesNoBox
	jp c, .loop

	ld hl, Text_DidNotLearn ; <MON> did not learn <MOVE>.
	call PrintText
	ld b, 0
	ret

.learned
	ld hl, Text_LearnedMove ; <MON> learned <MOVE>!
	call PrintText
	ld b, 1
	ret

ForgetMove:
	push hl
	ld hl, Text_TryingToLearn
	call PrintText
	call YesNoBox
	pop hl
	ret c
	ld bc, -NUM_MOVES
	add hl, bc
	push hl
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	rst CopyBytes
	pop hl
.loop
	push hl
	ld hl, Text_ForgetWhich
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call MenuBox
	call UpdateSprites
	call ApplyTilemap
	hlcoord 5 + 2, 2 + 2
	ld a, SCREEN_WIDTH * 2
	ld [wListMoves_Spacing], a
	predef ListMoves
	; wMenuData3
	ld a, 4
	ld [w2DMenuCursorInitY], a
	ld a, 6
	ld [w2DMenuCursorInitX], a
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld [wMenuCursorY], a
	ld [wMenuCursorX], a
	ld a, 3
	ld [wMenuJoypadFilter], a
	ld a, $20
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	call DoMenuJoypadLoop
	push af
	call ExitMenu
	pop af
	pop hl
	bit 1, a
	jr nz, .cancel
	push hl
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	call IsHMMove
	pop bc
	pop de
	ld a, d
	jr c, .hmmove
	pop hl
	add hl, bc
	and a
	ret

.hmmove
	ld hl, Text_CantForgetHM
	call PrintText
	pop hl
	jp .loop

.cancel
	scf
	ret

.MenuHeader
	db $40
	db 2, 5
	db 12, 19
	dw 0
	db 1

Text_LearnedMove:
; <MON> learned <MOVE>!
	text_far LearnedMoveText
	start_asm
	ld de, SFX_DEX_FANFARE_50_79
	jp Text_PlaySFXAndPrompt

Text_ForgetWhich:
; Which move should be forgotten?
	text_jump ForgetWhichText

Text_StopLearning:
; Stop learning <MOVE>?
	text_jump StopLearningText

Text_DidNotLearn:
; <MON> did not learn <MOVE>.
	text_jump DidNotLearnText

Text_TryingToLearn:
; <MON> is trying to learn <MOVE>. But <MON> can't learn more than
; four moves. Delete an older move to make room for <MOVE>?
	text_jump TryingToLearnText

Text_1_2_and_Poof:
	text_far _ForgotText1 ; 1, 2 and…
	start_asm
	jr .function

.more_dots
	push bc
	ld c, 16
	call DelayFrames
	pop bc
	ld hl, .dots
	ret

.dots
	text "…@"
	start_asm
.function
	ld a, [wcf64]
	dec a
	ld [wcf64], a
	jr nz, .more_dots
	push de
	push bc
	ld c, 32
	call DelayFrames
	pop bc
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	pop de
	ld hl, .PoofForgot
	ret

.PoofForgot
; Poof! <MON> forgot <MOVE>. And…
	text_jump _ForgotText2

Text_CantForgetHM:
; HM moves can't be forgotten now.
	text_jump _CantForgetHMText
