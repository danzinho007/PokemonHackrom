Evolve_CongratulationsText::
	ctxt "Congratulations!"
	line "Your <STRBF2>"
	done

Evolve_IntoText::
	ctxt ""
	para "evolved into"
	line "<STRBF1>!"
	done

Evolve_Stopped::
	ctxt "Huh? <STRBF2>"
	line "stopped evolving!"
	prompt

Evolve_Evolving::
	ctxt "What? <STRBF2>"
	line "is evolving!"
	done

Mart_HowMany::
	ctxt "How many?"
	done

Mart_CostsThisMuch::
	deciram wItemQuantityChangeBuffer, 1, 2
	ctxt " <STRBF2>(s)"
	line "will be ¥@"
	deciram hMoneyTemp, 3, 7
	text "."
	done

Text_BattleTower_CostsThisMuch_::
	ctxt "<STRBF2>"
	line "will be @"
	deciram hMoneyTemp, 3, 6
	ctxt " BP."
	done

_BattleArcadeCostsThisMuchText::
	ctxt "<STRBF2> will"
	line "be @"
	deciram hMoneyTemp, 3, 6
	ctxt " tickets."
	done

_IntroTextGreetings::
	ctxt "Greetings!"

	para "Welcome to the"
	line "world of #mon."

	para "I'm<...> well, that"
	line "doesn't matter."

	para "Anyway<...>"
	prompt

_IntroTextInhabitedByPokemon::
	ctxt "This world is in-"
	line "habited by crea-"
	para "tures that we call"
	line "#mon."
	done

_IntroTextPokemonBriefHistory::
	ctxt "People and #mon"
	line "live and support"
	cont "each other."

	para "Some people play"
	line "with #mon, some"
	cont "people study them."

	para "Others even battle"
	line "their #mon and"
	para "strive to be"
	line "champions."
	prompt

_IntroTextIntroduceRed::
	ctxt "This is Red."
	
	para "Hailing from "
	line "Pallet Town in the"
	cont "Kanto region,"
	
	para "he successfully"
	line "became the region's"
	cont "#mon Champ<...>"
	
	para "<...>while also taking"
	line "down the corrupt"
	cont "Team Rocket."	
	prompt

_IntroTextIntroduceGold::
	ctxt "Meet Gold."
	
	para "Also a young"
	line "trainer, he left"
	para "home from New Bark"
	line "in Johto,"
	
	para "and worked his way"
	line "to the top<...>"
	
	para "<...>challenging"
	line "many tough and"
	para "troublesome foes"
	line "along the way."
	prompt

_IntroTextEnoughAboutThem::
	ctxt "<...>but you!"
	
	para "You, too, are"
	line "destined for"
	cont "greatness!"

	para "Why not tell me"
	line "a little about "
	cont "yourself?"
	prompt

_IntroTextAreYouABoyOrAreYouAGirl::
	ctxt "Are you a boy?"
	line "Or are you a girl?"
	done

HerbShop_Intro::
	ctxt "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #mon may"
	line "not like them."

	para "Hehehehe<...>"
	done

HerbShop_Thanks::
	ctxt "Thank you, dear."
	line "Hehehehe<...>"
	done

HerbShop_BagFull::
	ctxt "Oh? Your pack is"
	line "full, dear."
	done

HerbShop_NoMoney::
	ctxt "Hehehe<...> You don't"
	line "have the money."
	done

ItemStorageFullText::
	ctxt "Item storage space"
	line "full."
	prompt

HoldItem_TookText::
	ctxt "Took <STRBF1>"
	line "from <MINB>."
	prompt

HoldItem_AskSwitch::
	ctxt "<MINB> is"
	line "already holding"

	para "<STRBF1>."
	line "Switch items?"
	done

HoldItem_CantBeHeldText::
	ctxt "This item can't be"
	line "held."
	prompt

Text_NotEnoughHP::
	ctxt "Not enough HP!"
	prompt
