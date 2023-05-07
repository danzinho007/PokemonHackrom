; rst vectors

SECTION "rst0", ROM0
NULL::
	di
	ldh [hCrashSavedA], a
	ld a, 0 ; because xor a destroys f
	jp Crash

SECTION "rst8", ROM0
	jp StackFarCall

DrawBattleHPBar::
; Draw an HP bar d tiles long at hl
; Fill it up to e pixels
	jpba _DrawBattleHPBar

	ds 1

SECTION "rst10", ROM0
	jp _GenericBankswitch

IsAPokemon::
; Return carry if species a is not a Pokemon.
; since every ID other than $00 and $FF is valid, we can simplify this function
IsValidID::
; check if an ID is not $00 or $FF; identical to IsAPokemon as long as all IDs $01-$FE are valid mons
	inc a
	cp 2
	dec a
	ret

SECTION "rst18", ROM0
	jp _AddNTimes

GetFarByteAndIncrement::
	call GetFarByte
	inc hl
GenericDummyFunction:: ;keeping this here since it's easy to find
	ret

SECTION "rst20", ROM0
	jp _Predef

BattleCommand_MoveDelay:
; Wait 40 frames.
	ld c, 40
	jp DelayFrames

SECTION "rst28", ROM0
	jp Jumptable

LoadStandardFont::
	jpba _LoadStandardFont

GenericDummyScript::
	end

SECTION "rst30", ROM0
	jp _CopyBytes

SetEnemyTurn::
	ld a, 1
	ldh [hBattleTurn], a
	ret

SECTION "rst38", ROM0
	di
	ldh [hCrashSavedA], a
	ld a, 1
	jp Crash
