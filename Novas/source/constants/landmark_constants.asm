LANDMARK_MAP_WIDTH EQU 18
LANDMARK_MAP_HEIGHT EQU 15

region_def: MACRO
	enum REGION_\1
\1_LANDMARK EQU const_value
	ENDM

	enum_start

	const_def
	const SPECIAL_MAP        ; 00

	region_def NALJO
	const HEATH_VILLAGE      ; 01
	const ROUTE_69           ; 02
	const ROUTE_70           ; 03
	const CAPER_CITY         ; 04
	const ROUTE_71           ; 05
	const ROUTE_72           ; 06
	const OXALIS_CITY        ; 07
	const ROUTE_73           ; 08
	const MOUND_CAVE         ; 09
	const SPURGE_CITY        ; 0a
	const ROUTE_74           ; 0b
	const ROUTE_75           ; 0c
	const LAUREL_CITY        ; 0d
	const ROUTE_76           ; 0e
	const LAUREL_FOREST      ; 0f
	const TORENIA_CITY       ; 10
	const ROUTE_83           ; 11
	const ROUTE_77           ; 12
	const MILOS_CATACOMBS    ; 13
	const PHACELIA_CITY      ; 14
	const BATTLE_TOWER       ; 15
	const ROUTE_78           ; 16
	const ROUTE_79           ; 17
	const SAXIFRAGE_ISLAND   ; 18
	const ROUTE_80           ; 19
	const ROUTE_81           ; 1a
	const PROVINICIAL_PARK   ; 1b
	const FIRELIGHT_CAVERNS  ; 1c
	const ROUTE_85           ; 1d
	const NALJO_RUINS        ; 1e
	const CLATHRITE_TUNNEL   ; 1f
	const ROUTE_84           ; 20
	const PHLOX_TOWN         ; 21
	const ACQUA_MINES        ; 22
	const ROUTE_82           ; 23
	const ACANIA_DOCKS       ; 24
	const ROUTE_68           ; 25
	const NALJO_BORDER       ; 26
	const ROUTE_86           ; 27
	const CHAMPION_ISLE      ; 28
	const TUNNEL             ; 29
	const ROUTE_87           ; 2a
	const FARAWAY_ISLAND     ; 2b
	const DUMMY2             ; 2c
	const DUMMY3             ; 2d
	const DUMMY4             ; 2e

	region_def RIJON
	const SEASHORE_CITY      ; 2f
	const ROUTE_53           ; 30
	const GRAVEL_TOWN        ; 31
	const MERSON_CAVE        ; 32
	const ROUTE_54           ; 33
	const MERSON_CITY        ; 34
	const ROUTE_55           ; 35
	const RIJON_UNDERGROUND  ; 36
	const ROUTE_52           ; 37
	const HAYWARD_CITY       ; 38
	const ROUTE_64           ; 39
	const ROUTE_51           ; 3a
	const ROUTE_50           ; 3b
	const ROUTE_49           ; 3c
	const OWSAURI_CITY       ; 3d
	const ROUTE_66           ; 3e
	const ROUTE_48           ; 3f
	const ROUTE_63           ; 40
	const SILK_TUNNEL        ; 41
	const MORAGA_TOWN        ; 42
	const ROUTE_60           ; 43
	const JAERU_CITY         ; 44
	const ROUTE_59           ; 45
	const SILPH_WAREHOUSE    ; 46
	const BOTAN_CITY         ; 47
	const HAUNTED_FOREST     ; 48
	const POWER_PLANT        ; 49
	const ROUTE_58           ; 4a
	const CASTRO_VALLEY      ; 4b
	const CASTRO_MANSION     ; 4c
	const CASTRO_FOREST      ; 4d
	const ROUTE_62           ; 4e
	const ROUTE_61           ; 4f
	const ROUTE_57           ; 50
	const ROUTE_56           ; 51
	const EAGULOU_CITY       ; 52
	const EAGULOU_PARK       ; 53
	const ROUTE_65           ; 54
	const RIJON_LEAGUE       ; 55
	const ROUTE_67           ; 56
	const MT_BOULDER         ; 57
	const SENECA_CAVERNS     ; 58

	region_def JOHTO
	const ROUTE_47           ; 59
	const ILEX_FOREST        ; 5a
	const AZALEA_TOWN        ; 5b
	const ROUTE_34           ; 5c
	const GOLDENROD_CITY     ; 5d
	const GOLDENROD_CAPE     ; 5e

	region_def KANTO
	const SAFFRON_CITY       ; 5f

	region_def SEVII
	const EMBER_BROOK        ; 60
	const MT_EMBER           ; 61
	const KINDLE_ROAD        ; 62

	region_def TUNOD
	const TUNOD_WATERWAY     ; 63
	const SOUTH_SOUTHERLY    ; 64
	const SOUTHERLY_CITY     ; 65

	region_def MYSTERY
	const MYSTERY_ZONE       ; 66
