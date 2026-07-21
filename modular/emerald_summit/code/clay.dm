// Emerald Summit port — extracted from code/modules/roguetown/roguejobs/ceramicist/clay.dm

/obj/item/natural/clay/glassbatch
	name = "glass batch"
	icon_state = "glassBatch"
	desc = "A mixture of finely ground silica, flux and a stablizer. It glistens against the light, and could be turned into precious glass by a competent potter."
	smeltresult = /obj/item/natural/glass 	// Smelted in a furnace, like a ore.
	grind_results = list(/datum/reagent/iron = 15)
	sellprice = 5
	cooktime = 0
	burntime = 0

