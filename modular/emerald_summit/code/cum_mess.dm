// Emerald Summit port — the "mess" status-effect layer sexcon2 never got when VI moved off ES's
// monolithic sexcon. Ported from code/datums/sexcon/sexcon.dm's /datum/status_effect/facial family
// and apply_creampie_drip(). The actual application logic (cum_onto()/cum_into() equivalents) lives
// in code/modules/sexcon/components/arousal.dm, next to the rest of the climax handling; this file
// only holds the status effects themselves and the two small global helpers ES also kept as globals.
//
// Not ported: ES's floor-puddle drip-into-a-nearby-glass detail and the lick-up-drips-for-a-buff
// consumption loop (consume_oral_drips/apply_cum_consumed_buff) - a separate stretch feature nobody
// asked for, not the "mess" examine text this was actually about.

/datum/status_effect/facial
	id = "facial"
	alert_type = null // don't show an alert on screen
	tick_interval = 12 MINUTES // use this time as our dry count down
	var/has_dried_up = FALSE // used as our dry status

/datum/status_effect/facial/internal
	id = "creampie"
	alert_type = null
	tick_interval = 7 MINUTES

/datum/status_effect/facial/external
	id = "cumshot"
	alert_type = null
	tick_interval = 10 MINUTES

/datum/status_effect/facial/on_apply()
	RegisterSignal(owner, list(COMSIG_COMPONENT_CLEAN_ACT, COMSIG_COMPONENT_CLEAN_FACE_ACT), PROC_REF(clean_up))
	has_dried_up = FALSE
	return ..()

/datum/status_effect/facial/on_remove()
	UnregisterSignal(owner, list(COMSIG_COMPONENT_CLEAN_ACT, COMSIG_COMPONENT_CLEAN_FACE_ACT))
	return ..()

/datum/status_effect/facial/tick()
	has_dried_up = TRUE

/datum/status_effect/facial/proc/refresh_cum()
	has_dried_up = FALSE
	tick_interval = world.time + initial(tick_interval)

/datum/status_effect/facial/proc/clean_up(datum/source, strength)
	SIGNAL_HANDLER
	if(strength >= CLEAN_WEAK && !QDELETED(owner))
		owner.remove_status_effect(src)

/datum/status_effect/creampie_leak
	id = "creampie_leak"
	alert_type = null
	tick_interval = 12 SECONDS
	duration = 60 SECONDS
	var/contents_to_drip = /datum/reagent/erpjuice/cum
	var/orifice = SEX_PART_NULL

/datum/status_effect/creampie_leak/on_creation(mob/living/new_owner, orifice_in = SEX_PART_NULL)
	orifice = orifice_in
	return ..(new_owner)

/datum/status_effect/creampie_leak/long
	id = "creampie_leak_long"
	alert_type = null
	tick_interval = 12 SECONDS
	duration = 120 SECONDS

/datum/status_effect/creampie_leak/on_apply()
	RegisterSignal(owner, COMSIG_COMPONENT_CLEAN_ACT, PROC_REF(clean_up))
	to_chat(owner, span_love("I feel a warmth beginning to leak out of me."))
	return ..()

/datum/status_effect/creampie_leak/on_remove()
	UnregisterSignal(owner, COMSIG_COMPONENT_CLEAN_ACT)
	return ..()

/datum/status_effect/creampie_leak/proc/clean_up(datum/source, strength)
	SIGNAL_HANDLER
	if(strength >= CLEAN_WEAK && !QDELETED(owner))
		owner.remove_status_effect(src)

/datum/status_effect/creampie_leak/tick()
	var/turf/cur_loc = get_turf(owner)
	if(!cur_loc)
		return
	new /obj/effect/decal/cleanable/coom(cur_loc)

///Applies or accumulates a creampie drip status effect, ORing new orifice flags onto an existing drip rather than dropping the second application.
/proc/apply_creampie_drip(mob/living/carbon/human/target, orifice, use_long = FALSE)
	var/datum/status_effect/creampie_leak/existing = target.has_status_effect(/datum/status_effect/creampie_leak/long) || target.has_status_effect(/datum/status_effect/creampie_leak)
	if(existing)
		existing.orifice |= orifice
		to_chat(target, span_love("I feel another warmth beginning to leak out of me."))
		existing.duration = world.time + initial(existing.duration)
		return
	if(use_long)
		target.apply_status_effect(/datum/status_effect/creampie_leak/long, orifice)
	else
		target.apply_status_effect(/datum/status_effect/creampie_leak, orifice)
