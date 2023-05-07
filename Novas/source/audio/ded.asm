DED_RATE = 10485
DED_RATE_NORMAL = 1048576 / DED_RATE
DED_RATE_FAINTED = DED_RATE_NORMAL * 10 / 9

_PlayDEDCry::
	ld c, LOW(DED_RATE_NORMAL) ; playback rate
	ld a, e
	and a
	jr z, .notfainted
	ld c, DED_RATE_FAINTED
.notfainted
	call WaitSFX
	ldh a, [rSVBK]
	push af
	ld a, 2 ; BANK(wDEDTempSamp)
	ldh [rSVBK], a
	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, 1 << VBLANK | 1 << TIMER
	ldh [rIE], a
	ldh a, [rNR50]
	push af
	ldh a, [rNR51]
	push af
	ldh a, [hVBlank]
	push af
	ld a, $77 ; full volume
	ldh [rNR50], a
	xor a
	ldh [rNR51], a
	ldh [rNR30], a
	ld a, $20
	ldh [rNR32], a
	ldh a, [rTIMA]
	push af
	xor a
	sub c
	ldh [rTMA], a
	ldh [rTIMA], a
	xor a
	sla c
	sub c
	ldh [rNR33], a
	ld c, %01000100 ; ch3 only
	ld a, [wOptions]
	bit 5, a ; stereo
	jr z, .mono
	ld a, [wCryTracks]
	and a
	jr z, .mono
	and c
	ld c, a
.mono
	ld a, c
	ldh [hDEDNR51Mask], a
	di
	xor a
	ldh [hDEDCryFlag], a
	ld a, 7
	ldh [hVBlank], a
	call PlayDEDSamples
	ei
	xor a
	ldh [rNR51], a
	ldh [rNR30], a
	ldh [rTMA], a
	pop af
	ldh [rTIMA], a
	ld a, (1 << rTAC_ON) | rTAC_65536_HZ
	ldh [rTAC], a
	pop af
	ldh [hVBlank], a
	pop af
	ldh [rNR51], a
	pop af
	ldh [rNR50], a
	pop af
	ldh [rIE], a
	pop af
	ldh [rSVBK], a
	scf
	ret

.notfound
	and a
	ret
