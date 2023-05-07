Route82_MapScriptHeader;trigger count
	db 0
 ;callback count
	db 0

Route82HiddenItem:
	dw EVENT_ROUTE_82_HIDDENITEM_GOLD_TOKEN
	db GOLD_TOKEN

Route82DirectionsSign:
	ctxt "<LEFT> Torenia City"
	next "<RIGHT> Acania Docks"
	done

Route82_Trainer_1:
	trainer EVENT_ROUTE_82_TRAINER_1, FISHER, 12, .before_battle_text, .battle_won_text

	ctxt "-sigh- It wouldn't"
	line "surprise me at all"
	para "if the Relicanth"
	line "were dispersing."

	para "I heard that some"
	line "people are now"
	para "dumping pollution"
	line "into the ocean."
	done

.before_battle_text
	ctxt "I'm gonna catch"
	line "me a Relicanth!"
	done

.battle_won_text
	ctxt "Dang!"
	done

Route82_Trainer_2:
	trainer EVENT_ROUTE_82_TRAINER_2, FISHER, 13, .before_battle_text, .battle_won_text

	ctxt "I fished while"
	line "riding my #mon"
	para "until it couldn't"
	line "take it anymore."

	para "Now I fish on the"
	line "docks instead."
	done

.before_battle_text
	ctxt "I think some of"
	line "the rarest fish"
	para "#mon hide under"
	line "these very docks."
	done

.battle_won_text
	ctxt "No, no, no!"
	done

Route82_Trainer_3:
	trainer EVENT_ROUTE_82_TRAINER_3, COOLTRAINERF, 5, .before_battle_text, .battle_won_text

	ctxt "It always makes"
	line "me excited to see"
	para "other people with"
	line "strong #mon."

	para "It's not every day"
	line "that I meet people"
	para "who can put up a"
	line "good fight."
	done

.before_battle_text
	ctxt "Hey, you look"
	line "pretty tough!"

	para "Can I see your"
	line "#mon, please?"
	done

.battle_won_text
	ctxt "That was fun!"
	done

Route82_MapEventHeader ;filler
	db 0, 0

;warps
	db 5
	warp_def $8, $4, 3, ROUTE_82_GATE
	warp_def $9, $4, 4, ROUTE_82_GATE
	warp_def $3, $1c, 1, ROUTE_82_MONKEY
	warp_def $b, $2a, 1, ROUTE_82_CAVE
	warp_def $9, $30, 2, ROUTE_82_CAVE

	;xy triggers
	db 0

	;signposts
	db 2
	signpost 8, 6, SIGNPOST_LOAD, Route82DirectionsSign
	signpost 4, 34, SIGNPOST_ITEM, Route82HiddenItem

	;people-events
	db 5
	person_event SPRITE_FISHER, 12, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route82_Trainer_1, -1
	person_event SPRITE_FISHER, 4, 45, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route82_Trainer_2, -1
	person_event SPRITE_COOLTRAINER_F, 13, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 8 + PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, Route82_Trainer_3, -1
	person_event SPRITE_FRUIT_TREE, 12, 50, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_FRUITTREE, 0, 21, -1
	person_event SPRITE_POKE_BALL, 4, 50, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_ITEMBALL, 1, POLKADOT_BOW, EVENT_ROUTE_82_ITEM_POLKADOT_BOW
