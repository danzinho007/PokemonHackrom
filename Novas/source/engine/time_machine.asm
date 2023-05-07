TimeMachine:
	CheckEngine ENGINE_RTC_TIMERS_ENABLED
	jr nz, .continue
	ld hl, .NotEnoughTimePassedText
	call PrintText
	ld a, 3
	ld [wItemEffectSucceeded], a
	ret

.continue
	ld hl, .BootedUpTheTimeMachineText
	call PrintText
	ld de, SFX_BOOT_PC
	call PlayWaitSFX
	call ButtonSound
	; bring up clock interface
	; bail if player cancels
	ld hl, wJumptableIndex
	ld de, wJumptableIndexAndBufferVarsTemp
	ld bc, (wcf69 + 1) - wJumptableIndex
	rst CopyBytes
	callba CalendarTimeSetFromTimeMachine
	push af
	ld hl, wJumptableIndexAndBufferVarsTemp
	ld de, wJumptableIndex
	ld bc, (wcf69 + 1) - wJumptableIndex
	rst CopyBytes
	pop af
	jr nc, .didNotUseTimeMachine
	callba DoTimeMachine
	ld hl, .UsedTimeMachineScript
	jp QueueScript
.didNotUseTimeMachine
	ld a, 4
	ld [wItemEffectSucceeded], a
	ret

.NotEnoughTimePassedText
	text_jump NotEnoughTimePassedText

.BootedUpTheTimeMachineText
	text_jump BootedUpTheTimeMachineText

.UsedTimeMachineScript
	showtext .UsedTimeMachineText
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportFrom
	scriptstartasm
	ld c, 1
	call FadeToWhite
	ld c, 10
	call DelayFrames
	ld c, 1
	call FadeOutPals
	scriptstopasm
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	pause 5
	callasm .LoadNewTime
	jumptext .ArrivedAtTimeText

.TeleportFrom
	teleport_from
	step_end

.TeleportTo
	teleport_to
	step_end

.LoadNewTime
	ld hl, wStringBuffer2 + 1
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ld bc, wStringBuffer1
	callba PrintHoursMins
	ld a, "@"
	ld [bc], a
	ld a, [wStringBuffer2]
	inc a
	ld c, 10
	call SimpleDivide
	ld c, a
	ld a, b
	ld hl, wStringBuffer3
	and a
	jr z, .day_below_ten
	add a, "0"
	ld [hli], a
.day_below_ten
	ld a, c
	add a, "0"
	ld [hli], a
	ld a, " "
	ld [hli], a
	ld a, [wStringBuffer2 + 4]
	callba CopyMonthName
	ld a, " "
	ld [hli], a
	ld a, "2"
	ld [hli], a
	ld a, [wStringBuffer2 + 5]
	ld c, 100
	call SimpleDivide
	push bc
	ld c, 10
	call SimpleDivide
	ld c, a
	pop af
	add a, "0"
	ld [hli], a
	ld a, b
	add a, "0"
	ld [hli], a
	ld a, c
	add a, "0"
	ld [hli], a
	ld [hl], "@"
	ret

.UsedTimeMachineText
	text_jump UsedTimeMachineText

.ArrivedAtTimeText
	text_jump ArrivedAtTimeText
