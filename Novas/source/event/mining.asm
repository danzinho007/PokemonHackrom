MiningScript::
	killsfx
	checkflag ENGINE_POKEMON_MODE
	sif true
		end
	opentext
	; Check mining pick
	checkitem IRON_PICKAXE
	sif true, then
		copybytetovar wMiningPickaxeMode
	selse
		writebyte 2
	sendif
	scriptjumptable .MiningModes
	sif false, then
		copybytetovar wIronPickaxeStepCount
		multiplyvar -1
		addvar 250
		copyvartobyte wScriptBuffer
		checkitem IRON_PICKAXE
		sif true, then
			copybytetovar wMiningPickaxeMode
		selse
			writebyte 2 ;pretend we're always in mode 3 if we don't have the Iron Pickaxe
		sendif
		playsound SFX_READ_TEXT_2
		loadarray .MiningFailureTextsArray
		readarrayhalfword 0
		writebyte 0
		jumptext -1
	selse
		copyvartobyte wScriptBuffer
	sendif

	;We have mining pick
	playwaitsfx SFX_BEAT_UP
	scall ExtractItem
	sif false, then
		writetext NoItemExtracted
	selse
		; save the obtained item in case our bag is full
		copyvartobyte wSavedMiningItem
		; special check for fossil
		sif =, FOSSIL, then
			; check for fossil case
			checkitem FOSSIL_CASE
			sif false, then
				writebyte 2
			selse
				writehalfword wFossilCaseCount
				copyhalfwordvartovar
				sif >, FOSSIL_CASE_SIZE - 1, then
					writebyte 1
				selse
					addvar 1
					copyvartohalfwordvar
					addhalfwordvartovar
					random 4
					copyvartohalfwordvar
					addhalfwordtohalfwordvar 1
					loadhalfwordvar $ff
					writebyte 0
				sendif
			sendif
			writetext ReceivedFossilText
			loadarray .FossilTextArray
			readarrayhalfword 0
			sif false, then
				killsfx
				playwaitsfx SFX_ITEM
			selse
				buttonsound
			sendif
			writetext -1
			sif true, then
				writebyte 0
			selse
				writebyte 1
			sendif
		selse
			verbosegiveitem SPECIAL_ITEM, 1
		sendif
		
		sif true, then
			waitbutton
			loadvar wSavedMiningItem, 0
		selse
			closetextend
		sendif
	sendif
	copybytetovar wScriptBuffer
	sif =, 1, then
		takeitem MINING_PICK, 1
	selse
		loadvar wIronPickaxeStepCount, 0
	sendif

	writebyte 1
	givecraftingEXP CRAFT_MINING
	closetextend

.MiningModes:
	dw .onlyCheckIronPick
	dw .smartCheckBothPicks
	dw .onlyCheckNormalPicks

.onlyCheckIronPick:
; iron pick is already before call
	writebyte 250
	comparevartobyte wIronPickaxeStepCount
	sif true
		writebyte 2
	end

.smartCheckBothPicks:
	scall .onlyCheckIronPick
	sif false
		; checkitem from fallthrough

; fallthrough
.onlyCheckNormalPicks:
	checkitem MINING_PICK
	; sif true, writebyte 1 would be a noop
	end

.MiningFailureTextsArray:
	dw IronPickaxeNotChargedEnoughText
.MiningFailureTextsArrayEntrySizeEnd:
	dw IronPickaxeNotChargedEnoughAndNoMiningPickText
	dw NoMiningPickText

.FossilTextArray:
	dw PutFossilInCaseText
.FossilTextArrayEntrySizeEnd:
	dw NoRoomForFossilText
	dw NoFossilCaseText

ExtractItem:
	copybytetovar wSavedMiningItem
	sif true
		end
	copybytetovar wMiningLevel
	divideby 2
	loadarray MiningPickItemTable, 1
	variablestablerandom VSR_MINING, 100
	readarray -1
	sif !=, SPECIAL_ITEM
		end
	copybytetovar wMapGroup
	addvar -1
	loadarray MiningSpecialItems, 1
	readarray 0
	end

IronPickaxeNotChargedEnoughText:
	ctxt "The Iron Pickaxe"
	line "is not charged"
	cont "enough.@"

; fallthrough
WalkNumberOfStepsToRechargeText:
	ctxt ""
	para "Walk @"
	deciram wScriptBuffer, 1, 3
	ctxt " more"

	line "step@"
	start_asm
	ld hl, .IronPickaxeNotChargedEnoughContinueText
	ld a, [wScriptBuffer]
	dec a
	ret z
	ld a, "s"
	ld [bc], a
	inc bc
	ret
.IronPickaxeNotChargedEnoughContinueText:
	ctxt " for it to"
	cont "recharge."
	done

IronPickaxeNotChargedEnoughAndNoMiningPickText:
	ctxt "The Iron Pickaxe"
	line "is not charged"
	para "enough, and there"
	line "are no Mining"
	para "Picks to mine with"
	line "either.@"
	text_jump WalkNumberOfStepsToRechargeText

NoMiningPickText:
	ctxt "You need a Mining"
	line "Pick to mine."
	done

NoItemExtracted::
	ctxt "Unable to extract"
	line "anything."
	sdone

ReceivedFossilText:
	ctxt "<PLAYER> received"
	line "a Fossil!"
	done

PutFossilInCaseText:
	ctxt "<PLAYER> put the"
	line "Fossil in the"
	cont "Fossil Case."
	done

NoRoomForFossilText:
	ctxt "But the Fossil"
	line "Case is full<...>"
	sdone

NoFossilCaseText:
	ctxt "But <PLAYER> doesn't"
	line "have a Fossil"
	cont "Case<...>"
	sdone

MiningPickItemTable: ;Every 2 levels shifts the table up, totaling in 150 items
	rept 29
		db NO_ITEM
	endr
	rept 7
		db GOLD_DUST
	endr
	rept 10
		db HEART_SCALE
	endr
	rept 13
		db COAL
		db ORE
	endr
	db HARD_STONE
	db REVIVE
	db SPECIAL_ITEM
	db SPECIAL_ITEM
	rept 5
		db EVERSTONE
	endr
	db HARD_STONE
	db SPECIAL_ITEM
	db KINGS_ROCK
	db SPECIAL_ITEM
	db REVIVE
	db SPECIAL_ITEM
	rept 2 ; 89
		db COAL
		db ORE
	endr
	rept 4
		db HEART_SCALE
	endr
	db FOSSIL
	db LEAF_STONE
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db SHINY_STONE
	db SUN_STONE
	db DAWN_STONE
	db DUSK_STONE
	rept 8
		db COAL
		db ORE
	endr
	db HARD_STONE
	db CHARCOAL
	db KINGS_ROCK
	db KINGS_ROCK
	db REVIVE
	db REVIVE
	rept 9
		db SPECIAL_ITEM
	endr
	db LIGHT_CLAY
	db REVIVE
	db REVIVE
	db MAX_REVIVE
	db NUGGET
	db NUGGET
	db LEAF_STONE
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db SHINY_STONE
	db SUN_STONE
	db DAWN_STONE
	db DUSK_STONE
	db BIG_NUGGET
	db FOSSIL
	db FOSSIL

MiningSpecialItems: ;Ordered by bank
	db NO_ITEM ;1
	db ICY_ROCK ;2
	db COAL ;3
	db COAL ;4
	db LEAF_STONE ;5
	db WATER_STONE ;6
	db NO_ITEM ;7
	db ORE ;8
	db HARD_STONE ;9
	db ICY_ROCK ;10
	db NO_ITEM ;11
	db ENERGYPOWDER ;12
	db ICY_ROCK ;13
	db ICY_ROCK ;14
	db ICY_ROCK ;15
	db ICY_ROCK ;16
	db DAMP_ROCK ;17
	db NO_ITEM ;18
	db COAL ;19
	db NO_ITEM ;20
	db GOLD_DUST ;21
	db SOFT_SAND ;22
	db SMOOTH_ROCK ;23
	db SOFT_SAND ;24
	db BRICK_PIECE ;25
	db SMOOTH_ROCK ;26
	db DAMP_ROCK ;27
	db ICY_ROCK ;28
	db HEAT_ROCK ;29
	db NO_ITEM ;30
	db WATER_STONE ;31
	db GOLD_DUST ;32
	db ENERGYPOWDER;33
	db SUN_STONE;34
	db FIRE_STONE;35
	db FIRE_STONE;36
	db LIGHT_CLAY;37
	db ICY_ROCK;38
	db COAL;39
	db COAL;40
	db ORE;41
	;Rijon
	db DAMP_ROCK ;42
	db HARD_STONE ;43
	db HARD_STONE ;44
	db EVERSTONE ;45
	db NO_ITEM ;46
	db ENERGYPOWDER ;47
	db ENERGYPOWDER ;48
	db DUSK_STONE ;49
	db NO_ITEM ;50
	db HEAT_ROCK ;51
	db GOLD_DUST ;52
	db NO_ITEM ;53
	db NO_ITEM ;54
	db NO_ITEM ;55
	db NO_ITEM ;56
	db NO_ITEM ;57
	db DAMP_ROCK ;58
	db HARD_STONE ;59
	db HARD_STONE ;60
	db COAL ;61
	db HEAT_ROCK ;62
	db NO_ITEM ;63
	db ORE ;64
	db ENERGYPOWDER ;65
	db NO_ITEM ;66
	db NO_ITEM ;67
	db NO_ITEM ;68
	db COAL ;69
	db HARD_STONE ;70
	db GOLD_DUST ;71
	db DAMP_ROCK ;72
	db GOLD_DUST ;73
	db HARD_STONE ;74
	db ICY_ROCK ;75
	db NO_ITEM ;76
	db LEAF_STONE ;77
	db NO_ITEM ;78
	db MOON_STONE ;79
	db NO_ITEM ;80
	db KINGS_ROCK ;81
	db NO_ITEM ;82
	db NO_ITEM ;83
	db THUNDERSTONE ;84
	db NO_ITEM ;85
	db NO_ITEM ;86
	db NO_ITEM ;87
	db FIRE_STONE ;88
	db DAWN_STONE ;89
	db NO_ITEM ;90
	db NO_ITEM ;91
