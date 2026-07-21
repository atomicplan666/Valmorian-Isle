// Emerald Summit port — broadcast horns (Streetpipe / Golden Mouth)
// NOTE: In Emerald Summit these relayed speech through the ES /datum/scommodule comms
// system, which Valmorian replaced with its own scomm architecture. They are currently
// decorative stubs — TODO: wire Hear() into Valmorian's scomm relay.

/obj/structure/broadcast_horn
	name = "\improper Streetpipe"
	desc = "Also known as the People's Mouth, so long as the people can afford the ratfeed to pay for it."
	icon_state = "broadcaster_crass"
	icon = 'icons/roguetown/misc/machines.dmi'
	blade_dulling = DULLING_BASH
	max_integrity = 0
	density = TRUE
	anchored = TRUE
	var/active_listening = TRUE

/obj/structure/broadcast_horn/examine(mob/user)
	. = ..()
	if(active_listening)
		. += "There's a faint skittering coming out of it."
	else
		. += "The rats within are quiet."

/obj/structure/broadcast_horn/redstone_triggered()
	toggle_horn()

/obj/structure/broadcast_horn/proc/toggle_horn()
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	if(active_listening)
		visible_message(span_notice("[src]'s whine stills."))
		active_listening = FALSE
	else
		active_listening = TRUE
		visible_message(span_notice("[src] squeaks alive."))

/obj/structure/broadcast_horn/loudmouth
	name = "\improper Golden Mouth"
	desc = "The Loudmouth's own gleaming horn, its surface engraved with the ducal crest."
	icon_state = "broadcaster"
	active_listening = FALSE

/obj/structure/broadcast_horn/loudmouth/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_INTENTCAP)
	toggle_horn()

/obj/structure/broadcast_horn/loudmouth/guest
	name = "\improper Silver Tongue"
	desc = "A guest's horn. Not as gaudy as the Loudmouth's own, but still a fine piece of craftsmanship. "
	icon_state = "broadcaster_crass"
