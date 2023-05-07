BattleRandom::
; _BattleRandom lives in another bank.

; It handles all RNG calls in the battle engine, allowing
; link battles to remain in sync using a shared PRNG.

	ld a, [wLinkMode]
	and a
	jr z, Random
	jpba LinkBattleRandom

Random::
	; just like the stock RNG, this exits with the value in [hRandomSub]
	; it also stores a random value in [hRandomAdd]
	push hl
	push bc
	push de
	call UpdateDividerCounters
	ld hl, wRNGState
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld a, e
	add a, a
	xor b
	ld b, a
	ld a, d
	rla
	ld l, c
	rl l
	ld h, b
	rl h
	sbc a
	and 1
	xor c
	ld c, a
	ld a, h
	xor d
	ld d, a
	ld a, l
	xor e
	ld e, a
	ld h, b
	ld l, c
	push hl
	ld h, d
	ld a, e
	rept 2
		sla e
		rl d
		rl c
		rl b
	endr
	xor e
	ld e, a
	ld a, h
	xor d
	ld d, a
	pop hl
	ld a, l
	xor c
	ld c, a
	ld a, h
	xor b
	ld hl, wRNGState
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hl], e
	ldh a, [rDIV]
	add a, [hl]
	ldh [hRandomAdd], a
	ld a, [hli]
	inc hl
	inc hl
	sub [hl]
	ldh [hRandomSub], a
	pop de
	pop bc
	pop hl
	ret

UpdateDividerCounters:
	ldh a, [rDIV]
	ld hl, wRNGCumulativeDividerMinus
	sbc [hl]
	ld [hld], a
	ldh a, [rDIV]
	adc [hl]
	ld [hld], a
	ret nc
	inc [hl]
	ret

AdvanceRNGState:
	ld hl, wRNGState
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ldh a, [rDIV]
	rra
	jr nc, .try_upper
.try_lower
	ld a, h
	cp d
	ld a, l
	jr nz, .lower
	cp e
	jr nz, .lower
.upper
	xor c
	ld c, a
	ld a, h
	xor b
	jr .done
.try_upper
	ld a, h
	cp b
	ld a, l
	jr nz, .upper
	cp c
	jr nz, .upper
.lower
	xor e
	ld e, a
	ld a, h
	xor d
	ld d, a
	ld a, b
.done
	ld hl, wRNGState
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hl], e
	ret

RandomRange::
	push hl
	ld hl, Random
	call _RandomRange
	pop hl
	ret

BattleRandomRange::
	push hl
	ld hl, BattleRandom
	call _RandomRange
	pop hl
	ret

_RandomRange::
; Return a random number between 0 and a (non-inclusive).

	push bc
	ld c, a

	; b = $100 % c
	xor a
	sub c
.mod
	sub c
	jr nc, .mod
	add c
	ld b, a

	; Get a random number
	; from 0 to $ff - b.
	push bc
.loop
	call _hl_
	ld c, a
	add b
	jr c, .loop
	ld a, c
	pop bc

	call SimpleDivide

	pop bc
	ret

RandomPercentage:
	call Random
	cp 200
	jr nc, .not_in_range
	srl a
	ret
.not_in_range
	cp 250
	jr nc, RandomPercentage
	ldh a, [hRandomAdd]
	rra
	ldh a, [hRandomSub]
	rla
	sub LOW(400)
	ret
