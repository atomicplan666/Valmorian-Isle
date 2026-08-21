/datum/patron/divine/undivided
	name = "Undivided"
	domain = "The Divine, Lyfe, Death, Existence"
	desc = "As Psydon created the Ten to rule over the domains of mortal affairs, it is only right to pay each of the Divines their due. A prayer to Astrata at dawn and a prayer to Noc at dusk, a pinch of incense to Malum to bless a new forge or a sprig of herbs dropped in the hearth's embers to Eora's name; the sensible soul recognizes each power of the universe in the moments they influence mortal affairs. Even Psydon, be He departed or merely in uncertain silence, deserves His moment of respect when passing by the grand ruins of ages past."
	mob_traits = list(TRAIT_UNDIVIDED)
	miracles = list(/datum/action/cooldown/spell/touch/orison					= CLERIC_ORI,
					/datum/action/cooldown/spell/miracle/ignition/undivided		= CLERIC_T0,
					/datum/action/cooldown/spell/undivided/recuperation			= CLERIC_T0,
					/datum/action/cooldown/spell/miracle/heal/undivided			= CLERIC_T1,
					/datum/action/cooldown/spell/miracle/bloodmiracle			= CLERIC_T1,
					/datum/action/cooldown/spell/undivided/twinned_gaze			= CLERIC_T1,
					/datum/action/cooldown/spell/undivided/perseverance			= CLERIC_T2,
					/datum/action/cooldown/spell/undivided/undivided_spellpack	= CLERIC_T2,
					/datum/action/cooldown/spell/miracle/fortify/undivided		= CLERIC_T3,
					/datum/action/cooldown/spell/undivided/gallow_humor			= CLERIC_T3,
					/datum/action/cooldown/spell/undivided/undivided_battlecry	= CLERIC_T4,
					/obj/effect/proc_holder/spell/invoked/resurrect/undivided	= CLERIC_T4
	)
	confess_lines = list(
		"THE HOLY DECAGRAM SHALL SHIELD MY SOUL!",
		"I SERVE THE PANTHEON RESPLENDENT!",
		"THE TEN ETERNAL, FOREVERMORE!",
	)
	storyteller = /datum/storyteller/astrata // no unique storyteller for this one, since its so broad. No real reason to have a unique storyteller - Undivided contributes to ecah of the Ten's follower count.

	titles = list(
		"Ten" // having to put the actual word "Undivided" in your prayers is counterintuitive. they're the ten that's what people call them. Also, for kazengunites, they don't have this concept. Sorryyyyy
	)

/datum/patron/divine/undivided/can_pray(mob/living/follower)
	. = ..()
	// Undivided - More restricted, needs to be within range of a pantheon cross or the church itself.
	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(cross.divine == FALSE)
			to_chat(follower, span_danger("That defiled cross interupts my prayers!"))
			return FALSE
		return TRUE
	// Allows prayer in the church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE

/datum/patron/divine/undivided/on_lesser_heal(
    mob/living/user,
    mob/living/target,
    message_out,
    message_self,
    conditional_buff,
    situational_bonus
)
	*message_out = span_info("A wreath of holy power passes over [target]!") // we're always good.
	*message_self = ("I'm bathed in holy power!")

	*conditional_buff = TRUE
	*situational_bonus = 2
