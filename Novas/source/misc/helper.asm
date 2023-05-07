ReadScriptVarMonName::
	ld hl, wPartyMonNicknames - PKMN_NAME_LENGTH
	ld bc, PKMN_NAME_LENGTH
	ldh a, [hScriptVar]
	rst AddNTimes
	ld d, h
	ld e, l
	jp CopyName1

CheckTime::
	ld a, [wTimeOfDay]
	ld hl, .table
	ld e, 2
	call IsInArray
	inc hl
	ld c, [hl]
	ret

.table
	db MORN, 1 << MORN
	db DAY,  1 << DAY
	db NITE, 1 << NITE
	db -1, 0

LevelUpHappinessMod::
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $7f
	ld d, a
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp d
	ld c, HAPPINESS_GAINLEVEL
	jr nz, .ok
	ld c, HAPPINESS_GAINLEVELATHOME
.ok
	jpba ChangeHappiness
