SECTION "Misc GFX", ROMX
; Various misc graphics here.

StatsTilesGFX:: INCBIN "gfx/stats/stats_tiles.2bpp"
ShinyIcon:: INCBIN "gfx/stats/shiny.2bpp"
ExpBarEndsGFX:: INCBIN "gfx/stats/exp_bar_ends.2bpp" ; ; not referenced on its own, but loaded along with StatsTilesGFX
EnemyHPBarBorderGFX:: INCBIN "gfx/battle/enemy_hp_bar_border.1bpp"
HPExpBarBorderGFX:: INCBIN "gfx/battle/hp_exp_bar_border.1bpp"
ExpBarGFX:: INCBIN "gfx/battle/expbar.2bpp"
TownMapGFX:: INCBIN "gfx/town_map/town_map.2bpp.lz"
TextBoxSpaceGFX:: INCBIN "gfx/frames/space.2bpp"
UpArrowGFX:: INCBIN "gfx/font/up_arrow.2bpp"
Footprints:: INCBIN "gfx/pokedex/footprints.1bpp"

SECTION "End GFX", ROMX
TheEndGFX:: INCBIN "gfx/credits/theend.2bpp"
