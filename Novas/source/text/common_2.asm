NameRater_Cancel::
	ctxt "OK, then. Come"
	line "again sometime."
	done

NameRater_Traded::
	ctxt "Hm… <STRBF1>?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat <STRBF1>"
	line "with loving care."
	done

NameRater_Egg::
	ctxt "Whoa… That's just"
	line "an egg."
	done

LearnedMoveText::
	ctxt "<MINB> learned"
	line "<STRBF2>!"
	done

ForgetWhichText::
	ctxt "Which move should"
	line "be forgotten?"
	done

StopLearningText::
	ctxt "Stop learning"
	line "<STRBF2>?"
	done

DidNotLearnText::
	ctxt "<MINB>"
	line "did not learn"
	cont "<STRBF2>."
	prompt

TryingToLearnText::
	ctxt "<MINB> is"
	line "trying to learn"
	cont "<STRBF2>."

	para "But <MINB>"
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for <STRBF2>?"
	done

_ForgotText1::
	ctxt "1, 2 and…"
	done

_ForgotText2::
	ctxt " Poof!@"
	para "<MINB> forgot"
	line "<STRBF1>."

	para "And…"
	prompt

_CantForgetHMText::
	ctxt "HM moves can't be"
	line "forgotten now."
	prompt

PlayWithThreeCoinsText::
	ctxt "Play with three"
	line "coins?"
	done

NotEnoughCoinsText::
	ctxt "Not enough coins…"
	prompt

ChooseACardText::
	ctxt "Choose a card."
	done

PlaceYourBetText::
	ctxt "Place your bet."
	done

PlayAgainText::
	ctxt "Want to play"
	line "again?"
	done

CardsShuffledText::
	ctxt "The cards have"
	line "been shuffled."
	prompt

YeahText::
	text "Yeah!"
	done

DarnText::
	text "Darn…"
	done

NoShakeText::
	ctxt "Oh no! The #mon"
	line "broke free!"
	prompt

OneShakeText::
	ctxt "Aww! It appeared"
	line "to be caught!"
	prompt

TwoShakesText::
	ctxt "Aargh!"
	line "Almost had it!"
	prompt

ThreeShakesText::
	ctxt "Shoot! It was so"
	line "close too!"
	prompt

CaughtText::
	ctxt "Gotcha! <EMON>"
	line "was caught!"
	done

SentToBillsPCText::
	ctxt "<MINB> was"
	line "sent to <STRBF1>"
	cont "in Bill's PC!"
	done

JustFilledBoxText::
	ctxt ""
	para "You've completely"
	line "filled <STRBF1>!"
	done

AddedToPokedexText::
	ctxt "<EMON>'s data"
	line "was newly added to"
	cont "the #dex."
	done

AskNicknameNewlyCaughtMonText::
	ctxt "Give a nickname to"
	line "<STRBF1>?"
	done

CantBeUsedText::
	ctxt "That can't be used"
	line "on this #mon."
	prompt

_PlayedTheFluteText::
	ctxt "Played the"
	line "<STRBF2>."
	prompt

NowThatsACatchyTuneText::
	ctxt "Now, that's a"
	line "catchy tune!"
	prompt

CoinCaseText::
	ctxt "Coins:"
	line "@"
	deciram wCoins, 2, 4
	text ""
	done

Text_RaiseThePPOfWhichMove::
	ctxt "Raise the PP of"
	line "which move?"
	done

Text_RestoreThePPOfWhichMove::
	ctxt "Restore the PP of"
	line "which move?"
	done

Text_PPIsMaxedOut::
	ctxt "<STRBF2>'s PP"
	line "is maxed out."
	prompt

Text_PPsIncreased::
	ctxt "<STRBF2>'s PP"
	line "increased."
	prompt

Text_PPRestored::
	ctxt "PP was restored."
	prompt

Text_LooksBitter::
	ctxt "It looks bitter…"
	prompt

Text_CantUseOnEgg::
	ctxt "That can't be used"
	line "on an egg."
	prompt

Text_IsntTheTime::
	ctxt "This isn't the"
	line "time to use that!"
	prompt

Text_BelongsToSomeoneElse::
	ctxt "That belongs to"
	line "someone else!"
	prompt

Text_WontHaveAnyEffect::
	ctxt "It won't have any"
	line "effect."
	prompt

Text_BlockedTheBall::
	ctxt "The trainer"
	line "blocked the Ball!"

	para "Don't be a thief!"
	prompt

Text_CyclingNotAllowed::
	ctxt "Cycling isn't"
	line "allowed here."
	prompt

Text_CantGetOnBike::
	ctxt "Can't get on your"
	line "<STRBF1> now."
	prompt

Text_BoxFull::
	ctxt "The #mon Box"
	line "is full. That"
	cont "can't be used now."
	prompt

Text_UsedItem::
	ctxt "<PLAYER> used the"
	line "<STRBF2>."
	done

Text_GotOnBike::
	ctxt "<PLAYER> got on the"
	line "<STRBF2>."
	prompt

Text_GotOffBike::
	ctxt "<PLAYER> got off@"
	line "<STRBF2>."
	prompt

Text_KnowsMove::
	ctxt "<STRBF1> knows"
	line "<STRBF2>."
	prompt

MoveDeleter_OneMove::
	ctxt "That #mon knows"
	line "only one move."
	done

MoveDeleter_Confirm::
	ctxt "Oh, make it forget"
	line "<STRBF1>?"
	done

MoveDeleter_Done::
	ctxt "Done! Your #mon"
	line "forgot the move."
	done

MoveDeleter_Egg::
	ctxt "An egg doesn't"
	line "know any moves!"
	done

MoveDeleter_Cancelled::
	ctxt "No? Then, come"
	line "visit me again."
	done

MoveDeleter_WhichMove::
	ctxt "Which move should"
	line "it forget, then?"
	prompt

MoveDeleter_Intro::
	ctxt "Um… Oh, yes, I'm"
	line "the Move Deleter."

	para "I can make #mon"
	line "forget moves."

	para "Shall I make a"
	line "#mon forget?"
	done

MoveDeleter_WhichMon::
	ctxt "Which #mon?"
	prompt

MoveRelearner_NoMovesToLearnText::
	ctxt "This #mon can't"
	line "learn any moves"
	cont "from me."
	done

HappinessTutor_IntroText::
	ctxt "I'm very good at"
	line "judging how happy"

	para "#mon are with"
	line "their trainers."

	para "Would you mind if"
	line "I evaluated yours?"
	done

HappinessTutor_WhichOneText::
	ctxt "Which one should I"
	line "evaluate?"
	prompt

HappinessTutor_AskTeachMoveText::
	ctxt "Oh<...>"
	line "Your <STRBF3><...>"

	para "It really seems to"
	line "love you!"

	para "I think it can use"
	line "<STRBF2> with"
	cont "great ease!"

	para "Would you like me"
	line "to teach the move"

	para "<STRBF2> to"
	line "your <STRBF3>?"
	done

HappinessTutor_ComeAgainText::
	ctxt "Please come again!"
	done

HappinessTutor_DeclinedText::
	ctxt "Aww, you don't"
	line "want to?"
	done

HappinessTutor_EggText::
	ctxt "Oh, your Egg<...>"

	para "It may be happier"
	line "sunny-side up."

	para "Pfft<...>"
	line "I'm kidding!"
	done

HappinessTutor_NotPokemonText::
	ctxt "Oh, your<...>"
	line "Wait<...>"

	para "What even is this?"
	line "That's not a #-"
	cont "mon I've ever"
	cont "seen!"
	done

HappinessTutor_NotHappyEnoughText::
	ctxt "Oh<...>"
	line "Your <STRBF3><...>"

	para "You may want to"
	line "spend a little"
	cont "more time with it."
	done

HappinessTutor_HappyButKnowsText::
	ctxt "Oh<...>"
	line "Your <STRBF3><...>"

	para "It really seems to"
	line "love you!"

	para "Oh, it makes me so"
	line "happy!"
	done

TradeBadMoveFriend::
	ctxt "Your friend is"
	line "trying to trade a"
	para "#mon that has a"
	line "move that doesn't"
	cont "appear in Prism."
	prompt

TradeBadMove::
	ctxt "You can't trade"
	line "your <STRBF1>"
	cont "with <STRBF2>."
	prompt

YouUsedYourLastItemText::
	ctxt "You used your last"
	line "<STRBF2>."
	prompt

_WhatAspectDoYouWantToChangeText::
	ctxt "What aspect do you"
	line "want to change?"
	done

MoveRelearner_WhichMoveText::
	ctxt "Which move should"
	line "it remember?"
	done

MoveRelearner_EggText::
	ctxt "An Egg can't learn"
	line "moves."
	done

MoveRelearner_NotMonText::
	ctxt "What?! That's not"
	line "a #mon!"
	done

SootSackText::
	ctxt "Holding @"
	deciram wSootSackAsh, 2, 5
	ctxt ""
	line "grams of ash."
	done

OrphanPointsText::
	ctxt "Orphan Points:"
	line "@"
	deciram wOrphanPoints, 2, 5
	text ""
	done

ReceivedItemTextPlural::
	ctxt "<PLAYER> received @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text ""
	line "<STRBF4>."
	done

Text_PutItemInPocket::
	ctxt "<PLAYER> put the"
	line "<STRBF1> in"
	cont "the <STRBF3>."
	done

PocketIsFull::
	ctxt "The <STRBF3>"
	line "is full…"
	prompt

Pharmacy_Thanks::
	ctxt "Thanks a lot!"
	done

PutFossilInCaseText_::
	ctxt "<PLAYER> put the"
	line "Fossil in the"
	cont "Fossil Case."
	done

NoRoomForFossilText_::
	ctxt "But the Fossil"
	line "Case is full<...>"
	done

NoFossilCaseText_::
	ctxt "But <PLAYER> doesn't"
	line "have a Fossil"
	cont "Case<...>"
	done

FruitBearingTreeText::
	ctxt "It's a fruit-"
	line "bearing tree."
	done

HeyItsFruitText::
	ctxt "Hey! It's"
	line "<STRBF3>!"
	done

ItsShinyApricornText::
	ctxt "Hey! This is a"
	line "shiny Apricorn!"
	done

ObtainedFruitText::
	ctxt "Obtained"
	line "<STRBF3>!"
	done

FruitPackIsFullText::
	ctxt "But the pack is"
	line "full…"
	done

NothingHereText::
	ctxt "There's nothing"
	line "here…"
	done

Text_RecoveredSomeHP::
	ctxt "<STRBF1>"
	line "recovered @"
	deciram wCurHPAnimDeltaHP, 2, 3
	text "HP!"
	done

Text_CuredOfPoison::
	ctxt "<STRBF1>'s"
	line "cured of poison."
	done

Text_RidOfParalysis::
	ctxt "<STRBF1>'s"
	line "rid of paralysis."
	done

Text_BurnWasHealed::
	ctxt "<STRBF1>'s"
	line "burn was healed."
	done

Text_Defrosted::
	ctxt "<STRBF1>"
	line "was defrosted."
	done

Text_WokeUp::
	ctxt "<STRBF1>"
	line "woke up."
	done

Text_HealthReturned::
	ctxt "<STRBF1>'s"
	line "health returned."
	done

Text_Revitalized::
	ctxt "<STRBF1>"
	line "is revitalized."
	done

Text_GrewToLevel::
	ctxt "<STRBF1> grew to"
	line "level @"
	deciram wCurPartyLevel, 1, 3
	text "!"
	done

Text_CameToItsSenses::
	ctxt "<STRBF1> came"
	line "to its senses."
	done

Text_BattleTowerSelect_IsThisOkay::
	ctxt "Is this okay?"
	done

Text_PleaseSetTheTime::
	ctxt "Please set the"
	line "time."
	prompt

Trade_WasSentToText::
	text_from_ram wPlayerTrademonSpeciesName
	ctxt " was"
	line "sent to @"
	text_from_ram wOTTrademonSenderName
	text "."
	done

Trade_BidsFarewellText::
	text_from_ram wOTTrademonSenderName
	ctxt " bids"
	line "farewell to"
	done

Trade_TakeGoodCareOfText::
	ctxt "Take good care of"
	line "@"
Trade_SpeciesText::
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

Trade_ForPlayersMon::
	text "For @"
	text_from_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wPlayerTrademonSpeciesName
	text ","
	done

Trade_OtherSends::
	text_from_ram wOTTrademonSenderName
	ctxt " sends"
	line "@"
	text_from_ram wOTTrademonSpeciesName
	text "."
	done

Trade_WillTradeText::
	text_from_ram wOTTrademonSenderName
	ctxt " will"
	line "trade @"
	text_from_ram wOTTrademonSpeciesName
	done

Trade_ForOthersMon::
	text "for @"
	text_from_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_from_ram wPlayerTrademonSpeciesName
	text "."
	done

HerbShop_ComeAgain::
	ctxt "Come again, dear."
	line "Hehehehe<...>"
	done

MapMysteryZoneText::
	ctxt "That's strange<...>"
	para "The map is only"
	line "displaying static."
	prompt

AskDateOkayContinueText::
	ctxt ""
	para "Is that correct?"
	done

TravelToThisDateText::
	ctxt ""
	para "Travel to this"
	line "date?"
	done
