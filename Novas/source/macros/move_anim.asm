anim_wait: MACRO
	assert (\1) < $d0, "Move animation delay exceeds 207 frames"
	db \1
	ENDM

	enum_start $d0

	enum anim_obj_command ; d0
anim_obj: MACRO
	db anim_obj_command
	db \1 ; obj
	db (((\2) & $1f) << 3) + (\3) ; x
	db (((\4) & $1f) << 3) + (\5) ; y
	db \6 ; param
ENDM

	enum anim_1gfx_command ; d1
anim_1gfx: MACRO
	db anim_1gfx_command
	db \1 ; gfx1
ENDM

	enum anim_2gfx_command ; d2
anim_2gfx: MACRO
	db anim_2gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
ENDM

	enum anim_3gfx_command ; d3
anim_3gfx: MACRO
	db anim_3gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
ENDM

	enum anim_4gfx_command ; d4
anim_4gfx: MACRO
	db anim_4gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
ENDM

	enum anim_5gfx_command ; d5
anim_5gfx: MACRO
	db anim_5gfx_command
	db \1 ; gfx1
	db \2 ; gfx2
	db \3 ; gfx3
	db \4 ; gfx4
	db \5 ; gfx5
ENDM

	enum anim_incobj_command ; d6
anim_incobj: MACRO
	db anim_incobj_command
	db \1 ; id
ENDM

	enum anim_setobj_command ; d7
anim_setobj: MACRO
	db anim_setobj_command
	db \1 ; id
	db \2 ; obj
ENDM

	enum anim_incbgeffect_command ; d8
anim_incbgeffect: MACRO
	db anim_incbgeffect_command
	db \1 ; effect
ENDM

	enum anim_enemyfeetobj_command ; d9
anim_enemyfeetobj: MACRO
	db anim_enemyfeetobj_command
ENDM

	enum anim_playerheadobj_command ; da
anim_playerheadobj: MACRO
	db anim_playerheadobj_command
ENDM

	enum anim_checkpokeball_command ; db
anim_checkpokeball: MACRO
	db anim_checkpokeball_command
ENDM

	enum anim_transform_command ; dc
anim_transform: MACRO
	db anim_transform_command
ENDM

	enum anim_raisesub_command ; dd
anim_raisesub: MACRO
	db anim_raisesub_command
ENDM

	enum anim_dropsub_command ; de
anim_dropsub: MACRO
	db anim_dropsub_command
ENDM

	enum anim_resetobp0_command ; df
anim_resetobp0: MACRO
	db anim_resetobp0_command
ENDM

	enum anim_sound_command ; e0
anim_sound: MACRO
	db anim_sound_command
	db (\1 << 2) | \2 ; duration, tracks
	db \3 ; id
ENDM

	enum anim_cry_command ; e1
anim_cry: MACRO
	db anim_cry_command
	db \1 ; pitch
ENDM

	enum anim_minimizeopp_command ; e2
anim_minimizeopp: MACRO
	db anim_minimizeopp_command
ENDM

	enum anim_oamon_command ; e3
anim_oamon: MACRO
	db anim_oamon_command
ENDM

	enum anim_oamoff_command ; e4
anim_oamoff: MACRO
	db anim_oamoff_command
ENDM

	enum anim_clearobjs_command ; e5
anim_clearobjs: MACRO
	db anim_clearobjs_command
ENDM

	enum skip ;e6

	enum anim_insobj_command ; e7
anim_insobj: MACRO
	db anim_insobj_command
	db \1
	db \2 ; obj
	db (\3 << 3) + \4 ; x
	db (\5 << 3) + \6 ; y
	db \7 ; param
ENDM

	enum anim_updateactorpic_command ; e8
anim_updateactorpic: MACRO
	db anim_updateactorpic_command
ENDM

	enum anim_minimize_command ; e9
anim_minimize: MACRO
	db anim_minimize_command
ENDM

	enum anim_jumpifpmode_command ; ea
anim_jumpifpmode: MACRO
	db anim_jumpifpmode_command
	dw \1 ; address
ENDM

	enum anim_checkcriticalcapture_command ; eb
anim_checkcriticalcapture: MACRO
	db anim_checkcriticalcapture_command
ENDM

	enum anim_shakedelay_command ; ec
anim_shakedelay: MACRO
	db anim_shakedelay_command
ENDM

	enum skip ; ed

	enum anim_jumpand_command ; ee
anim_jumpand: MACRO
	db anim_jumpand_command
	db \1 ; value
	dw \2 ; address
ENDM

	enum anim_jumpuntil_command ; ef
anim_jumpuntil: MACRO
	db anim_jumpuntil_command
	dw \1 ; address
ENDM

	enum anim_bgeffect_command ; f0
anim_bgeffect: MACRO
	db anim_bgeffect_command
	db \1 ; effect
	db \2 ; unknown
	db \3 ; unknown
	db \4 ; unknown
ENDM

	enum anim_bgp_command ; f1
anim_bgp: MACRO
	db anim_bgp_command
	if _NARG > 1
		db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | ((\4) << 0)
	else
		db \1 ; colors
	endc
ENDM

	enum anim_obp0_command ; f2
anim_obp0: MACRO
	db anim_obp0_command
	if _NARG > 1
		db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | ((\4) << 0)
	else
		db \1 ; colors
	endc
ENDM

	enum anim_obp1_command ; f3
anim_obp1: MACRO
	db anim_obp1_command
	if _NARG > 1
		db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | ((\4) << 0)
	else
		db \1 ; colors
	endc
ENDM

	enum anim_clearsprites_command ; f4
anim_clearsprites: MACRO
	db anim_clearsprites_command
ENDM

	enum anim_darkenball_command ; f5
anim_darkenball: MACRO
	db anim_darkenball_command
ENDM

	enum skip ; f6

	enum anim_clearfirstbgeffect_command ; f7
anim_clearfirstbgeffect: MACRO
	db anim_clearfirstbgeffect_command
ENDM

	enum anim_jumpif_command ; f8
anim_jumpif: MACRO
	db anim_jumpif_command
	db \1 ; value
	dw \2 ; address
ENDM

	enum anim_setvar_command ; f9
anim_setvar: MACRO
	db anim_setvar_command
	db \1 ; value
ENDM

	enum anim_incvar_command ; fa
anim_incvar: MACRO
	db anim_incvar_command
ENDM

	enum anim_jumpvar_command ; fb
anim_jumpvar: MACRO
	db anim_jumpvar_command
	db \1 ; value
	dw \2 ; address
ENDM

	enum anim_jump_command ; fc
anim_jump: MACRO
	db anim_jump_command
	dw \1 ; address
ENDM

	enum anim_loop_command ; fd
anim_loop: MACRO
	db anim_loop_command
	db \1 ; count
	dw \2 ; address
ENDM

	enum anim_call_command ; fe
anim_call: MACRO
	db anim_call_command
	dw \1 ; address
ENDM

	enum anim_ret_command ; ff
anim_ret: MACRO
	db anim_ret_command
ENDM
