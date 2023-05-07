note: MACRO
	dn (\1), (\2) - 1
	ENDM

sound: MACRO
	note \1, \2
	db \3 ; intensity
	dw \4 ; frequency
	ENDM

noise: MACRO
	note \1, \2 ; duration
	db \3 ; intensity
	db \4 ; frequency
	ENDM

channelcount: MACRO
nchannels = \1 - 1
ENDM

channel: MACRO
	dn (nchannels << 2), \1 - 1
	dw \2
nchannels = 0
	ENDM

cry_header: MACRO
IF _NARG == 3
	db \1
	dw \2, \3
ELSE
	db $ff
	dba \2 ; bank/address
	db \1 - 1 ; species (padding)
ENDC
	ENDM

	enum_start $d8
	enum notetype_cmd
octave: MACRO
	db notetype_cmd - (\1)
	ENDM

notetype: MACRO
	db notetype_cmd
	db \1 ; note_length
	if _NARG >= 2
	db \2 ; intensity
	endc
	ENDM

	enum forceoctave_cmd
forceoctave: MACRO
	db forceoctave_cmd
	db \1 ; octave
	ENDM

	enum tempo_cmd
tempo: MACRO
	db tempo_cmd
	bigdw \1 ; tempo
	ENDM

	enum dutycycle_cmd
dutycycle: MACRO
	db dutycycle_cmd
	db \1 ; duty_cycle
	ENDM

	enum intensity_cmd
intensity: MACRO
	db intensity_cmd
	db \1 ; intensity
	ENDM

	enum soundinput_cmd
soundinput: MACRO
	db soundinput_cmd
	db \1 ; input
	ENDM

	enum sound_duty_cmd
sound_duty: MACRO
	db sound_duty_cmd
	db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6) ; duty sequence
	ENDM

	enum togglesfx_cmd
togglesfx: MACRO
	db togglesfx_cmd
	ENDM

	enum slidepitchto_cmd
slidepitchto: MACRO
	db slidepitchto_cmd
	db \1 - 1 ; duration
	dn \2, \3 - 1 ; octave, pitch
	ENDM

	enum vibrato_cmd
vibrato: MACRO
	db vibrato_cmd
	db \1 ; delay
	db \2 ; extent
	ENDM

	enum skip

	enum togglenoise_cmd
togglenoise: MACRO
	db togglenoise_cmd
	if _NARG > 0
	db \1 ; id
	endc
	ENDM

	enum panning_cmd
panning: MACRO
	db panning_cmd
	db \1 ; tracks
	ENDM

	enum volume_cmd
volume: MACRO
	db volume_cmd
	db \1 ; volume
	ENDM

	enum tone_cmd
tone: MACRO
	db tone_cmd
	bigdw \1 ; tone
	ENDM

	enum inc_octave_cmd
inc_octave: MACRO
	db inc_octave_cmd
	ENDM

	enum dec_octave_cmd
dec_octave: MACRO
	db dec_octave_cmd
	ENDM

	enum tempo_relative_cmd
tempo_relative: MACRO
	db tempo_relative_cmd
	bigdw \1 ; value
	ENDM

	enum restartchannel_cmd
restartchannel: MACRO
	db restartchannel_cmd
	dw \1 ; address
	ENDM

	enum newsong_cmd
newsong: MACRO
	db newsong_cmd
	bigdw \1 ; id
	ENDM

	enum sfxpriorityon_cmd
sfxpriorityon: MACRO
	db sfxpriorityon_cmd
	ENDM

	enum sfxpriorityoff_cmd
sfxpriorityoff: MACRO
	db sfxpriorityoff_cmd
	ENDM

	enum skip

	enum stereopanning_cmd
stereopanning: MACRO
	db stereopanning_cmd
	db \1 ; tracks
	ENDM

	enum sfxtogglenoise_cmd
sfxtogglenoise: MACRO
	db sfxtogglenoise_cmd
	db \1 ; id
	ENDM

	enum customwave_cmd
customwave: MACRO
	db customwave_cmd
	dd \1
	dd \2
	dd \3
	dd \4
	ENDM

	enum arp_cmd
arp: MACRO
	db arp_cmd
	dn \1, \2
	ENDM

	enum portaup_cmd
portaup: MACRO
	db portaup_cmd
	db \1
	ENDM

	enum portadown_cmd
portadown: MACRO
	db portadown_cmd
	db \1
	ENDM

	enum toneporta_cmd
toneporta: MACRO
	db toneporta_cmd
	db \1
	ENDM

	enum notetype0_cmd
notetype0: MACRO
	db notetype0_cmd
	db \1
	ENDM

	enum notetype1_cmd
notetype1: MACRO
	db notetype1_cmd
	db \1
	ENDM

	enum notetype2_cmd
notetype2: MACRO
	db notetype2_cmd
	db \1
	ENDM

	enum skip

	enum setcondition_cmd
setcondition: MACRO
	db setcondition_cmd
	db \1 ; condition
	ENDM

	enum jumpif_cmd
jumpif: MACRO
	db jumpif_cmd
	db \1 ; condition
	dw \2 ; address
	ENDM

	enum jumpchannel_cmd
jumpchannel: MACRO
	db jumpchannel_cmd
	dw \1 ; address
	ENDM

	enum loopchannel_cmd
loopchannel: MACRO
	db loopchannel_cmd
	db \1 ; count
	dw \2 ; address
	ENDM

	enum callchannel_cmd
callchannel: MACRO
	db callchannel_cmd
	dw \1 ; address
	ENDM

	enum endchannel_cmd
endchannel: MACRO
	db endchannel_cmd
	ENDM
