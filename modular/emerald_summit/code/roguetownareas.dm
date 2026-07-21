// Emerald Summit port — extracted from code/game/area/roguetownareas.dm

/area/rogue/outdoors/river
	name = "river"
	icon_state = "river"
	warden_area = TRUE
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	converted_type = /area/rogue/indoors/shelter/woods

/area/rogue/under/cavewet/bogcaves/sunkencity
	first_time_text = "MELTED UNDERCITY"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/underdark.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ceiling_protected = TRUE

