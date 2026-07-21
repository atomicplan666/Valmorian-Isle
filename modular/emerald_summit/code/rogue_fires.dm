// Emerald Summit port — extracted from code/game/objects/lighting/rogue_fires.dm

/obj/machinery/light/rogue/wallfire
	name = "fireplace"
	desc = "A warm fire dances between a pile of half-burnt logs upon a bed of glowing embers."
	icon_state = "wallfire1"
	base_state = "wallfire"
	light_outer_range = 4 //slightly weaker than a torch
	bulb_colour = "#ffa35c"
	density = FALSE
	fueluse = 0
	no_refuel = TRUE
	crossfire = FALSE
	cookonme = TRUE
	var/healing_range = 2
	var/stamina_status_effect = /datum/status_effect/buff/campfire_stamina/fireplace

/obj/machinery/light/rogue/wallfire/inn
	name = "grand fireplace"
	healing_range = 6

/obj/machinery/light/rogue/wallfire/candle
	name = "candles"
	desc = "Tiny flames flicker to the slightest breeze and offer enough light to see."
	icon_state = "wallcandle1"
	base_state = "wallcandle"
	light_outer_range = 3
	crossfire = FALSE
	cookonme = FALSE
	pixel_y = 32
	soundloop = null
	healing_range = 0
	stamina_status_effect = null

/obj/machinery/light/rogue/wallfire/candle/off
	name = "candles"
	desc = "Cold wax sticks in sad half-melted repose. All they need is a spark."
	icon_state = "wallcandle0"
	base_state = "wallcandle"
	crossfire = FALSE
	cookonme = FALSE
	pixel_y = 32
	soundloop = null
	light_on = FALSE
	on = FALSE

/obj/machinery/light/rogue/wallfire/candle/off/r
	pixel_y = 0
	pixel_x = 32

/obj/machinery/light/rogue/wallfire/candle/off/l
	pixel_y = 0
	pixel_x = -32

/obj/machinery/light/rogue/wallfire/candle/OnCrafted(dirin)
	pixel_x = 0
	pixel_y = 0
	switch(dirin)
		if(NORTH)
			pixel_y = 32
		if(SOUTH)
			pixel_y = -32
		if(EAST)
			pixel_x = 32
		if(WEST)
			pixel_x = -32
	. = ..()

/obj/machinery/light/rogue/wallfire/candle/attack_hand(mob/user)
	if(isliving(user) && on)
		user.visible_message(span_warning("[user] snuffs [src]."))
		extinguish()
		return TRUE //fires that are on always have this interaction with lmb unless its a torch
	. = ..()

/obj/machinery/light/rogue/wallfire/candle/r
	pixel_y = 0
	pixel_x = 32

/obj/machinery/light/rogue/wallfire/candle/l
	pixel_y = 0
	pixel_x = -32

/obj/machinery/light/rogue/wallfire/candle/blue
	bulb_colour = "#7b60f3"
	icon_state = "wallcandleb1"
	base_state = "wallcandleb"
	desc = "Tiny bluish flames flicker gently like the stars themselves."

/obj/machinery/light/rogue/wallfire/candle/blue/r
	pixel_y = 0
	pixel_x = 32

/obj/machinery/light/rogue/wallfire/candle/blue/l
	pixel_y = 0
	pixel_x = -32

/obj/machinery/light/rogue/wallfire/candle/weak
	light_power = 0.9
	light_outer_range =  4

/obj/machinery/light/rogue/wallfire/candle/weak/l
	pixel_x = -32
	pixel_y = 0

/obj/machinery/light/rogue/wallfire/candle/weak/r
	pixel_x = 32
	pixel_y = 0

/obj/machinery/light/rogue/wallfire/candle/floorcandle
	name = "candles"
	icon = 'icons/roguetown/items/lighting.dmi'
	icon_state = "floorcandle1"
	base_state = "floorcandle"
	pixel_y = 0
	layer = TABLE_LAYER
	cookonme = FALSE

/obj/machinery/light/rogue/wallfire/candle/floorcandle/alt
	icon_state = "floorcandlee1"
	base_state = "floorcandlee"

/obj/machinery/light/rogue/wallfire/candle/floorcandle/pink
	color = "#f858b5ff"
	bulb_colour = "#ff13d8ff"

/obj/machinery/light/rogue/wallfire/candle/floorcandle/alt/pink
	color = "#f858b5ff"
	bulb_colour = "#ff13d8ff"

