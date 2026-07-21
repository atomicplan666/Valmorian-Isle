// Emerald Summit port — extracted from code/game/turfs/open/transparent.dm

/turf/open/transparent/glass
	name = "Glass floor"
	desc = ""
	icon = 'icons/turf/floors/glass.dmi'
	icon_state = "floor_glass"
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/open/transparent/glass, /turf/open/transparent/glass/reinforced)
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/transparent/glass/Initialize()
	icon_state = "" //Prevent the normal icon from appearing behind the smooth overlays
	return ..()

/turf/open/transparent/glass/reinforced
	name = "Reinforced glass floor"
	desc = ""
	icon = 'icons/turf/floors/reinf_glass.dmi'

