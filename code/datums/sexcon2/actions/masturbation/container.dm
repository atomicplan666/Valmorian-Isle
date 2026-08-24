//VALMORIAN: Emerald Summit's masturbate_container, rebuilt on the sexcon2 session API. This is the
//self half of the milking port - milk_genitals.dm covers wringing out someone else.
/datum/sex_action/masturbate/container
	name = "Masturbate into container"
	debug_erp_panel_verb = FALSE

/datum/sex_action/masturbate/container/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user != target)
		return FALSE
	if(!istype(user.get_active_held_item(), /obj/item/reagent_containers/glass))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS) && !user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!check_location_accessible(user, user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	return TRUE

/datum/sex_action/masturbate/container/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!.)
		return FALSE
	if(user != target)
		return FALSE
	if(!istype(user.get_active_held_item(), /obj/item/reagent_containers/glass))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS) && !user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!check_location_accessible(user, user, BODY_ZONE_PRECISE_GROIN, TRUE))
		return FALSE
	return TRUE

/datum/sex_action/masturbate/container/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.visible_message(span_warning("[user] starts masturbating over [user.get_active_held_item()]..."))

/datum/sex_action/masturbate/container/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	user.visible_message(span_warning("[user] stops masturbating into the container."))

/datum/sex_action/masturbate/container/on_perform_message(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/datum/sex_session/sex_session = get_sex_session(user, target)
	var/obj/item/container = user.get_active_held_item()
	var/chosen_verb = pick("pleasures [user.p_themselves()] over \the [container]", "sensually massages [user.p_themselves()] over \the [container]", "masturbates over \the [container]")
	user.visible_message(sex_session.spanify_force("[user] [sex_session.get_generic_force_adjective()] [chosen_verb]."))

/datum/sex_action/masturbate/container/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/datum/sex_session/sex_session = get_sex_session(user, target)
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	do_onomatopoeia(user)

	//Crossing the climax threshold inside this call triggers try_ejaculate() immediately, which
	//routes through handle_climax_message() below - so the climax lands in the container, not on
	//the floor. Anything called after this line would run a climax too late.
	sex_session.perform_sex_action(user, 2, 0, TRUE)

/datum/sex_action/masturbate/container/handle_climax_message(mob/living/carbon/human/user, mob/living/carbon/human/target)
	return "container"
