Link_TooMuchTimeElapsedText::
	ctxt "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

Link_CantTradeLastMonText::
	ctxt "If you trade that"
	line "#mon, you won't"
	cont "be able to battle."
	prompt

Link_AbnormalText::
	ctxt "Your friend's"
	line "<STRBF1> appears"
	cont "to be abnormal!"
	prompt

Link_AskTrade::
	ctxt "Trade @"
	text_from_ram wd004
	ctxt ""
	line "for <STRBF1>?"
	done

Text_AskSave::
	ctxt "Would you like to"
	line "save the game?"
	done

Text_SavedTheGame::
	ctxt "<PLAYER> saved"
	line "the game."
	done

Text_AskSaveOverwrite::
	ctxt "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

Text_CorruptedSave::
	ctxt "The save file is"
	line "corrupted!"
	prompt

Text_AskBoxSave::
	ctxt "When you change a"
	line "#mon Box, data"
	cont "will be saved. OK?"
	done

Text_AskMoveMonSave::
	ctxt "Each time you move"
	line "a #mon, data"
	cont "will be saved. OK?"
	done

_ObjectEventText::
	ctxt "Object event"
	done

_AddSignpostText::
	text "TBA."
	done

ReceivedItemText::
	ctxt "<PLAYER> received"
	line "<STRBF4>."
	done

HoldItem_SwapText::
	ctxt "Took <MINB>'s"
	line "<STRBF1> and"

	para "made it hold"
	line "<STRBF2>."
	prompt

HoldItem_MadeHold::
	ctxt "Made <MINB>"
	line "hold <STRBF2>."
	prompt

MonIsntHoldingAnythingText::
	ctxt "<MINB> isn't"
	line "holding anything."
	prompt

ConfirmThrowAwayItemText::
	ctxt "Throw away"
	line "<STRBF2>?"
	done

ThrewAwaySingularItemText::
	ctxt "Threw away"
	line "<STRBF2>."
	prompt

Toss_AskHowMany::
	ctxt "Toss out how many"
	line "<STRBF2>(s)?"
	done

Toss_Confirm::
	ctxt "Throw away @"
	deciram wItemQuantityChangeBuffer, 1, 2
	ctxt ""
	line "<STRBF2>(s)?"
	done

Text_Discarded::
	ctxt "Discarded"
	line "<STRBF1>(s)."
	prompt
