// Emerald Summit port — extracted from code/game/objects/lighting/torch_holder.dm

/obj/machinery/light/rogue/torchholder/lanternpost
	name = "lantern post"
	desc = "A small lamptern dangles from a wooden post. The metal frame around the inner flame casts shadows on its surroundings."
	icon = 'icons/roguetown/misc/tallstructure.dmi'
	icon_state = "streetlantern1"
	base_state = "streetlantern"
	torch_off_state = "streetlantern0"
	brightness = 5
	density = FALSE
	fueluse = 0 //we use the torch's fuel
	no_refuel = TRUE
	soundloop = null
	crossfire = FALSE
	plane = GAME_PLANE_UPPER
	cookonme = FALSE
	var/can_remove = FALSE

