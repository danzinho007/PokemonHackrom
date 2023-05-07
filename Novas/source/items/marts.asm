Marts:
	dw Mart0
	dw Mart1
	dw Mart2
	dw Mart3
	dw Mart4
	dw Mart5
	dw Mart6
	dw Mart7
	dw Mart8
	dw Mart9
	dw Mart10
	dw Mart11
	dw Mart12
	dw Mart13
	dw Mart14
	dw Mart15
	dw Mart16
	dw Mart17
	dw Mart18
	dw Mart19
	dw Mart20
	dw Mart21
	dw Mart22
	dw Mart23
	dw Mart24
	dw Mart25
	dw Mart26
	dw Mart27
	dw Mart28
	dw Mart29
	dw Mart30
	dw Mart31
	dw Mart32
	dw Mart33
	dw Mart34
	dw Mart35
MartsEnd:

GoldTokenMarts:
	dw SpurgeMartGoldTokenExchange
	dw LaurelMartGoldTokenExchange
	dw AcaniaMartGoldTokenExchange
	dw JaeruGuardGoldTokenExchange
GoldTokenMartsEnd:

DefaultMart:
Mart0:
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db ESCAPE_ROPE
	db REPEL
	db $ff

Mart1:
	db 8 ; # items
	db BRICK_PIECE
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db BURN_HEAL
	db AWAKENING
	db REPEL
	db $ff

Mart2:
	db 8 ; # items
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db X_SP_DEF
	db X_ACCURACY
	db GUARD_SPEC
	db DIRE_HIT
	db $ff

Mart3:
	db 8 ; # items
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db MOOMOO_MILK
	db $ff

Mart4:
	db 3 ; # items
	db BURGER
	db FRIES
	db SODA_POP
	db $ff

Mart5:
	db 5 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ESCAPE_ROPE
	db REPEL
	db POKE_DOLL
	db $ff

Mart6:
	db 8 ; # items
	db MINING_PICK
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db ESCAPE_ROPE
	db REPEL
	db $ff

Mart7:
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db REVIVE
	db $ff

Mart8:
	db 8 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db PARLYZ_HEAL
	db AWAKENING
	db ANTIDOTE
	db SUPER_REPEL
	db ESCAPE_ROPE
	db REVIVE
	db $ff

Mart9:
	db 7 ; # items
	db MINING_PICK
	db ULTRA_BALL
	db GREAT_BALL
	db HYPER_POTION
	db SUPER_POTION
	db SUPER_REPEL
	db X_DEFEND
	db $ff

Mart10:
	db 5 ; # items
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db $ff

Mart11:
	db 8 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db FULL_HEAL
	db REVIVE
	db MAX_REPEL
	db ESCAPE_ROPE
	db $ff

Mart12:
	db 9 ; # items
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db MAX_REPEL
	db ESCAPE_ROPE
	db REVIVE
	db ANTIDOTE
	db FULL_HEAL
	db X_ACCURACY
	db $ff

Mart13:
	db 8 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ICE_HEAL
	db SUPER_REPEL
	db $ff

Mart14:
	db 7 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db FULL_HEAL
	db REVIVE
	db ELIXIR
	db $ff

Mart15:
	db 3 ; # items
	db TINYMUSHROOM
	db POKE_BALL
	db POTION
	db $ff

Mart16:
	db 7 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db SUPER_REPEL
	db REVIVE
	db $ff

Mart17:
	db 9 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db REVIVE
	db MAX_REPEL
	db X_DEFEND
	db X_ATTACK
	db $ff

Mart18:
	db 8 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db FULL_HEAL
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db $ff

Mart19:
	db 7 ; # items
	db WATER_STONE
	db POKE_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db $ff

Mart20:
	db 9 ; # items
	db FIRE_STONE
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db SUPER_REPEL
	db FULL_HEAL
	db X_DEFEND
	db X_ATTACK
	db DIRE_HIT
	db $ff

Mart21:
	db 8 ; # items
	db LEAF_STONE
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db MAX_REPEL
	db FULL_HEAL
	db PARLYZ_HEAL
	db AWAKENING
	db $ff

Mart22:
	db 7 ; # items
	db THUNDERSTONE
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db PARLYZ_HEAL
	db FULL_HEAL
	db $ff

Mart23:
	db 6 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db $ff

Mart24:
	db 3 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db $ff

Mart25:
	db 6 ; # items
	db FULL_HEAL
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db $ff

Mart26:
	db 5 ; # items
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db ESCAPE_ROPE
	db POKE_DOLL
	db $ff

Mart27:
	db 5 ; # items
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db $ff

Mart28:
	db 7 ; # items
	db X_ACCURACY
	db GUARD_SPEC
	db DIRE_HIT
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db $ff

Mart29:
	db 6 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db PARLYZ_HEAL
	db AWAKENING
	db SUPER_REPEL
	db ESCAPE_ROPE
	db $ff

Mart30:
	db 7 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db $ff

Mart31:
	db 5 ; # items
	db EAGULOU_BALL
	db ULTRA_BALL
	db MAX_POTION
	db ESCAPE_ROPE
	db MAX_REPEL
	db $ff

Mart32:
	db 7 ; # items
	db ULTRA_BALL
	db MAX_REPEL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db $ff

Mart33:
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db $ff
	
Mart34:
	db 7 ; # items
	db ULTRA_BALL
	db MAX_POTION
	db FULL_RESTORE
	db BURN_HEAL
	db FULL_HEAL
	db MAX_REPEL
	db ELIXIR
	db $ff

Mart35:
	db 12
	db MAX_REVIVE
	db MAX_ELIXIR
	db RARE_CANDY
	db PP_UP
	db SACRED_ASH
	db MOON_STONE
	db SUN_STONE
	db DAWN_STONE
	db SHINY_STONE
	db DUSK_STONE
	db TRADE_STONE
	db EXP_SHARE
	db $ff

BattleTowerMart:
	db 16
	db PROTEIN,       1
	db CALCIUM,       1
	db IRON,          1
	db CARBOS,        1
	db HP_UP,         1
	db POISON_GUARD, 16
	db BURN_GUARD,   16
	db FREEZE_GUARD, 16
	db SLEEP_GUARD,  16
	db PRZ_GUARD,    16
	db BRIGHTPOWDER, 32
	db FOCUS_BAND,   32
	db SCOPE_LENS,   32
	db QUICK_CLAW,   32
	db RAZOR_CLAW,   48
	db RAZOR_FANG,   48
	db RARE_CANDY,   48
	db $ff

BattleArcadePrizesAndCosts:
	db 15
	db LUCKY_PUNCH,   25
	db EVERSTONE,     30
	db SILVERPOWDER,  40
	db RAZOR_FANG,    50
	db RAZOR_CLAW,    50
	db DRAGON_FANG,   60
	db EVIOLITE,      75
	db FRIEND_BALL,  100
	db MAX_REVIVE,   125
	db MAX_ELIXIR,   150
	db TRADE_STONE,  175
	db RARE_CANDY,   200
	db PP_UP,        225
	db SACRED_ASH,   250
	db MYSTERY_TCKT,   0
	db $ff

SpurgeMartGoldTokenExchange:
; 9 total
	db 3
	dbbw OLD_ROD, 2, EVENT_HAS_OLD_ROD
	dbbw LEFTOVERS, 2, EVENT_HAS_GOLD_TOKEN_LEFTOVERS
	dbbw TIME_MACHINE, 5, EVENT_HAS_TIME_MACHINE
	db $ff

LaurelMartGoldTokenExchange:
; 10 total
	db 3
	dbbw TRADE_STONE, 2, EVENT_HAS_GOLD_TOKEN_TRADE_STONE
	dbbw EXP_SHARE, 3, EVENT_HAS_EXP_SHARE
	dbbw ITEMFINDER, 5, EVENT_HAS_ITEMFINDER
	db $ff

AcaniaMartGoldTokenExchange:
; 35 total
	db 6
	dbbw YELLOW_FLUTE, 3, EVENT_HAS_YELLOW_FLUTE
	dbbw AMULET_COIN, 3, EVENT_HAS_AMULET_COIN	
	dbbw TOKENTRACKER, 5, EVENT_HAS_TOKENTRACKER
	dbbw QR_READER, 5, EVENT_HAS_QR_READER
	dbbw IRON_PICKAXE, 9, EVENT_HAS_IRON_PICKAXE
	dbbw SMELTER, 10, EVENT_HAS_SMELTER
	db $ff

JaeruGuardGoldTokenExchange:
; 30 total
	db 6
	dbbw LUCKY_EGG, 5, EVENT_HAS_LUCKY_EGG
	dbbw HYPER_SHARE, 5, EVENT_HAS_HYPER_SHARE
	dbbw MACHO_BRACE, 5, EVENT_HAS_MACHO_BRACE
	dbbw EXPERT_BELT, 5, EVENT_HAS_EXPERT_BELT
	dbbw MUSCLE_BAND, 5, EVENT_HAS_MUSCLE_BAND
	dbbw WISE_GLASSES, 5, EVENT_HAS_WISE_GLASSES
	db $ff
