INCLUDE "includes.asm"

INCLUDE "home.asm"
INCLUDE "battle/files.asm"

INCLUDE "engine/intro_menu.asm"
INCLUDE "tilesets/collision.asm"

SECTION "Demo Sine", ROMX

INCLUDE "data/demosine.asm"

SECTION "Battle Tower data", ROMX

INCLUDE "data/battle_tower.asm"

SECTION "Code 1", ROMX

; linked, do not separate
INCLUDE "data/facings.asm"
INCLUDE "data/map_objects.asm"
INCLUDE "engine/map_object_action.asm"
INCLUDE "engine/map_objects.asm"
INCLUDE "engine/map_object_movement_pattern.asm"
INCLUDE "engine/movement.asm"
INCLUDE "engine/npc_movement.asm"
; end of linked section

INCLUDE "gfx/initialize_map.asm"

INCLUDE "engine/learn.asm"

INCLUDE "engine/link_trade.asm"

INCLUDE "items/item_attributes.asm"

INCLUDE "engine/happiness.asm"

INCLUDE "engine/daycare.asm"

INCLUDE "engine/specials2.asm"

INCLUDE "engine/timeofdaypals.asm"

INCLUDE "misc/mobile_function_refugees.asm"

INCLUDE "battle/place_waiting_text.ctf"

INCLUDE "gfx/push_oam.asm"

INCLUDE "engine/main_menu.ctf"

SECTION "Code 2", ROMX

INCLUDE "engine/color.asm"

INCLUDE "engine/printer.ctf"

INCLUDE "event/customization.ctf"

INCLUDE "event/move_relearner.asm"

INCLUDE "event/poisonstep.asm"

INCLUDE "engine/pokedex2.asm"

SECTION "Code 3", ROMX

; linked, do not separate
INCLUDE "items/item_effects.asm"
INCLUDE "engine/respawnable_event_mon.asm"
; end linked section

INCLUDE "event/daycare.asm"

SECTION "Code 4", ROMX

INCLUDE "engine/pack.asm"
INCLUDE "engine/time.asm"
INCLUDE "engine/tmhm.asm"
INCLUDE "engine/namingscreen.ctf"

INCLUDE "event/itemball.asm"
INCLUDE "engine/healmachineanim.asm"
INCLUDE "event/whiteout.asm"
INCLUDE "event/itemfinder.asm"
INCLUDE "engine/startmenu.ctf"
INCLUDE "engine/selectmenu.asm"
INCLUDE "event/elevator.asm"

INCLUDE "event/magnet_train.asm"

; linked, do not separate
INCLUDE "engine/crash_report.asm"
INCLUDE "engine/emulator_check.asm"
; end linked section

INCLUDE "engine/signpost.ctf"

INCLUDE "event/cage_key_doors.ctf"

SECTION "Code 5", ROMX

INCLUDE "engine/overworld.asm"
INCLUDE "engine/tile_events.asm"
INCLUDE "engine/save.asm"
INCLUDE "engine/spawn_points.asm"
INCLUDE "engine/map_setup.asm"

; linked, do not separate
INCLUDE "engine/mart.ctf"
INCLUDE "engine/money.asm"
INCLUDE "event/bank.ctf"
INCLUDE "items/marts.asm" ; technically can be removed, but should keep it here just in case
; end linked section

PokemonNames:: INCLUDE "data/pokemon_names.asm"

SECTION "Code 6", ROMX

INCLUDE "engine/move_mon.asm"

INCLUDE "engine/move_player_pic.asm"

INCLUDE "engine/name_player.asm"

INCLUDE "engine/playerpic.asm"

INCLUDE "items/pokeball_wobble.asm"

INCLUDE "engine/time_machine.asm"

SECTION "Code 7", ROMX

INCLUDE "data/egg_moves.asm"

INCLUDE "engine/print_number.asm"

INCLUDE "event/hidden_item.asm"

INCLUDE "battle/badge_boosts.asm"

SECTION "Code 8", ROMX

INCLUDE "engine/pokepic.asm"

INCLUDE "engine/objects.asm"

INCLUDE "engine/scrolling_menu.asm"
INCLUDE "engine/switch_items.asm"

INCLUDE "engine/mon_menu.asm"
INCLUDE "battle/menu.asm"
INCLUDE "engine/buy_sell_toss.asm"
INCLUDE "engine/trainer_card.asm"
INCLUDE "trainers/dvs.asm"

INCLUDE "battle/consume_held_item.asm"

INCLUDE "engine/player_movement.asm"

INCLUDE "engine/search.asm"

INCLUDE "engine/changeblocks.asm"

INCLUDE "engine/landmarks.asm"

SECTION "Code 9", ROMX

INCLUDE "engine/link.ctf"

INCLUDE "engine/fruit_trees.asm"

SECTION "Code 10", ROMX

INCLUDE "battle/trainer_huds.asm"

TrainerClassNames:: INCLUDE "trainers/class_names.asm"

INCLUDE "battle/ai/redundant.asm"

INCLUDE "event/move_deleter.asm"

INCLUDE "engine/tmhm2.asm"

MoveDescriptions:: INCLUDE "battle/moves/move_descriptions.ctf"

INCLUDE "battle/initialize.asm"

INCLUDE "battle/music.asm"

INCLUDE "gfx/place_graphic.asm"

INCLUDE "engine/spawn_player.asm"

INCLUDE "engine/object_structs.asm"

INCLUDE "engine/walk_follow.asm"

INCLUDE "engine/heal_party.asm"

INCLUDE "gfx/load_pics.asm"

SECTION "Code 11", ROMX

INCLUDE "battle/ai/move.asm"
INCLUDE "battle/ai/items.asm"

AIScoring: INCLUDE "battle/ai/scoring.asm"

INCLUDE "event/mining.ctf"
INCLUDE "event/smelting.ctf"
INCLUDE "event/jeweling.ctf"

SECTION "Code 12", ROMX

INCLUDE "engine/pokedex.ctf"

INCLUDE "battle/moves/moves.asm"

; linked, do not separate
INCLUDE "engine/evolve.asm"
INCLUDE "data/evos_attacks_pointers.asm"
INCLUDE "data/evos_attacks.asm"
; end linked section

SECTION "Code 13", ROMX

ItemNames:: INCLUDE "items/item_names.asm"

INCLUDE "items/item_descriptions.ctf"

MoveNames:: INCLUDE "battle/moves/move_names.asm"

INCLUDE "engine/sound_stack.asm"

INCLUDE "event/sweet_scent.asm"

SECTION "Code 14", ROMX

; linked, do not separate
INCLUDE "event/pachisi.ctf"
INCLUDE "data/pachisi.asm"
; end linked section

INCLUDE "engine/place_on_screen.ctf"

INCLUDE "engine/items.asm"

INCLUDE "event/magnet_train_station.ctf"

INCLUDE "event/forced_movement.asm"

LandmarkSignGFX:: INCBIN "gfx/frames/landmarksign.2bpp"

SECTION "Code 15", ROMX

INCLUDE "engine/map_triggers.asm"

INCLUDE "engine/copy_tilemap_at_once.asm"

Shrink1Pic: INCBIN "gfx/shrink/shrink1.2bpp.lz"

Shrink2Pic: INCBIN "gfx/shrink/shrink2.2bpp.lz"

INCLUDE "misc/link_display.asm"

Tilesets:: INCLUDE "tilesets/tileset_headers.asm"

INCLUDE "engine/trademon_pic.asm"

INCLUDE "engine/set_caught_data.asm"

INCLUDE "engine/find_pokemon.asm"

INCLUDE "engine/stats_screen.ctf"

INCLUDE "engine/evolution_animation.asm"

INCLUDE "event/end_game.asm"

INCLUDE "battle/sliding_intro.asm"

INCLUDE "misc/gbc_only.asm"

INCLUDE "engine/pokerus.asm"

INCLUDE "engine/main_menu_debug.ctf"

; linked, do not separate
INCLUDE "gfx/palettes.asm"
INCLUDE "tilesets/palette_maps.asm"
; end of linked section

SECTION "Code 16", ROMX

INCLUDE "engine/party_menu.ctf"

INCLUDE "engine/pokemon_structs.asm"

INCLUDE "engine/hp_bars.asm"

INCLUDE "engine/print_mon_stats.asm"

INCLUDE "engine/gender.asm"
INCLUDE "engine/show_pokemon_info.asm"
INCLUDE "engine/switch_party_mons.asm"

; linked, do not separate
BaseData:: INCLUDE "data/base_stats.asm"
INCLUDE "battle/abilities.asm"
INCLUDE "engine/breeding.asm"
; end linked section

INCLUDE "engine/events_2.asm"

SECTION "Code 17", ROMX

; linked, do not separate
INCLUDE "event/park_minigame.ctf"
INCLUDE "data/park_minigame.asm"
; end linked section

INCLUDE "engine/menu.asm"
INCLUDE "event/red_credits.asm"

INCLUDE "engine/fish.asm"

INCLUDE "engine/options_menu.ctf"

INCLUDE "engine/variables.asm"

INCLUDE "engine/hdma.asm"

INCLUDE "event/spurge_gym.asm"

SECTION "Code 18", ROMX

INCLUDE "event/ballmaking.ctf"
INCLUDE "event/happiness_tutor.asm"

INCLUDE "engine/specials.asm"

INCLUDE "engine/vwf.asm"

INCLUDE "engine/math.asm"

SECTION "Code 19", ROMX

INCLUDE "engine/battle_start.asm"

; linked, do not separate
INCLUDE "engine/sprites.asm"
INCLUDE "engine/mon_icons.asm"
; end linked section

INCLUDE "engine/town_map.asm"

INCLUDE "engine/script_conditionals.asm"

INCLUDE "engine/datetimeset.ctf"

SECTION "Code 20", ROMX

INCLUDE "engine/events.asm"
INCLUDE "engine/std_scripts.asm"

SECTION "Code 21", ROMX

; linked, do not separate
INCLUDE "event/battle_tower.asm"
INCLUDE "text/battle_tower.ctf"
; end linked section

INCLUDE "engine/specials_move_tutor.asm"

INCLUDE "battle/bg_effects.asm"

INCLUDE "engine/rtc.asm"

SECTION "Code 22", ROMX

INCLUDE "engine/time_capsule_conversion.asm"

SECTION "Code 23", ROMX

INCLUDE "gfx/pics/animation.asm"
INCLUDE "event/qrcode.ctf"
INCLUDE "engine/treasure_bag.asm"

PackFGFX: INCBIN "gfx/pack/pack_f.2bpp"

SECTION "Code 24", ROMX

INCLUDE "event/slot_machine.asm"

INCLUDE "engine/field_moves.asm"
INCLUDE "engine/field_items.asm"

INCLUDE "engine/stable_rng.asm"

SECTION "Code 25", ROMX

INCLUDE "engine/engine_flags.asm"

INCLUDE "engine/printnum.asm"

INCLUDE "gfx/blank_screen.asm"

SECTION "Code 26", ROMX

INCLUDE "event/bingo.ctf"

SECTION "Code 27", ROMX

INCLUDE "battle/anims.asm"

INCLUDE "engine/print_bcd.asm"

SECTION "Code 28", ROMX

; linked, do not separate
INCLUDE "battle/anim_objects.asm"
INCLUDE "battle/anim_commands.asm"
INCLUDE "engine/growl_roar_ded_vblank_hook.asm"
; end of linked section

INCLUDE "engine/experience.asm"

INCLUDE "engine/pop_mon.asm"

SECTION "Code 29", ROMX

INCLUDE "misc/helper.asm"

INCLUDE "engine/check_nick_errors.asm"

SECTION "Code 30", ROMX

INCLUDE "tilesets/animations.asm"

INCLUDE "event/halloffame.ctf"

INCLUDE "engine/compressed_text.asm"

INCLUDE "engine/math16.asm"

SECTION "Code 31", ROMX

INCLUDE "battle/anim_gfx.asm"

SECTION "Code 32", ROMX

INCLUDE "event/card_flip.asm"
INCLUDE "engine/fossil_puzzle.asm"
INCLUDE "event/memory_game.asm"
INCLUDE "engine/billspc.ctf"
INCLUDE "engine/repel.asm"

SECTION "Code 33", ROMX

INCLUDE "engine/npctrade.asm"

SECTION "Code 34", ROMX

INCLUDE "engine/anim_hp_bar.asm"
INCLUDE "event/sacred_ash.asm"

SECTION "Code 35", ROMX

INCLUDE "engine/title.asm"

INCLUDE "engine/credits.ctf"

SECTION "Code 36", ROMX

INCLUDE "misc/printer_77.ctf"

PrinterHPIcon: INCBIN "gfx/printer/hp.1bpp"
PrinterLvIcon: INCBIN "gfx/printer/lv.1bpp"

INCLUDE "engine/diploma.ctf"

INCLUDE "event/judge.ctf"

QuestionMarkLZ: INCBIN "gfx/pics/questionmark/front.2bpp.lz"

INCLUDE "engine/print_time.asm"

INCLUDE "engine/relative_facing.asm"

INCLUDE "engine/sine.asm"

INCLUDE "data/predefs.asm"

SECTION "Code 37", ROMX

; linked, do not separate
INCLUDE "data/battle_arcade.asm"
INCLUDE "event/battle_arcade.ctf"
; end of linked section

; linked, do not separate
INCLUDE "event/gold_tokens.asm"
INCLUDE "engine/token_tracker.ctf"
; end of linked section

SECTION "Code 38", ROMX

; linked, do not separate
INCLUDE "event/cardgames.ctf"
INCLUDE "event/poker.ctf"
INCLUDE "event/blackjack.ctf"
; end of linked section

; linked, do not separate
INCLUDE "engine/debug_menu.ctf"
INCLUDE "engine/debug_menu_contents.ctf"
; end of linked section

SECTION "Code 39", ROMX

INCLUDE "event/field_moves.asm"

SECTION "Code 40", ROMX

INCLUDE "engine/fade.asm"

INCLUDE "engine/unit_conversion.asm"

SECTION "Code 41", ROMX

INCLUDE "battle/misc.asm"

SECTION "Code 42", ROMX

INCLUDE "engine/font.asm"

SECTION "Code 43", ROMX

INCLUDE "engine/wildmons.asm"

; linked, do not separate
INCLUDE "engine/crystal_intro.asm"
IntroLogoGFX: INCBIN "gfx/intro/logo.2bpp.lz"
; end linked group

INCLUDE "engine/stopwatch.asm"

INCLUDE "engine/warp_connection.asm"

INCLUDE "engine/pokecenter_pc.asm"

; linked, do not separate
INCLUDE "engine/player_step.asm"
INCLUDE "engine/load_map_part.asm"
; end linked section
