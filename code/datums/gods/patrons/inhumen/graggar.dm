/datum/patron/inhumen/graggar
	name = "Graggar"
	domain = "God of Rule by Might, Grievance and Revenge"
	desc = "<br>We are bound and shackled to the birthright of nobles, beaten and whipped by the arms of their lackeys. That authority and dominion be split in twain between mind and body is an abomination; the coward that commands us never wields the lash, and the coward that lashes never feels the sting of guilt. \
<br>Might does not make right, it is right. Be no coward who commands another to fight on your behalf, stand in the vanguard of your host and lay ruin before you! \
<br>As he ascended, we arise; not as cowards to sulk in darkness as the Matthian thief, but a bold challenge to the strength of arms and right to rule of the Ravoxian soldier. Storm their walls, sack their palaces, carve the hearts of their kings out upon the temple altar. Let the common thralls take up arms or let them cower; the world will be free of Tyranny when no man denies another the right to rebel."
	miracles = list(/datum/action/cooldown/spell/touch/orison					= CLERIC_ORI,
					/datum/action/cooldown/spell/graggar/rush					= CLERIC_T0,
					/datum/action/cooldown/spell/miracle/heal 					= CLERIC_T1,
					/datum/action/cooldown/spell/miracle/bloodmiracle			= CLERIC_T1,
					/datum/action/cooldown/spell/graggar/hamstring				= CLERIC_T1,
					/datum/action/cooldown/spell/projectile/graggar_net		 	= CLERIC_T2,
					/datum/action/cooldown/spell/graggar/graggar_battlecry		= CLERIC_T2,
					/datum/action/cooldown/spell/graggar/exsanguinate		 	= CLERIC_T3,
					/datum/action/cooldown/spell/graggar/avatar					= CLERIC_T4,
					/obj/effect/proc_holder/spell/invoked/resurrect/graggar		= CLERIC_T4,
	)
	confess_lines = list(
		"GRAGGAR IS THE BEAST I WORSHIP!",
		"THROUGH VIOLENCE, DIVINITY!",
		"THE GOD OF CONQUEST DEMANDS BLOOD!",
	)
	storyteller = /datum/storyteller/graggar
	crafting_recipes = list(/datum/crafting_recipe/roguetown/structure/graggar_cross_stone, /datum/crafting_recipe/roguetown/structure/graggar_cross_meat)

	titles = list(
		"Sinistar",
		"Dark Star",
		"Gaiyuke" //Not properly a god worshiped by most kazengunites, but still
	)

/datum/patron/inhumen/graggar/on_lesser_heal(
    mob/living/user,
    mob/living/target,
    message_out,
    message_self,
    conditional_buff,
    situational_bonus,
	is_inhumen
)
	*is_inhumen = TRUE
	*message_out = span_info("Foul fumes billow outward as [target] is restored!")
	*message_self = span_notice("A noxious scent burns my nostrils, but I feel better!")

	var/bonus = 0

	for(var/obj/effect/decal/cleanable/blood/blood in oview(5, target))
		bonus = min(bonus + 0.1, 2.5)

	if(!bonus)
		return

	*situational_bonus = bonus
	*conditional_buff = TRUE

/datum/patron/inhumen/graggar/on_gain(mob/living/living)
	. = ..()

	RegisterSignal(living, COMSIG_LIVING_DRINKED_LIMB_BLOOD, PROC_REF(on_drink_blood))

/datum/patron/inhumen/graggar/proc/on_drink_blood(mob/living/drinker, mob/living/target)
	SIGNAL_HANDLER

	drinker.adjust_hydration(8)

/datum/patron/inhumen/graggar/on_loss(mob/living/living)
	. = ..()

	UnregisterSignal(living, COMSIG_LIVING_DRINKED_LIMB_BLOOD)

// When bleeding, near blood on ground, zchurch, bad-cross, or ritual chalk
/datum/patron/inhumen/graggar/can_pray(mob/living/follower)
	. = ..()
	// Allows prayer in the Zzzzzzzurch(!)
	if(istype(get_area(follower), /area/rogue/under/cave/inhumen))
		return TRUE
	// Allows prayer near EEEVIL psycross
	for(var/obj/structure/fluff/psycross/zizocross/cross in view(4, get_turf(follower)))
		if(cross.divine == TRUE)
			to_chat(follower, span_danger("That accursed cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer if actively bleeding.
	if(follower.bleed_rate > 0)
		return TRUE
	// Allows prayer near blood.
	for(var/obj/effect/decal/cleanable/blood in view(3, get_turf(follower)))
		return TRUE
	// Allows praying atop ritual chalk of the god.
	for(var/obj/structure/ritualcircle/graggar in view(1, get_turf(follower)))
		return TRUE
	to_chat(follower, span_danger("For Graggar to hear my prayers I must either be in the church of the abandoned, near an inverted psycross, near fresh blood or draw blood of my own!"))
	return FALSE
