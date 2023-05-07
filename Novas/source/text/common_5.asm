BargainShop_Costs::
	ctxt "<STRBF2> costs"
	line "¥@"
	deciram hMoneyTemp, 3, 7
	ctxt ". Want it?"
	done

BargainShop_Thanks::
	ctxt "Thanks."
	done

BargainShop_BagFull::
	ctxt "Uh-oh, your pack"
	line "is chock-full."
	done

BargainShop_SoldOut::
	ctxt "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

BargainShop_NoMoney::
	ctxt "Uh-oh, you're"
	line "short on funds."
	done

BargainShop_ComeAgain::
	ctxt "Come by again"
	line "sometime."
	done

Pharmacy_Intro::
	ctxt "What's up? Need"
	line "some medicine?"
	done

Pharmacy_BagFull::
	ctxt "You don't have any"
	line "more space."
	done

Pharmacy_NoMoney::
	ctxt "Huh? That's not"
	line "enough money."
	done

Pharmacy_ComeAgain::
	ctxt "All right."
	line "See you around."
	done

Mart_CanPayYou::
	ctxt "I can pay you"
	line "¥@"
	deciram hMoneyTemp, 3, 7
	ctxt "."

	para "Is that OK?"
	done

Mart_Intro::
	ctxt "Welcome! How may I"
	line "help you?"
	done

Mart_Thanks::
	ctxt "Here you are."
	line "Thank you!"
	done

Mart_NoMoney::
	ctxt "You don't have"
	line "enough money."
	done

Mart_BagFull::
	ctxt "You can't carry"
	line "any more items."
	done

SlotMachine_StartText::
	ctxt "Start!"
	done

SlotMachine_NoCoins::
	ctxt "Not enough"
	line "coins."
	prompt

SlotMachine_OutOfCoins::
	ctxt "Darn<...> Ran out of"
	line "coins again<...>"
	done

SlotMachine_PlayAgain::
	ctxt "Play again?"
	done

SlotMachine_LinedUp::
	ctxt "lined up!"
	line "Won <STRBF2> coins!"
	done

SlotMachine_Darn::
	text "Darn!"
	done

Text_RepelUsedEarlierIsStillInEffect::
	ctxt "The Repel used"
	line "earlier is still"
	cont "in effect."
	prompt

FossilCaseText::
	ctxt "Fossils: @"
	deciram wFossilCaseCount, 1, 2
	text ""
	done

ReceivedFossilText_::
	ctxt "<PLAYER> received"
	line "a Fossil!"
	done
