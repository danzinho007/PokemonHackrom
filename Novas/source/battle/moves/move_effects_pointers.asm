MoveEffectsPointers:
	dw NormalHit                         ; 00
	dw DoSleep                           ; 01
	dw PoisonHit                         ; 02
	dw LeechHit                          ; 03
	dw BurnHit                           ; 04
	dw FreezeHit                         ; 05
	dw ParalyzeHit                       ; 06
	dw Explosion                         ; 07
	dw DreamEater                        ; 08
	dw MirrorMove                        ; 09
	dw AttackUp                          ; 0a
	dw DefenseUp                         ; 0b
	dw SpeedUp                           ; 0c
	dw SpecialAttackUp                   ; 0d
	dw SpecialDefenseUp                  ; 0e
	dw AccuracyUp                        ; 0f
	dw EvasionUp                         ; 10
	dw NormalHit                         ; 11
	dw AttackDown                        ; 12
	dw DefenseDown                       ; 13
	dw SpeedDown                         ; 14
	dw SpecialAttackDown                 ; 15
	dw SpecialDefenseDown                ; 16
	dw AccuracyDown                      ; 17
	dw EvasionDown                       ; 18
	dw Haze                              ; 19
	dw Rampage                           ; 1a
	dw RoarWhirlwind                     ; 1b
	dw MultiHit                          ; 1c
	dw Conversion                        ; 1d
	dw FlinchHit                         ; 1e
	dw Heal                              ; 1f
	dw DoPoison                          ; 20 (toxic)
	dw 0                                 ; 21 (dummy)
	dw Screen                            ; 22 (light screen)
	dw TriAttack                         ; 23
	dw Hurricane                         ; 24
	dw 0                                 ; 25 (dummy)
	dw RazorWind                         ; 26
	dw 0                                 ; 27 (dummy)
	dw StaticDamage                      ; 28
	dw Bind                              ; 29
	dw NormalHit                         ; 2a
	dw MultiHit                          ; 2b
	dw NormalHit                         ; 2c
	dw Mist                              ; 2d
	dw CriticalUp                        ; 2e
	dw RecoilHit                         ; 2f
	dw DoConfuse                         ; 30
	dw AttackUp2                         ; 31
	dw DefenseUp2                        ; 32
	dw SpeedUp2                          ; 33
	dw SpecialAttackUp2                  ; 34
	dw SpecialDefenseUp2                 ; 35
	dw AccuracyUp2                       ; 36
	dw EvasionUp2                        ; 37
	dw Transform                         ; 38
	dw AttackDown2                       ; 39
	dw DefenseDown2                      ; 3a
	dw SpeedDown2                        ; 3b
	dw SpecialAttackDown2                ; 3c
	dw SpecialDefenseDown2               ; 3d
	dw AccuracyDown2                     ; 3e
	dw EvasionDown2                      ; 3f
	dw Screen                            ; 40 (reflect)
	dw DoPoison                          ; 41
	dw DoParalyze                        ; 42
	dw AttackDownHit                     ; 43
	dw DefenseDownHit                    ; 44
	dw SpeedDownHit                      ; 45
	dw SpecialAttackDownHit              ; 46
	dw SpecialDefenseDownHit             ; 47
	dw AccuracyDownHit                   ; 48
	dw EvasionDownHit                    ; 49
	dw SkyAttack                         ; 4a
	dw ConfuseHit                        ; 4b
	dw PoisonMultiHit                    ; 4c
	dw AttackUpHit                       ; 4d
	dw Substitute                        ; 4e
	dw HyperBeam                         ; 4f
	dw Rage                              ; 50
	dw Metronome                         ; 51
	dw LeechSeed                         ; 52
	dw Splash                            ; 53
	dw Disable                           ; 54
	dw StaticDamage                      ; 55
	dw StaticDamage                      ; 56 (intentionally distinct from 55)
	dw Counter                           ; 57
	dw Encore                            ; 58
	dw 0                                 ; 59 (dummy)
	dw Conversion2                       ; 5a
	dw LockOn                            ; 5b
	dw 0                                 ; 5c (dummy)
	dw SleepTalk                         ; 5d
	dw DestinyBond                       ; 5e
	dw Reversal                          ; 5f
	dw Spite                             ; 60
	dw FalseSwipe                        ; 61
	dw HealBell                          ; 62
	dw NormalHit                         ; 63
	dw 0                                 ; 64 (dummy)
	dw Thief                             ; 65
	dw MeanLook                          ; 66
	dw Nightmare                         ; 67
	dw FlameWheel                        ; 68
	dw Curse                             ; 69
	dw WillOWisp                         ; 6a
	dw ProtectDetect                     ; 6b
	dw Spikes                            ; 6c
	dw Foresight                         ; 6d
	dw PerishSong                        ; 6e
	dw Sandstorm                         ; 6f
	dw Endure                            ; 70
	dw Rollout                           ; 71
	dw Swagger                           ; 72
	dw FuryCutter                        ; 73
	dw Attract                           ; 74
	dw Return                            ; 75
	dw 0                                 ; 76 (dummy)
	dw Frustration                       ; 77
	dw Safeguard                         ; 78
	dw SacredFire                        ; 79
	dw Magnitude                         ; 7a
	dw BatonPass                         ; 7b
	dw Pursuit                           ; 7c
	dw RapidSpin                         ; 7d
	dw CalmMind                          ; 7e
	dw BulkUp                            ; 7f
	dw MorningSun                        ; 80
	dw Synthesis                         ; 81
	dw Moonlight                         ; 82
	dw HiddenPower                       ; 83
	dw RainDance                         ; 84
	dw SunnyDay                          ; 85
	dw DefenseUpHit                      ; 86 (steel wing)
	dw AttackUpHit                       ; 87 (metal claw)
	dw AllUpHit                          ; 88
	dw 0                                 ; 89 (dummy)
	dw 0                                 ; 8a (dummy)
	dw 0                                 ; 8b (dummy)
	dw Twister                           ; 8c
	dw Earthquake                        ; 8d
	dw FutureSight                       ; 8e
	dw Gust                              ; 8f
	dw Stomp                             ; 90
	dw Solarbeam                         ; 91
	dw Thunder                           ; 92
	dw Teleport                          ; 93
	dw FlyDig                            ; 95
	dw DefenseCurl                       ; 96
	dw CosmicPower                       ; 97
	dw Hail                              ; 98
	dw FinalChance                       ; 99
	dw Metallurgy                        ; 9a
	dw Vaporize                          ; 9b
	dw PrismSpray                        ; 9c
	dw SpringBuds                        ; 9d
	dw LavaPool                          ; 9e
	dw FreezeBurn                        ; 9f
	dw NaturePower                       ; a0
	dw FlareBlitz                        ; a1
	dw PainSplit                         ; a2
	dw BellyDrum                         ; a3
	dw DragonDance                       ; a4
	dw GrowthMoveEffect                  ; a5
	dw LaughingGasEffect                 ; a6
