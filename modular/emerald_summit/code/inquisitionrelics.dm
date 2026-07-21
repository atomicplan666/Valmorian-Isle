// Emerald Summit port — extracted from code/game/objects/items/rogueitems/inquisitionrelics.dm

/obj/item/inqarticles/tallowpot
	name = "tallowpot"
	desc = "A small metal pot meant for holding waxes or melted redtallow. Convenient for coating signet rings and making an imprint. The warmth of a torch or lamptern should be enough to melt the redtallow for stamping writs."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "tallowpot"
	item_state = "tallowpot"
	dropshrink = 0.9
	throw_speed = 1
	throw_range = 3
	throwforce = 5
	possible_item_intents = list(/datum/intent/use)
	grid_height = 32
	grid_width = 32
	obj_flags = CAN_BE_HIT
	experimental_inhand = TRUE
	w_class = WEIGHT_CLASS_SMALL
	intdamage_factor = 0
	embedding = null
	var/tallow
	var/remaining
	var/heatedup
	var/messageshown = 1
	sellprice = 0

/obj/item/inqarticles/tallowpot/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)	// For making sure it melts.

/obj/item/inqarticles/tallowpot/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/inqarticles/tallowpot/process()
	if(heatedup > 0)
		heatedup -= 4
		remaining = max(remaining - 20, 0)
		messageshown = 0
	else
		if(tallow)
			if(!messageshown)
				visible_message(span_info("The redtallow in [src] hardens again."))
				messageshown = 1
			update_icon()
	if(remaining == 0)
		qdel(tallow)
		tallow = initial(tallow)
		update_icon()

/obj/item/inqarticles/tallowpot/attacked_by(obj/item/I, mob/living/user)
	. = ..()
	if(istype(I, /obj/item/reagent_containers/food/snacks/tallow/red))
		if(!tallow)
			var/obj/item/reagent_containers/food/snacks/tallow/red/Q = I
			tallow = Q
			user.transferItemToLoc(Q, src, TRUE)
			remaining = 300
			update_icon()
		else
			to_chat(user, span_info("The [src] already has redtallow in it."))

	if(istype(I, /obj/item/flashlight/flare/torch/))		
		heatedup = 28
		visible_message(span_info("[user] warms [src] with [I]."))
		update_icon()

	if(istype(I, /obj/item/clothing/ring/signet))	
		if(tallow && heatedup)	
			var/obj/item/clothing/ring/signet/ring = I
			ring.tallowed = TRUE
			ring.update_icon()

/obj/item/inqarticles/tallowpot/update_icon()
	. = ..()	
	if(tallow)
		icon_state = "[initial(icon_state)]_filled"
		if(heatedup)
			icon_state = "[initial(icon_state)]_melted"
	else
		icon_state = "[initial(icon_state)]"

