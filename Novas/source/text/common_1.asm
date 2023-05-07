FarText_Mart_CantSellItem::
	ctxt "Sorry, I can't buy"
	line "that from you."
	prompt

FarText_Mart_PleaseComeAgain::
	ctxt "Please come again!"
	done

FarText_Mart_AnythingElse::
	ctxt "Can I do anything"
	line "else for you?"
	done

FarText_Mart_GotMoneyForItems::
	ctxt "Got ¥@"
	deciram hMoneyTemp, 3, 7
	ctxt " for"
	line "<STRBF2>(s)."
	done

_Text_BattleTowerExchange_Intro::
	ctxt "Welcome!"

	para "You can exchange"
	line "your Battle Points"

	para "over here for some"
	line "fabulous prizes!"

	para "Which one would"
	line "you like?"
	done

_Text_BattleTowerArcadeExchange_Outro::
	ctxt "Come again!"
	done

Text_BattleTower_InsufficientFunds_::
	ctxt "You don't have"
	line "enough Battle"
	cont "Points."
	done

_BattleArcadeInsufficientFundsText::
	ctxt "You don't have"
	line "enough Arcade"
	cont "Tickets."
	done

_BattleArcadeAlreadyBoughtMysteryTicketText::
	ctxt "Sorry, only one"
	line "Mystery Ticket per"
	cont "person."
	done

FarText_BetHowManyCoins::
	ctxt "Bet how many"
	line "coins?"
	done

FarText_MonStatRose::
	ctxt "<STRBF1>'s"
	line "<STRBF2> rose."
	prompt

PutItemInPocket_Pokeonly::
	ctxt "<STRBF2> put the"
	line "<STRBF1> in"
	cont "the <STRBF3>."
	done

_BattleArcadeExchangeText::
	ctxt "Welcome!"

	para "We can redeem your"
	line "Arcade Tickets"
	cont "for prizes here!"

	para "Which one would"
	line "you like?"
	done

_InvalidBuildNumberText::
	ctxt "The build number"
	nl   "stored in the save"
	nl   "file does not match"
	nl   "the internal build"
	nl   "number associated"
	nl   "with this release,"
	nl   "which means your"
	nl   "save might be incom"
	db   "-patible with this"
	nl   "current release."
	next "Please patch the"
	nl   "save file to"
	nl   "continue, at:"
	nl   "goo.gl/8njXYV"
	done

_FixBuildNumberWarningText::
	ctxt " The build number"
	nl   "  stored in your"
	nl   " savefile will be"
	nl   "updated. This will"
	nl   " let you play, but"
	nl   "it won't update the"
	nl   "savefile's data, so"
	nl   " it should only be"
	nl   "used for debugging"
	nl   "     purposes."
	nl   ""
	nl   " Are you sure you"
	nl   " wish to continue?"
	done

FarText_BillsTeleportationSystem::
	ctxt "Bill's"
	line "Teleportation"
	cont "System!"
	sdone

_GoldTokenExchangeMartCostsThisMuchText::
	ctxt "<STRBF2> will"
	line "be @"
	deciram wItemQuantityChangeBuffer, 1, 0
	ctxt " tokens."
	done
