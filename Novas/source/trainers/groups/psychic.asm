PsychicGroup:
	; 1
	db "Teller@"

	db TRAINERTYPE_NORMAL

	db 14, ABRA
	db 15, KADABRA
	db -1

	; 2
	db "Penn@"

	db TRAINERTYPE_NORMAL

	db 19, LUNATONE
	db -1

	; 3
	db "Murray@"

	db TRAINERTYPE_NORMAL

	db 30, EXEGGCUTE
	db 31, EXEGGUTOR
	db -1

	; 4
	db "Dexter@"

	db TRAINERTYPE_NORMAL

	db 74, KADABRA
	db 75, SOLROCK
	db 76, ALAKAZAM
	db -1

	; 5
	db "Sidney@"

	db TRAINERTYPE_NORMAL

	db 74, XATU
	db 74, LUNATONE
	db 76, EXEGGUTOR
	db -1

	; 6
	db "Franklin@"

	db TRAINERTYPE_NORMAL

	db 82, ALAKAZAM
	db -1

	; 7
	db "Box@"

	db TRAINERTYPE_MOVES

	db 80, XATU
		db PSYCHIC_M
		db FLY
		db REFLECT
		db HAZE

	db 80, AGGRON
		db EARTHQUAKE
		db IRON_HEAD
		db METALLURGY
		db ROCK_SLIDE

	db 80, WEAVILE
		db SURF
		db METAL_CLAW
		db ICE_PUNCH
		db AGILITY

	db 80, CROBAT
		db BITE
		db AEROBLAST
		db CONFUSE_RAY
		db WING_ATTACK

	db 80, GENGAR
		db NOISE_PULSE
		db CONFUSE_RAY
		db HYPNOSIS
		db DREAM_EATER

	db -1
