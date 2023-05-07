	const_def
	const DAYCARETEXT_MAN_INTRO
	const DAYCARETEXT_MAN_EGG
	const DAYCARETEXT_LADY_INTRO
	const DAYCARETEXT_LADY_EGG
	const DAYCARETEXT_WHICH_ONE
	const DAYCARETEXT_DEPOSIT
	const DAYCARETEXT_CANT_BREED_EGG
	const DAYCARETEXT_LAST_MON
	const DAYCARETEXT_LAST_ALIVE_MON
	const DAYCARETEXT_COME_BACK_LATER
	const DAYCARETEXT_CANT_ACCEPT_THIS
	const DAYCARETEXT_GENIUSES
	const DAYCARETEXT_ASK_WITHDRAW
	const DAYCARETEXT_WITHDRAW
	const DAYCARETEXT_TOO_SOON
	const DAYCARETEXT_PARTY_FULL
	const DAYCARETEXT_NOT_ENOUGH_MONEY
	const DAYCARETEXT_OH_FINE
	const DAYCARETEXT_COME_AGAIN
	const DAYCARETEXT_13
	const DAYCARETEXT_MAN_EGG_EXISTS
	const DAYCARETEXT_LADY_EGG_EXISTS

Special_DayCareMan:
	ld a, DAYCARETEXT_MAN_EGG_EXISTS
	call TryPrintingEggExistsMessage
	ret nz
	ld hl, wDaycareMan
	bit 0, [hl]
	jr nz, .AskWithdrawMon
	ld a, DAYCARETEXT_MAN_INTRO
	call DayCareCoupleIntroText
	jr c, .cancel
	call DayCareAskDepositPokemon
	jr c, .print_text
	callba DepositMonWithDaycareMan
	ld hl, wDaycareMan
	set 0, [hl]
	call DayCare_DepositPokemonText
	jp DayCare_InitBreeding

.AskWithdrawMon
	callba GetBreedMon1LevelGrowth
	ld hl, wBreedMon1Nick
	call GetPriceToRetrieveBreedmon
	call DayCare_AskWithdrawBreedMon
	jr c, .print_text
	callba RetrievePokemonFromDaycareMan
	call DayCare_TakeMoney_PlayCry
	ld hl, wDaycareMan
	res 0, [hl]
	res 5, [hl]
	jr .cancel

.print_text
	call PrintDayCareText

.cancel
	ld a, DAYCARETEXT_13
	jp PrintDayCareText

Special_DayCareLady:
	ld a, DAYCARETEXT_LADY_EGG_EXISTS
	call TryPrintingEggExistsMessage
	ret nz
	ld hl, wDaycareLady
	bit 0, [hl]
	jr nz, .AskWithdrawMon
	ld a, DAYCARETEXT_LADY_INTRO
	call DayCareCoupleIntroText
	jr c, .cancel
	call DayCareAskDepositPokemon
	jr c, .print_text
	callba DepositMonWithDaycareLady
	ld hl, wDaycareLady
	set 0, [hl]
	call DayCare_DepositPokemonText
	jp DayCare_InitBreeding

.AskWithdrawMon
	callba GetBreedMon2LevelGrowth
	ld hl, wBreedMon2Nick
	call GetPriceToRetrieveBreedmon
	call DayCare_AskWithdrawBreedMon
	jr c, .print_text
	callba RetrievePokemonFromDaycareLady
	call DayCare_TakeMoney_PlayCry
	ld hl, wDaycareLady
	res 0, [hl]
	ld hl, wDaycareMan
	res 5, [hl]
	jr .cancel

.print_text
	call PrintDayCareText

.cancel
	ld a, DAYCARETEXT_13
	jp PrintDayCareText

DayCareCoupleIntroText:
	bit 7, [hl]
	jr nz, .okay
	inc a
	set 7, [hl]
.okay
	call PrintDayCareText
	jp YesNoBox

TryPrintingEggExistsMessage:
	ld hl, wDaycareMan
	bit 6, [hl]
	ret z
	call PrintDayCareText
	ld a, 1
	and a
	ret

DayCareAskDepositPokemon:
	ld a, [wPartyCount]
	cp 2
	jr c, .OnlyOneMon
	ld a, DAYCARETEXT_WHICH_ONE
	call PrintDayCareText
	ld b, 6
	callba SelectTradeOrDaycareMon
	jr c, .Declined
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .Egg
	callba CheckForSpecialGiftMon
	jr c, .specialGiftMon
	callba CheckIfOnlyAliveMonIsCurPartyMon
	jr c, .OutOfUsableMons
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNick
	and a
	ret

.Declined
	ld a, DAYCARETEXT_COME_AGAIN
	scf
	ret

.Egg
	ld a, DAYCARETEXT_CANT_BREED_EGG
	scf
	ret

.OnlyOneMon
	ld a, DAYCARETEXT_LAST_MON
	scf
	ret

.OutOfUsableMons
	ld a, DAYCARETEXT_LAST_ALIVE_MON
	scf
	ret

.specialGiftMon
	ld a, DAYCARETEXT_CANT_ACCEPT_THIS
	scf
	ret

DayCare_DepositPokemonText:
	ld a, DAYCARETEXT_DEPOSIT
	call PrintDayCareText
	ld a, [wCurPartySpecies]
	call PlayCry
	ld a, DAYCARETEXT_COME_BACK_LATER
	jp PrintDayCareText

DayCare_AskWithdrawBreedMon:
	ld a, [wStringBuffer2 + 1]
	and a
	jr nz, .grew_at_least_one_level
	ld a, DAYCARETEXT_PARTY_FULL
	call PrintDayCareText
	call YesNoBox
	jr c, .refused
	jr .check_money

.grew_at_least_one_level
	ld a, DAYCARETEXT_GENIUSES
	call PrintDayCareText
	call YesNoBox
	jr c, .refused
	ld a, DAYCARETEXT_ASK_WITHDRAW
	call PrintDayCareText
	call YesNoBox
	jr c, .refused

.check_money
	ld de, wMoney
	ld bc, wStringBuffer2 + 2
	callba CompareMoney
	jr c, .not_enough_money
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	and a
	ret

.refused
	ld a, DAYCARETEXT_COME_AGAIN
	scf
	ret

.not_enough_money
	ld a, DAYCARETEXT_OH_FINE
	scf
	ret

.PartyFull
	ld a, DAYCARETEXT_NOT_ENOUGH_MONEY
	scf
	ret

DayCare_TakeMoney_PlayCry:
	ld bc, wStringBuffer2 + 2
	ld de, wMoney
	callba TakeMoney
	ld a, DAYCARETEXT_WITHDRAW
	call PrintDayCareText
	ld a, [wCurPartySpecies]
	call PlayCry
	ld a, DAYCARETEXT_TOO_SOON
	jp PrintDayCareText

GetPriceToRetrieveBreedmon:
	ld a, b
	ld [wStringBuffer2], a
	ld a, d
	ld [wStringBuffer2 + 1], a
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	rst CopyBytes
	ld hl, 0
	ld bc, 100
	ld a, [wStringBuffer2 + 1]
	rst AddNTimes
	ld de, 100
	add hl, de
	xor a
	ld [wStringBuffer2 + 2], a
	ld a, h
	ld [wStringBuffer2 + 3], a
	ld a, l
	ld [wStringBuffer2 + 4], a
	ret

PrintDayCareText:
	ld e, a
	ld d, 0
	ld hl, .TextTable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText

.TextTable
	dw .DayCareChickIntro ; DAYCARETEXT_MAN_INTRO
	dw .DayCareChickOddEgg ; DAYCARETEXT_MAN_EGG
	dw .DayCareDudeIntro ; DAYCARETEXT_LADY_INTRO
	dw .DayCareDudeOddEgg ; DAYCARETEXT_LADY_EGG
	dw .WhichOne ; DAYCARETEXT_WHICH_ONE
	dw .OkayIllRaiseYourMon ; DAYCARETEXT_DEPOSIT
	dw .CantAcceptEgg ; DAYCARETEXT_CANT_BREED_EGG
	dw .JustOneMon ; DAYCARETEXT_LAST_MON
	dw .LastHealthyMon ; DAYCARETEXT_LAST_ALIVE_MON
	dw .ComeBackForItLater ; DAYCARETEXT_COME_BACK_LATER
	dw .CantAcceptThis ; DAYCARETEXT_CANT_ACCEPT_THIS
	dw .AreWeGeniusesOrWhat ; DAYCARETEXT_GENIUSES
	dw .AskRetrieveMon ; DAYCARETEXT_ASK_WITHDRAW
	dw .PerfectHeresYourMon ; DAYCARETEXT_WITHDRAW
	dw .GotBackMon ; DAYCARETEXT_TOO_SOON
	dw .ImmediatelyWithdrawMon ; DAYCARETEXT_PARTY_FULL
	dw .PartyFull ; DAYCARETEXT_NOT_ENOUGH_MONEY
	dw .NotEnoughMoney ; DAYCARETEXT_OH_FINE
	dw .OhFineThen ; DAYCARETEXT_COME_AGAIN
	dw .ComeAgain ; DAYCARETEXT_13
	dw .DayCareChickFoundEgg ; DAYCARETEXT_MAN_EGG_EXISTS
	dw .DayCareDudeFoundEgg ; DAYCARETEXT_LADY_EGG_EXISTS

.DayCareChickIntro
	; I'm the DAY-CARE MAN. Want me to raise a #mon?
	text_jump DaycareChick_Intro

.DayCareChickOddEgg
	; I'm the DAY-CARE MAN. Do you know about EGGS? I was raising #mon with my wife, you see. We were shocked to find an EGG! How incredible is that? So, want me to raise a #mon?
	text_jump DaycareChick_Egg

.DayCareDudeIntro
	; I'm the DAY-CARE LADY. Should I raise a #mon for you?
	text_jump DaycareDude_Intro

.DayCareDudeOddEgg
	; I'm the DAY-CARE LADY. Do you know about EGGS? My husband and I were raising some #mon, you see. We were shocked to find an EGG! How incredible could that be? Should I raise a #mon for you?
	text_jump DaycareDude_Egg

.WhichOne
	; What should I raise for you?
	text_jump Daycare_WhichOne

.JustOneMon
	; Oh? But you have just one #mon.
	text_jump Daycare_JustOneMon

.CantAcceptEgg
	; Sorry, but I can't accept an EGG.
	text_jump Daycare_CantAcceptEgg

.CantAcceptThis
	; Sorry, but I can't accept this #mon.
	text_jump Daycare_CantAcceptThis

.LastHealthyMon
	; If you give me that, what will you battle with?
	text_jump Daycare_LastHealthyMon

.OkayIllRaiseYourMon
	; OK. I'll raise your @ .
	text_jump Daycare_OK

.ComeBackForItLater
	; Come back for it later.
	text_jump Daycare_ComeBackLater

.AreWeGeniusesOrWhat
	; Are we geniuses or what? Want to see your @ ?
	text_jump Daycare_Geniuses

.AskRetrieveMon
	; Your @ has grown a lot. By level, it's grown by @ . If you want your #mon back, it will cost ¥@ .
	text_jump Daycare_AskRetrieve

.PerfectHeresYourMon
	; Perfect! Here's your #mon.
	text_jump Daycare_HeresYourMon

.GotBackMon
	; got back @ .
	text_jump Daycare_GotBack

.ImmediatelyWithdrawMon
	; Huh? Back already? Your @ needs a little more time with us. If you want your #mon back, it will cost ¥100.
	text_jump Daycare_BackAlready

.PartyFull
	; You have no room for it.
	text_jump Daycare_PartyFull

.NotEnoughMoney
	; You don't have enough money.
	text_jump Daycare_NoMoney

.OhFineThen
	; Oh, fine then.
	text_jump Daycare_FineThen

.ComeAgain
	; Come again.
	text_jump Daycare_ComeAgain

.DayCareChickFoundEgg
	text_jump DayCare_ChickFoundEgg

.DayCareDudeFoundEgg
	text_jump DayCare_DudeFoundEgg

Special_DayCareManOutside:
	ld hl, wDaycareMan
	bit 6, [hl]
	jr nz, .AskGiveEgg
	ld hl, .NotYet
	jp PrintText

.AskGiveEgg
	ld hl, .IntroText
	call PrintText
	call YesNoBox
	jr c, .Declined
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	call DayCare_GiveEgg
	ld hl, wDaycareMan
	res 6, [hl]
	call DayCare_InitBreeding
	ld hl, .GotEggText
	call PrintText
	ld de, SFX_GET_EGG_FROM_DAYCARE_LADY
	call PlaySFX
	ld c, 120
	call DelayFrames
	xor a
	ldh [hScriptVar], a
	ret

.Declined
	ld hl, .DoYouWantToLeaveItAsIsText
	call PrintText
	call YesNoBox	
	ld hl, .EggWasLeftToBeText
	jr c, .eggWasLeftInGarden
	ld hl, .IllKeepItThanksText
	call PrintText
	xor a
	ldh [hScriptVar], a
	ret

.PartyFull
	ld hl, .PartyFullText
.eggWasLeftInGarden
	call PrintText
	ld a, 1
	ldh [hScriptVar], a
	ret

.NotYet
	; Not yet…
	text_jump Daycare_NotYet

.IntroText
	; Ah, it's you! We were raising your #mon, and my goodness, were we surprised! Your #mon had an EGG! We don't know how it got there, but your #mon had it. You want it?
	text_jump DaycareEgg_Intro

.GotEggText
	; received the EGG!
	text_jump DaycareEgg_Received

.IllKeepItThanksText
	; Well then, I'll keep it. Thanks!
	text_jump DaycareEgg_KeepIt

.PartyFullText
	; You have no room in your party. Come back later.
	text_jump DaycareEgg_PartyFull

.DoYouWantToLeaveItAsIsText
	text_jump DoYouWantToLeaveItAsIsText

.EggWasLeftToBeText
	text_jump EggWasLeftToBeText

DayCare_GiveEgg:
	ld a, [wEggMonLevel]
	ld [wCurPartyLevel], a
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nc, .PartyFull
	inc a
	ld [hl], a

	ld c, a
	ld b, 0
	add hl, bc
	ld a, EGG
	ld [hli], a
	ld a, [wEggMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	ld a, -1
	ld [hl], a

	ld hl, wPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggNick
	rst CopyBytes

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggOT
	rst CopyBytes

	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call DayCare_GetCurrentPartyMember
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	rst CopyBytes

	call GetBaseData
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_ID + 1
	add hl, bc
	push hl
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push bc
	ld b, 0
	predef CalcPkmnStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret

.PartyFull
	scf
	ret

DayCare_GetCurrentPartyMember:
	ld a, [wPartyCount]
	dec a
	rst AddNTimes
	ld d, h
	ld e, l
	ret

DayCare_InitBreeding:
	ld a, [wDaycareLady]
	bit 0, a
	ret z
	ld a, [wDaycareMan]
	bit 0, a
	ret z
	callba CheckBreedmonCompatibility
	and a
	ret z
	inc a
	ret z
	ld hl, wDaycareMan
	set 5, [hl]
.loop
	call Random
	cp 150
	jr c, .loop
	ld [wStepsToEgg], a

	xor a
	ld hl, wEggMon
	ld bc, wEggMonEnd - wEggMon
	call ByteFill
	ld hl, wEggNick
	ld bc, PKMN_NAME_LENGTH
	call ByteFill
	ld hl, wEggOT
	ld bc, NAME_LENGTH
	call ByteFill
	ld a, [wBreedMon1DVs]
	ld [wTempMonDVs], a
	ld a, [wBreedMon1DVs + 1]
	ld [wTempMonDVs + 1], a
	ld a, [wBreedMon1Species]
	ld [wCurPartySpecies], a
	ld a, 3
	ld [wMonType], a
	ld a, [wBreedMon1Species]
	cp DITTO
	ld a, 1
	jr z, .LoadWhichBreedmonIsTheMother
	ld a, [wBreedMon2Species]
	cp DITTO
	ld a, 0
	jr z, .LoadWhichBreedmonIsTheMother
	callba GetGender
	ld a, 0
	jr z, .LoadWhichBreedmonIsTheMother
	inc a

.LoadWhichBreedmonIsTheMother
	ld [wBreedMotherOrNonDitto], a
	and a
	ld a, [wBreedMon1Species]
	jr z, .GotMother
	ld a, [wBreedMon2Species]

.GotMother
	ld [wCurPartySpecies], a
	callba GetEggSpecies
	ld a, EGG_LEVEL
	ld [wCurPartyLevel], a

; Illumise and Volbeat can have eggs of either species
	ld a, [wCurPartySpecies]
	cp ILLUMISE
	jr z, .illumise_or_volbeat
	cp VOLBEAT
	jr nz, .got_species
.illumise_or_volbeat
	call Random
	add a, a
	; a = carry ? VOLBEAT : ILLUMISE
	assert VOLBEAT == ILLUMISE - 1
	sbc a
	add ILLUMISE
.got_species
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld [wEggMonSpecies], a

	call GetBaseData
	ld hl, wEggNick
	ld de, .String_EGG
	call CopyName2
	ld hl, wPlayerName
	ld de, wEggOT
	ld bc, NAME_LENGTH
	rst CopyBytes
	xor a
	ld [wEggMonItem], a
	ld de, wEggMonMoves
	xor a
	ld [wFillMoves_IsPartyMon], a
	predef FillMoves
	callba InitEggMoves
	ld hl, wEggMonID
	ld a, [wPlayerID]
	ld [hli], a
	ld a, [wPlayerID + 1]
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld d, a
	callba CalcExpAtLevel
	ld hl, wEggMonExp
	ldh a, [hMultiplicand]
	ld [hli], a
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a
	xor a
	ld b, wEggMonDVs - wEggMonStatExp
	ld hl, wEggMonStatExp
.loop2
	ld [hli], a
	dec b
	jr nz, .loop2
	ld hl, wEggMonDVs
	call Random
	ld [hli], a
	ld [wTempMonDVs], a
	call Random
	ld [hld], a
	ld [wTempMonDVs + 1], a
	ld de, wBreedMon1DVs
	ld a, [wBreedMon1Species]
	cp DITTO
	jr z, .GotDVs
	ld de, wBreedMon2DVs
	ld a, [wBreedMon2Species]
	cp DITTO
	jr z, .GotDVs
	ld a, BREEDMON
	ld [wMonType], a
	push hl
	callba GetGender
	pop hl
	ld de, wBreedMon1DVs
	ld bc, wBreedMon2DVs
	jr c, .SkipDVs
	jr z, .ParentCheck2
	ld a, [wBreedMotherOrNonDitto]
	and a
	jr z, .GotDVs
	ld d, b
	ld e, c
	jr .GotDVs

.ParentCheck2
	ld a, [wBreedMotherOrNonDitto]
	and a
	jr nz, .GotDVs
	ld d, b
	ld e, c

.GotDVs
	ld a, [de]
	inc de
	and $f
	ld b, a
	ld a, [hl]
	and $f0
	add b
	ld [hli], a
	ld a, [de]
	and 7
	ld b, a
	ld a, [hl]
	and $f8
	add b
	ld [hl], a

.SkipDVs
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, NAME_LENGTH
	rst CopyBytes
	ld hl, wEggMonMoves
	ld de, wEggMonPP
	predef FillPP
	ld hl, wMonOrItemNameBuffer
	ld de, wStringBuffer1
	ld bc, NAME_LENGTH
	rst CopyBytes
	ld a, [wBaseEggSteps]
	ld hl, wEggMonHappiness
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, [wCurPartyLevel]
	ld [wEggMonLevel], a
	ret

.String_EGG
	db "Egg@"
