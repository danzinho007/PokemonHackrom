SECTION "Intro menu", ROMX

_MainMenu:
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_ROUTE_37
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	callba MainMenu
	jp StartTitleScreen

PrintDayOfWeek:
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	jp PlaceString

.Days
	db "Sun@"
	db "Mon@"
	db "Tues@"
	db "Wednes@"
	db "Thurs@"
	db "Fri@"
	db "Satur@"

.Day
	db "day@"

NewGame_ClearTileMapEtc:
	xor a
	ldh [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
	jp LoadLCDCode

NewGame:
	xor a
	ld [wMonStatusFlags], a
	call ResetWRAM
	call NewGame_ClearTileMapEtc
	call IntroductionSpeech
	call InitializeWorld

	ld a, $80
	ld [wMapSignRoutineIdx], a
	ld a, ROUTE_69
	ld [wLastLandmark], a
	ld [wCurrentLandmark], a
	xor a
	ld [wMapSignTimer], a

	ld a, SPAWN_HOME
	ld [wDefaultSpawnpoint], a

	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	jp FinishContinueFunction

ResetWRAM:
	xor a
	ldh [hBGMapMode], a

	ld hl, wSprites
	ld bc, wOptions - wSprites
	xor a
	call ByteFill

	ld hl, wd000
	ld bc, wGameDataEnd - wd000
	xor a
	call ByteFill

	ldh a, [rLY]
	ldh [hSecondsBackup], a
	call DelayFrame
	call Random
	ld [wPlayerID], a

	ldh a, [rLY]
	ldh [hSecondsBackup], a
	call DelayFrame
	call Random
	ld [wPlayerID + 1], a

	call Random
	ld [wSecretID], a
	ldh a, [hRandomAdd]
	ld [wSecretID + 1], a

	ld hl, wPartyCount
	call InitList

	xor a
	ld [wCurBox], a
	ld [wSavedAtLeastOnce], a

	call SetDefaultBoxNames

	sbk BANK(sBoxCount)
	ld hl, sBoxCount
	call InitList
	scls

	ld hl, wNumItems
	call InitList

	ld hl, wNumKeyItems
	call InitList

	ld hl, wNumBalls
	call InitList

	ld hl, wPCItems
	call InitList

	ld hl, wTreasureBagCount
	call InitList

	ld hl, wFossilCaseCount
	call InitList

	xor a
	ld [wMonType], a

	ld [wNaljoBadges], a
	ld [wRijonBadges], a
	ld [wOtherBadges], a

	ld [wCoins], a
	ld [wCoins + 1], a

	ld [wBattlePoints], a
	ld [wBattlePoints + 1], a

	ld [wOrphanPoints], a
	ld [wOrphanPoints + 1], a

	ld [wSootSackAsh], a
	ld [wSootSackAsh + 1], a

	ld [wMoney], a

	ld [wRoamMon1Species], a
	dec a
	ld [wRoamMon1MapGroup], a
	ld [wRoamMon1MapNumber], a

START_MONEY EQU 3000
	ld a, HIGH(START_MONEY)
	ld [wMoney + 1], a
	ld a, LOW(START_MONEY)
	ld [wMoney + 2], a

	call InitializeNPCNames

	jp ResetGameTime

InitList:
; Loads 0 in the count and -1 in the first item or mon slot.
	xor a
	ld [hli], a
	ld [hl], -1
	ret

SetDefaultBoxNames:
	ld hl, wBoxNames
	ld c, 0
.loop
	push hl
	ld de, .Box
	call CopyName2
	dec hl
	ld a, c
	inc a
	cp 10
	jr c, .less
	sub 10
	ld [hl], "1"
	inc hl

.less
	add "0"
	ld [hli], a
	ld [hl], "@"
	pop hl
	ld de, 9
	add hl, de
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .loop
	ret

.Box
	db "Box@"

InitializeNPCNames:
	ld hl, .Rival
	ld de, wRivalName
	call .Copy

	ld hl, .Mom
	ld de, wMomsName

.Copy
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret

.Rival  db "???@"
.Mom    db "MOM@"

InitializeWorld:
	xor a
	ldh [hMinutes], a
	ldh [hSeconds], a
	ldh [hHours], a
	call ShrinkPlayer
	jpba SpawnPlayer

Continue:
	call LoadStandardMenuHeader
	call DisplaySaveInfoOnContinue
	call GetJoypad
	ld a, 1
	ldh [hBGMapMode], a
	ld c, 20
	call DelayFrames
	call ConfirmContinue
	jp c, CloseWindow
	call Continue_BuildNumberCheck
	jp c, CloseWindow
	call Continue_CheckRTC_RestartClock
	jp c, CloseWindow
	ld a, 8
	ld [wMusicFade], a
	xor a
	ld [wMusicFadeIDLo], a
	ld [wMusicFadeIDHi], a
	call ClearBGPalettes
	call CloseWindow
	call ClearTileMap
	ld c, 20
	call DelayFrames
	callba JumpRoamMons
	callba UpdateTimerStatusesIfResetTime
	ld a, [wSpawnAfterChampion]
	cp SPAWN_LANCE
	jr z, .SpawnAfterE4
	cp 3
	jr z, .ResumeBattleTower
	ld a, MAPSETUP_CONTINUE
	ldh [hMapEntryMethod], a
	jp FinishContinueFunction

.SpawnAfterE4
	ld a, SPAWN_CAPER_CITY
	jr .ContinueAfterE4Spawn

.ResumeBattleTower
	ld a, SPAWN_BATTLE_TOWER_ENTRANCE
.ContinueAfterE4Spawn
	ld [wDefaultSpawnpoint], a
	call PostCreditsSpawn
	jp FinishContinueFunction

Continue_BuildNumberCheck:
	sbk BANK(sBuildNumber)
	ld hl, sBuildNumber
	ld a, [hli]
	cp LOW(BUILD_NUMBER)
	jr nz, .invalidBuildNumber
	ld a, [hl]
	cp HIGH(BUILD_NUMBER)
	scls
	ret z
.invalidBuildNumber
	scls ;just in case, it doesn't hurt
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	call ClearTileMapNoDelay
	ld de, .InvalidBuildNumberText
	hlcoord 0, 0
	call PlaceText
	call ApplyTilemap
	ld c, 60
	call DelayFrames
	call ButtonSound
	pop af
	ldh [hBGMapMode], a
	scf
	ret
	
.InvalidBuildNumberText
	text_jump _InvalidBuildNumberText

SpawnAfterRed:
	ld a, SPAWN_SAFFRON_CITY
	ld [wDefaultSpawnpoint], a
PostCreditsSpawn:
	xor a
	ld [wSpawnAfterChampion], a
	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	ret

ConfirmContinue:
	jr .handleLoop
.loop
	call DelayFrame
	call GetJoypad
.handleLoop
	ldh a, [hJoyPressed]
	bit A_BUTTON_F, a
	ret nz
	rrca
	rrca
	jr nc, .loop
	ret

Continue_CheckRTC_RestartClock:
	call CheckRTCStatus
	add a ; Day count exceeded 16383
	ret nc
	ld hl, .Text_ClockTimeMayBeWrong
	call PrintText
	callba CalendarTimeSet
	and a
	ret

.Text_ClockTimeMayBeWrong
	; The clock's time may be wrong. Please reset the time.
	text_jump ClockReset_MightBeWrongText

FinishContinueFunction:
; seed with some temporary values
	call SeedStableRNGSeedsWithTemporaryValues
	ld sp, wStack
.loop
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld [wLinkMode], a
	ld hl, wGameTimerPause
	set 0, [hl]
	res 7, [hl]
	ld hl, wEnteredMapFromContinue
	set 1, [hl]
	callba OverworldLoop
	ld a, [wSpawnAfterChampion]
	cp SPAWN_RED
	jp nz, Reset
	call SpawnAfterRed
	jr .loop

SeedStableRNGSeedsWithTemporaryValues:
	ld a, BANK(wStableRNGReseedValues)
	call StackCallInWRAMBankA

.Function:
	ld hl, wStableRNGReseedValues
	ld bc, (wStableRNGReseedValuesEnd - wStableRNGReseedValues) / 2
	inc b
	inc c
	jr .handleLoop
.tempSeedLoop
	call Random
	ld [hli], a
	ldh a, [hRandomAdd]
	ld [hli], a
.handleLoop
	dec c
	jr nz, .tempSeedLoop
	dec b
	jr nz, .tempSeedLoop
	ret

DisplaySaveInfoOnContinue:
	call CheckRTCStatus
	lb de, 4, 8
	add a
	jr c, DisplayContinueDataWithRTCError
	jr DisplayNormalContinueData

DisplaySaveInfoOnSave:
	lb de, 4, 0
DisplayNormalContinueData:
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_PrintGameTime
	jr DisplayContinueData

DisplayContinueDataWithRTCError:
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_UnknownGameTime
DisplayContinueData:
	call LoadFontsExtra
	jp UpdateSprites

Continue_LoadMenuHeader:
	xor a
	ldh [hBGMapMode], a
	ld hl, .MenuHeader_Dex
	CheckEngine ENGINE_POKEDEX
	jr nz, .pokedex_header
	ld hl, .MenuHeader_NoDex

.pokedex_header
	call _OffsetMenuHeader
	call MenuBox
	jp PlaceVerticalMenuItems

.MenuHeader_Dex
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw .MenuData2_Dex
	db 1 ; default option

.MenuData2_Dex
	db $00 ; flags
	db 4 ; items
	db "Player@"
	db "Badges@"
	db "#dex@"
	db "Time@"

.MenuHeader_NoDex
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw .MenuData2_NoDex
	db 1 ; default option

.MenuData2_NoDex
	db $00 ; flags
	db 4 ; items
	db "Player <PLAYER>@"
	db "Badges@"
	db " @"
	db "Time@"

Continue_DisplayBadgesDexPlayerName:
	call MenuBoxCoord2Tile
	push hl
	decoord 13, 4, NULL
	add hl, de
	call Continue_DisplayBadgeCount
	pop hl
	push hl
	decoord 12, 6, NULL
	add hl, de
	call Continue_DisplayPokedexNumCaught
	pop hl
	push hl
	decoord 8, 2, NULL
	add hl, de
	ld de, .Player
	call PlaceString
	pop hl
	ret

.Player
	db "<PLAYER>@"

Continue_PrintGameTime:
	decoord 8, 8, 0
	add hl, de
	jp Continue_DisplayGameTime

Continue_UnknownGameTime:
	decoord 9, 8, 0
	add hl, de
	ld de, .three_question_marks
	jp PlaceString

.three_question_marks
	db " ???@"

Continue_DisplayBadgeCount:
	push hl
	ld hl, wNaljoBadges
	ld b, 3
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 2
	jp PrintNum

Continue_DisplayPokedexNumCaught:
	ld a, [wStatusFlags]
	bit 0, a ; Pokedex
	ret z
	push hl
	ld hl, wPokedexCaught
IF NUM_POKEMON % 8
	ld b, NUM_POKEMON / 8 + 1
ELSE
	ld b, NUM_POKEMON / 8
ENDC
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 3
	jp PrintNum

Continue_DisplayGameTime:
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	ld [hl], ":"
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

IntroductionSpeech:
	callba CalendarTimeSet
	ld c, 1
	call FadeBGToDarkestColor
	call ClearTileMap

	ld de, MUSIC_ROUTE_30
	call PlayMusic

	ld c, 1
	call FadeOutBGPals

	ld b, SCGB_SCROLLINGMENU
	predef GetSGBLayout
	call SetPalettes

	ld hl, IntroTextGreetings
	call PrintText
	ld c, 1
	call FadeBGToLightestColor
	call ClearTileMap

	ld a, LARVITAR
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call PrepMonFrontpic

	xor a
	ld [wTempMonDVs], a
	ld [wTempMonDVs + 1], a

	ld b, SCGB_FRONTPICPALS
	predef GetSGBLayout
	call Intro_WipeInFrontpic

	ld hl, IntroTextInhabitedByPokemon
	call PrintText
	ld hl, IntroTextBriefHistory
	call PrintText
	call FadeOutIntroPic

	ld a, RED
	call Intro_PrepTrainerPic
	ld hl, IntroTextIntroduceRed
	call PrintText
	call FadeOutIntroPic

	ld a, GOLD
	call Intro_PrepTrainerPic
	ld hl, IntroTextIntroduceGold
	call PrintText
	call FadeOutIntroPic

	ld b, SCGB_SCROLLINGMENU
	predef GetSGBLayout
	call SetPalettes

	ld hl, IntroTextEnoughAboutThem
	call PrintText

	callba PlayerCustomization
	call FadeOutIntroPic

	xor a
	ld [wTrainerClass], a
	ld b, SCGB_FRONTPICPALS
	predef GetSGBLayout

	xor a
	call DmgToCgbBGPals
	call DelayFrame
	callba DrawIntroPlayerPic
	call Intro_WaitBGMapAndFadeOutBGPals

	ld hl, IntroTextFinallyPleaseTellMeYourName
	call PrintText
	call NamePlayer
	ld hl, IntroTextEnding
	jp PrintText

IntroTextGreetings:
	text_jump _IntroTextGreetings

IntroTextInhabitedByPokemon:
	text_far _IntroTextInhabitedByPokemon
	start_asm
	ld a, LARVITAR
	call PlayCry
	call WaitSFX
	ld hl, IntroTextWaitButton
	ret

IntroTextWaitButton:
	text ""
	prompt

IntroTextBriefHistory:
	text_jump _IntroTextPokemonBriefHistory

IntroTextIntroduceRed:
	text_jump _IntroTextIntroduceRed

IntroTextIntroduceGold:
	text_jump _IntroTextIntroduceGold

IntroTextEnoughAboutThem:
	text_jump _IntroTextEnoughAboutThem

IntroTextFinallyPleaseTellMeYourName:
	text_jump _IntroTextFinallyPleaseTellMeYourName

IntroTextEnding:
	text_jump _IntroTextEnding

FadeOutIntroPic:
	ld c, 1
	call FadeBGToLightestColor
	jp ClearTileMap

NamePlayer:
	callba MovePlayerPicRight
	callba ShowPlayerNamingChoices
	ld a, [wMenuCursorY]
	dec a
	jr z, .NewName
	call StorePlayerName
	callba ApplyMonOrTrainerPals
	jpba MovePlayerPicLeft

.NewName
	ld b, 1
	ld de, wPlayerName
	callba NamingScreen

	ld c, 1
	call FadeBGToLightestColor
	call ClearTileMap

	call LoadFontsExtra
	call ApplyTilemapInVBlank

	xor a
	ld [wCurPartySpecies], a
	callba DrawIntroPlayerPic

	xor a
	ld [wTrainerClass], a
	ld b, SCGB_FRONTPICPALS
	predef GetSGBLayout
	ld c, 1
	call FadeOutBGPals
	ld hl, wPlayerName
	ld de, AdamString
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .Male
	ld de, CyanString
.Male
	jp InitName

AdamString:
	db "Adam@@@@@@@"
CyanString:
	db "Cyan@@@@@@@"

StorePlayerName:
	ld a, "@"
	ld bc, NAME_LENGTH
	ld hl, wPlayerName
	call ByteFill
	ld hl, wPlayerName
	ld de, wStringBuffer2
	jp CopyName2

ShrinkPlayer:
	ld a, 0 << 7 | 32 ; fade out
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [wMusicFadeIDLo], a
	ld a, d
	ld [wMusicFadeIDHi], a

	ld de, SFX_ESCAPE_ROPE
	call PlaySFX

	ld c, 8
	call DelayFrames

	ld hl, Shrink1Pic
	ld b, BANK(Shrink1Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	ld hl, Shrink2Pic
	ld b, BANK(Shrink2Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	hlcoord 6, 5
	lb bc, 7, 7
	call ClearBox

	call Delay2

	call Intro_PlacePlayerSprite
	call LoadFontsExtra

	ld c, 50
	call DelayFrames

	ld c, 1
	call FadeToLightestColor
	jp ClearTileMap

Intro_WipeInFrontpic:
	ld a, -$70
	ldh [hSCX], a
	call DelayFrame
	ld a, %11100100
	call DmgToCgbBGPals
.loop
	call DelayFrame
	ldh a, [hSCX]
	add 8
	ldh [hSCX], a
	jr nc, .loop
	jp DelayFrame

Intro_PrepTrainerPic:
	ld [wTrainerClass], a
	xor a
	ld [wCurPartySpecies], a
	ld b, SCGB_FRONTPICPALS
	predef GetSGBLayout
	xor a
	call DmgToCgbBGPals
	ld de, vBGTiles
	predef GetTrainerPic
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
Intro_WaitBGMapAndFadeOutBGPals:
	call ApplyTilemapInVBlank
	ld c, 1
	call FadeOutBGPals
	ld a, %11100100
	jp DmgToCgbBGPals

ShrinkFrame:
	ld de, vBGTiles
	ld c, $31
	call DecompressRequest2bpp
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef_jump PlaceGraphic

Intro_PlacePlayerSprite:
	call GetPlayerIcon
	ld hl, vObjTiles
	ld c, 12
	ld de, wDecompressScratch
	call Request2bppInWRA6

	ld hl, .PlayerSpriteOAM
	ld de, wSprites
	ld bc, 4 * 4
	rst CopyBytes
	ret

.PlayerSpriteOAM:
	db  9 * 8 + 4,  9 * 8, 0, 0
	db  9 * 8 + 4, 10 * 8, 1, 0
	db 10 * 8 + 4,  9 * 8, 2, 0
	db 10 * 8 + 4, 10 * 8, 3, 0

CrystalIntroSequence:
	callba Copyright_GFPresents
	; fallthrough

StartTitleScreen:
	ldh a, [rSVBK]
	push af
	wbk BANK(wLYOverrides)
	callba _TitleScreen
	ld a, LOW(rSCX)
	ld [wLCDCPointer], a
	ld hl, rIE
	set LCD_STAT, [hl]
	call DelayFrame
.loop
	call RunTitleScreen
	jr nc, .loop
	ld a, [wcf64]
	cp 2
	jr z, .timed_out
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, LARVITAR
	call PlayCry2
	jr .handleLoop
.wait
	callba TyranitarFrameIterator
.handleLoop
	call DelayFrame
	ld hl, wChannel5Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel6Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel7Flags
	bit 0, [hl]
	jr nz, .wait
	ld hl, wChannel8Flags
	bit 0, [hl]
	jr nz, .wait
.timed_out
	pop af
	ldh [rSVBK], a
	ld hl, rIE
	res LCD_STAT, [hl]
	ld hl, rLCDC
	res 2, [hl]
	call DisableLCD
	call LoadLCDCode
	call ClearSprites
	call ForcePushOAM
	call ClearPalettes
	call ForceUpdateCGBPals
	call ClearScreen
	ld hl, vBGMap
	ld bc, BG_MAP_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	xor a
	ldh [hBGMapHalf], a
	ld a, 18
	ldh [hTilesPerCycle], a
	ld a, 6
	ldh [hBGMapMode], a
	call UpdateBGMap
	xor a
	ldh [hBGMapAddress], a
	ldh [hVBlank], a
	ldh [hSCX], a
	ldh [hSCY], a
	inc a
	ldh [hBGMapMode], a
	ld a, 7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	ld b, SCGB_SCROLLINGMENU
	predef GetSGBLayout
	call UpdateTimePals
	call EnableLCD
	ld a, [wcf64]
	cp 5
	jr c, .ok
	xor a
.ok
	jumptable
	dw _MainMenu
	dw _DeleteSaveData
	dw CrystalIntroSequence
	dw CrystalIntroSequence
	dw GenericDummyFunction

RunTitleScreen:
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done_title
	jumptable .scenes
	callba TyranitarFrameIterator
	call DelayFrame
	call Joypad
	and a
	ret

.done_title
	scf
	ret

.scenes
	dw TitleScreenEntrance
	dw TitleScreenTimer
	dw TitleScreenMain
	dw TitleScreenEnd

TitleScreenEntrance:

; Animate the logo:
; Move each line by 4 pixels until our count hits 0.
	ldh a, [hSCX]
	and a
	jr z, .done
	sub 4
	ldh [hSCX], a
	ld c, a

; Reversed signage for every other line's position.
; This is responsible for the interlaced effect.
	ld hl, wLYOverrides
.loop
	ld b, l
	bit 0, b
	push af
	ld a, c
	add b
	sub 80
	ld b, a
	jr nc, .plus
	pop af
	xor a
	jr .noinvert
.plus
	pop af
	ld a, b
	jr nz, .noinvert
	xor a
	sub b
.noinvert
	ld [hli], a
	ld a, l
	cp 78
	jr c, .loop

	jpba AnimateTitleCrystal

.done
; Next scene
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wLCDCPointer], a

; Play the title screen music.
	ld de, MUSIC_NONE
	call PlayMusic
	ld de, MUSIC_TITLE_SCREEN
	call PlayMusic

	ld a, $88
	ldh [hWY], a
	ret

TitleScreenTimer:

; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld hl, wTitleScreenTimer
	ld a, LOW(6400)
	ld [hli], a
	ld [hl], HIGH(6400)

	di
	ld a, 1
	ldh [hVBlank], a
	ld hl, LCD_TitleScreenMain
	ld de, wLCD
	ld bc, LCD_TitleScreenMainEnd - LCD_TitleScreenMain
	rst CopyBytes
	reti

LCD_TitleScreenMain:
	push af ; 1
	push hl ; 2
	ldh a, [rLY] ; 4
	cp 57 ; 6
	jr nc, .secondSet ; 8
	add a ; 9
	add a ; 10
	ld l, a ; 11
	ld h, HIGH(wTitleScreenBGPIListAndSpectrumColours) ; 13
	ld a, [hli] ; 14
	ldh [rBGPI], a ; 16
	ld a, [hli] ; 17
	ldh [rBGPD], a ; 19
	ld a, [hl] ; 20
	ldh [rBGPD], a ; 22
.end
	pop hl ; 23
	pop af ; 24
	reti ; 25
.secondSet
	cp 67 ; 27
	jr c, .end ; 29
	cp 79 ; 31
	ldh a, [hTitleCloudSCX] ; 33
	jr c, .got_scx ; 35
	xor a ; 36
.got_scx
	ldh [rSCX], a ; 38
	jr .end ; 40
LCD_TitleScreenMainEnd:

TitleScreenMain:
; Run the timer down.
	ld hl, wTitleScreenTimer
	ld a, [hli]
	ld d, [hl]
	ld e, a
	or d
	jr z, .end

	dec de
	ld a, d
	ld [hld], a
	ld [hl], e

; Save data can be deleted by pressing Up + B + Select.
	call GetJoypad
	ld c, LOW(hJoyDown)
	ldh a, [c]
	and D_UP + B_BUTTON + SELECT
	cp D_UP + B_BUTTON + SELECT
	ld a, 1
	jr z, .delete_save_data
; Press Start or A to start the game.
.check_start
	ldh a, [c]
	and START | A_BUTTON
	ret z
	xor a
.delete_save_data
	ld [wcf64], a
; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.end
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Fade out the title screen music
	xor a
	ld [wMusicFadeIDLo], a
	ld [wMusicFadeIDHi], a
	ld hl, wMusicFade
	ld [hl], 8 ; 1 second

	ld hl, wcf65
	inc [hl]
	ret

_DeleteSaveData:
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
	callba DeleteSaveData
	jp StartTitleScreen

TitleScreenEnd:
; Wait until the music is done fading.

	ld hl, wcf65
	inc [hl]

	ld a, [wMusicFade]
	and a
	ret nz

	ld a, 2
	ld [wcf64], a

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Copyright:
	call ClearTileMap

	ld hl, CopyrightGFX
	ld de, vBGTiles tile $40
	lb bc, BANK(CopyrightGFX), 60
	call DecompressRequest2bpp

	ld de, .disclaimer_string
	ld hl, vFontTiles tile $10
	lb bc, 2, $3e
	predef PlaceVWFString

	ld hl, .fillinc_list
.outer_loop
	ld a, [hli]
	and a
	ret z
	ld b, a

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
.fillinc
	ld [de], a
	inc de
	inc a
	dec b
	jr nz, .fillinc
	jr .outer_loop

; x, y, starting tile, count
fillinc: MACRO
	db \4
	dwcoord \1, \2
	db \3
ENDM

.fillinc_list
	fillinc 3, 2,  $6e, 14 ; Rainbowdevs
	fillinc 2, 4,  $40, 13 ; Nintendo
	fillinc 2, 6,  $4d, 16 ; Creatures inc.
	fillinc 2, 8,  $5d, 17 ; Game Freak inc.

	fillinc 1, 12, $90, 18 ; This is a fan project based
	fillinc 1, 13, $a2, 18 ; on the Pokemon franchise.
	fillinc 3, 15, $b4, 14 ; Please support the
	fillinc 4, 16, $c2, 12 ; official products.
	db 0

PURGE fillinc

.disclaimer_string
	db "This is a fan project based<LNBRK>"
	db " ┘on the Pokémon franchise.<LNBRK>"
	db " ┘┘┘Please support the<LNBRK>"
	db " official products.@"

GameInit::
	callba TryLoadSaveData
	call ClearWindowData
	call ClearBGPalettes
	call ClearTileMap
	ld a, HIGH(vBGMap)
	ldh [hBGMapAddress + 1], a
	xor a
	ldh [hBGMapAddress], a
	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $90
	ldh [hWY], a
	call ApplyTilemapInVBlank
	jp CrystalIntroSequence

SECTION "Copyright GFX", ROMX
CopyrightGFX:: INCBIN "gfx/intro/copyright.2bpp.lz"
