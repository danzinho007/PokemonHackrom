BattleCommand_PainSplit:
	call CheckHiddenOpponent
	jp nz, FailedGeneric

	call AnimateCurrentMove

	; Get HP
	ldh a, [hBattleTurn]
	and a
	ld de, wBattleMonHP + 1
	ld hl, wEnemyMonHP + 1
	jr z, .got_hp
	push de
	ld d, h
	ld e, l
	pop hl

.got_hp
	; Set bc to [de] - [hl] (user HP - target HP)
	ld a, [de]
	sub [hl]
	ld c, a
	dec de
	dec hl
	ld a, [de]
	sbc [hl]
	jr c, .target_has_more
	ld b, a
	or c
	jr z, .done ; do nothing, they're equal

	; User has more
.share
	; updates HP anim buffers
	push bc
	callba GetMaxHP
	pop bc
	srl b
	rr c
	push bc
	jr nc, .even_share
	inc bc ; HP difference is odd, so round down result (HP decrease is done first)
.even_share
	callba SubtractHPFromUser
	call UpdateUserInParty
	call SwitchTurn
	callba GetMaxHP
	pop bc
	callba RestoreUserHP
	call UpdateUserInParty
	call SwitchTurn
.done
	ld hl, SharedPainText ; text is turn agnostic, so turn swap if target>user is OK
	jp StdBattleTextBox

.target_has_more
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	call SwitchTurn
	call .share
	jp SwitchTurn
