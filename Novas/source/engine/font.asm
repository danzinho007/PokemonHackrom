_LoadStandardFont::
	ld de, Font
	ld hl, vFontTiles
	lb bc, BANK(Font), $80
	ldh a, [rLCDC]
	bit 7, a
	jp z, Copy1bpp

	ld de, Font
	ld hl, vFontTiles
	lb bc, BANK(Font), $20
	call Get1bpp
	ld de, Font + $20 * LEN_1BPP_TILE
	ld hl, vFontTiles tile $20
	lb bc, BANK(Font), $20
	call Get1bpp
	ld de, Font + $40 * LEN_1BPP_TILE
	ld hl, vFontTiles tile $40
	lb bc, BANK(Font), $20
	call Get1bpp
	ld de, Font + $60 * LEN_1BPP_TILE
	ld hl, vFontTiles tile $60
	lb bc, BANK(Font), $20
	jp Get1bpp

_LoadFontsExtra1::
	ld de, .SolidBlackTile
	ld hl, vBGTiles tile $60
	lb bc, BANK(_LoadFontsExtra1), 1
	call Get1bpp
	ld de, FontExtra + 3 tiles
	ld hl, vBGTiles tile $63
	lb bc, BANK(FontExtra), $16
	call Get2bpp
	jr LoadFrame

.SolidBlackTile
rept 8
	db $ff
endr

_LoadFontsExtra2::
	ld de, UpArrowGFX
	ld hl, vBGTiles tile $61
	lb bc, BANK(UpArrowGFX), 1
	jp Get2bpp

_LoadFontsBattleExtra::
	ld de, FontBattleExtra
	ld hl, vBGTiles tile $60
	lb bc, BANK(FontBattleExtra), $19
	call Get2bpp

LoadFrame:
	ld a, [wTextBoxFrame]
	ld bc, TILES_PER_FRAME * LEN_1BPP_TILE
	ld hl, Frames
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, vBGTiles tile $79
	lb bc, BANK(Frames), TILES_PER_FRAME
	call Get1bpp
	ld hl, vBGTiles tile $7f
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	jp Get1bpp

LoadBattleFontsHPBar:
	ld de, FontBattleExtra
	ld hl, vBGTiles tile $60
	lb bc, BANK(FontBattleExtra), $c
	call Get2bpp
	ld hl, vBGTiles tile $70
	ld de, FontBattleExtra + $10 * LEN_2BPP_TILE
	lb bc, BANK(FontBattleExtra), 3
	call Get2bpp
	call LoadFrame

LoadHPBar:
	ld de, EnemyHPBarBorderGFX
	ld hl, vBGTiles tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp
	ld de, HPExpBarBorderGFX
	ld hl, vBGTiles tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bpp
	ld de, ExpBarGFX
	ld hl, vBGTiles tile $55
	lb bc, BANK(ExpBarGFX), 11
	jp Get2bpp

StatsScreen_LoadFont:
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, vBGTiles tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp
	ld de, HPExpBarBorderGFX
	ld hl, vBGTiles tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bpp
	ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	ld hl, vBGTiles tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bpp
	ld de, ExpBarGFX
	ld hl, vBGTiles tile $55
	lb bc, BANK(ExpBarGFX), 10
	call Get2bpp

LoadStatsScreenPageTilesGFX:
	ld de, StatsTilesGFX
	ld hl, vBGTiles tile $31
	lb bc, BANK(StatsTilesGFX), $11
	jp Get2bpp
