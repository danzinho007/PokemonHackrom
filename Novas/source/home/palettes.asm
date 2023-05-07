ForceUpdateCGBPalsIfMapSetupWarp::
	ldh a, [hMapEntryMethod]
	cp MAPSETUP_WARP
	ret nz
	callba ApplyPals
	jr ForceUpdateCGBPals

UpdatePals::
; update bgp data from wBGPals
; update obp data from wOBPals
; return carry if successful
; any pals to update?
	ldh a, [hCGBPalUpdate]
	and a
	ret z
	; fallthrough

ForceUpdateCGBPals::
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals)
	ldh [rSVBK], a

	ld hl, wBGPals ; 5:d080

; copy 8 pals to bgpd
	ld a, %10000000 ; auto increment, index 0
	ldh [rBGPI], a
	lb bc, 4, LOW(rBGPD)
.bgp
	rept 2 palettes
		ld a, [hli]
		ldh [c], a
	endr
	dec b
	jr nz, .bgp

; hl is now 5:d0c0 wOBPals

; copy 8 pals to obpd
	ld a, %10000000 ; auto increment, index 0
	ldh [rOBPI], a
	lb bc, 4, LOW(rOBPD)
.obp
	rept 2 palettes
		ld a, [hli]
		ldh [c], a
	endr
	dec b
	jr nz, .obp

	pop af
	ldh [rSVBK], a

; clear pal update queue
	xor a
	ldh [hCGBPalUpdate], a

	scf
	ret

DmgToCgbBGPals::
; exists to forego reinserting cgb-converted image data

; input: a -> bgp

	ldh [rBGP], a
	push hl
	push de
	push bc
	push af
	ldh a, [rSVBK]
	push af

	ld a, 5 ; gfx
	ldh [rSVBK], a

; copy & reorder bg pal buffer
	ld hl, wBGPals ; to
	ld de, wOriginalBGPals ; from
; order
	ldh a, [rBGP]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, 1
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rSVBK], a
	jp PopOffRegsAndReturn

DmgToCgbObjPals::
; exists to forego reinserting cgb-converted image data

; input: d -> obp1
;        e -> obp2

	ld a, e
	ldh [rOBP0], a
	ld a, d
	ldh [rOBP1], a

	push hl
	push de
	push bc
	ldh a, [rSVBK]
	push af

	ld a, 5
	ldh [rSVBK], a

; copy & reorder obj pal buffer
	ld hl, wOBPals ; to
	ld de, wOriginalOBJPals ; from
; order
	ldh a, [rOBP0]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, 1
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rSVBK], a
	pop bc
	pop de
	pop hl
	ret

DmgToCgbObjPal0::
	ldh [rOBP0], a
	push hl
	push de
	push bc
	push af

	ldh a, [rSVBK]
	push af
	ld a, 5 ; gfx
	ldh [rSVBK], a

	ld hl, wOBPals
	ld de, wOriginalOBJPals
	ldh a, [rOBP0]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, 1
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rSVBK], a

	jp PopOffRegsAndReturn

DmgToCgbObjPal1::
	ldh [rOBP1], a
	push hl
	push de
	push bc
	push af

	ldh a, [rSVBK]
	push af
	ld a, 5 ; gfx
	ldh [rSVBK], a

	ld hl, wOBPals + 1 palettes
	ld de, wOriginalOBJPals + 1 palettes
	ldh a, [rOBP1]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, 1
	ldh [hCGBPalUpdate], a

	pop af
	ldh [rSVBK], a

	jp PopOffRegsAndReturn

CopyPals::
; copy c palettes in order b from de to hl

	push bc
	ld c, 4 ; NUM_PAL_COLORS
.loop
	push de
	push hl

; get pal color
	ld a, b
	and %11 ; color
; 2 bytes per color
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]

; dest
	pop hl
; write color
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
; next pal color
	srl b
	srl b
; source
	pop de
; done pal?
	dec c
	jr nz, .loop

; de += 8 (next pal)
	ld a, 1 palettes ; NUM_PAL_COLORS * 2 ; bytes per pal
	add e
	jr nc, .ok
	inc d
.ok
	ld e, a

; how many more pals?
	pop bc
	dec c
	jr nz, CopyPals
	ret

ClearVBank1::
	vbk BANK(vStandingFrameTiles)

	ld hl, vStandingFrameTiles
	ld bc, VRAM_End - vStandingFrameTiles
	xor a
	call ByteFill

	vbk BANK(vObjTiles)
	ret

Special_ReloadSpritesNoPalettes::
	ldh a, [rSVBK]
	push af
	wbk BANK(wBGPals)
	ld hl, wBGPals
	ld bc, $40 + $10
	xor a
	call ByteFill
	pop af
	ldh [rSVBK], a
	ld a, 1
	ldh [hCGBPalUpdate], a
	jp DelayFrame

ScrollingMenu_UpdatePalettes:
	ld hl, wVramState
	bit 0, [hl]
	jp nz, UpdateTimePals
	; fallthrough

SetPalettes::
; Inits the Palettes
	push de
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	pop de
	ret

ClearPalettes::
; Make all palettes white
	ld a, BANK(wBGPals)
	call StackCallInWRAMBankA

; Fill wBGPals and wOBPals with $ffff (white)
	ld hl, wBGPals
	ld bc, 16 palettes
	ld a, $ff
	call ByteFill
; Request palette update
	ld a, 1
	ldh [hCGBPalUpdate], a
	ret

FarCallSwapTextboxPalettes::
	jpba SwapTextboxPalettes

FarCallScrollBGMapPalettes::
	jpba ScrollBGMapPalettes

UpdateTimePals::
	jpba _UpdateTimePals
