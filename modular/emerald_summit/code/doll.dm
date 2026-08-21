// Emerald Summit port — Doll subrace of Construct (ES's Golem/Doll became VI's Construct family)

/mob/living/carbon/human/species/construct/porcelain
	race = /datum/species/construct/porcelain

/datum/species/construct/porcelain
	name = "Doll"
	id = "doll"
	is_subrace = TRUE
	origin_default = /datum/virtue/origin/otava
	origin = "Otava"
	base_name = "Godtouched"
	sub_name = "Porcelain Doll"
	desc_title = "Porcelain Doll"
	desc = "<b>Porcelain Doll</b><br>\
	The pinnacle of both art and craftsmanship, originally made to provide companionship for ladies and wealthy women \
	alike. Created to be simply toys or novelty decorations for the wealthy, they do not sleep, eat or bleed. However, \
	due to the dark magic and heretical connotation that they share with the Constructs of Giza, they were made to be incredibly \
	brittle as to promote their subservience and remove any chance these somber creations have of harming their masters. \
	Over time, they were seen to prove as valuable asset and advisory role due to their intellectual prowess, it is \
	unknown what provided them with such a gift. A master wanting more engaging conversation? A lord wanting a more \
	efficient clerk? Regardless, who knows what thoughts their eyes of glass truly conceal?<br> \
	Capable of installing skill exhibitors in themselves or other Constructs."
	skin_tone_wording = "Material"
	use_skin_tone_wording_for_examine = FALSE
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE,OLDGREY,NOBLOOD)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = TRUE
	possible_ages = ALL_AGES_LIST
	skinned_type = /obj/item/ingot/steel
	disliked_food = NONE
	liked_food = NONE
	inherent_traits = list(TRAIT_IRONMAN, TRAIT_NOHUNGER, TRAIT_BLOODLOSS_IMMUNE, TRAIT_NOBREATH, TRAIT_NOSLEEP, TRAIT_CRITICAL_WEAKNESS,
		TRAIT_BEAUTIFUL, TRAIT_EASYDISMEMBER, TRAIT_LIMBATTACHMENT, TRAIT_NOMETABOLISM, TRAIT_NOPAIN, TRAIT_ZOMBIE_IMMUNE)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mcom.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fcom.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female
	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,-1), \
		)
	race_bonus = list(STAT_INTELLIGENCE = 2, STAT_SPEED = 1, STAT_STRENGTH = -2)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain/construct,
		ORGAN_SLOT_HEART = /obj/item/organ/heart/construct,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs/construct,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/construct,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/construct,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver/construct,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach/construct,
		)
	stress_examine = TRUE
	stress_desc = span_red("Soulless mannequin.")
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/bodypart_feature/legwear,
		/datum/customizer/organ/horns/demihuman,
		/datum/customizer/organ/horns/tusks,
		/datum/customizer/organ/tail/dullahan,
		/datum/customizer/organ/ears/dullahan,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/vagina/human_anthro,
		/datum/customizer/organ/testicles/anthro,
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/cheek_grease,
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
		/datum/body_marking/nose,
		/datum/body_marking/bangs,
		/datum/body_marking/bun,
	)

/datum/species/construct/porcelain/check_roundstart_eligible()
	return TRUE

/datum/species/construct/porcelain/get_skin_list()
	return list(
		"Porcelain" = "FFF5EE",
		"Sienna" = "E8C4A2",
		"Lotus" = "F1D9E0",
		"Emerald Summit" = "C9E4CA",
		"Walnut" = "8B5E3C",
		"Gloom" = "6E6E6E",
		"Ebon" = "1C1C1C",
	)

/datum/species/construct/porcelain/get_skin_list_tooltip()
	var/list/colors = get_skin_list()
	var/list/tooltips = list()
	for(var/name in colors)
		tooltips["[name] <span style='border: 1px solid #161616; background-color: #[colors[name]];'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>"] = colors[name]
	return tooltips

/datum/species/construct/porcelain/get_hairc_list()
	return sortList(list(

	"black - midnight" = "1d1b2b",

	"red - blood" = "822b2b"

	))

//construct skill upgrade item so they can gain skills beyond their original design
/obj/item/golem_skill_core
	icon = 'modular/emerald_summit/icons/golem_misc.dmi'
	name = "construct skill exhibitor"
	desc = "A series of gears joined around a copper rod. When inserted into a Construct's head, it will allow them to grow their skills beyond their original design."
	icon_state = "golem_upgrade"
	w_class = WEIGHT_CLASS_SMALL
	smeltresult = /obj/item/ingot/bronze
	var/self_usable = FALSE //allow constructs to use it on themselves without skill reqs, exclusively used for the black market ver
	var/in_use = FALSE //to avoid situations where the dialog box is open but you click the construct again with it

/obj/item/golem_skill_core/blackmarket
	name = "modified construct skill exhibitor"
	desc = "A series of gears joined around a copper rod. When inserted into a Construct's head, it will allow them to grow their skills beyond their original design. This one looks like it was purposefully altered to allow Constructs to use it themselves."
	self_usable = TRUE

// obtainable sources, ported from ES: engineer anvil recipe + merchant/blackmarket supply packs (ES had these, VI never ported them, leaving Constructs with no way to acquire the item at all)
/datum/anvil_recipe/engineering/golem_skill_core
	name = "Construct Skill Exhibitor"
	created_item = /obj/item/golem_skill_core
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/roguegear, /obj/item/roguegear)
	craftdiff = 3

/datum/supply_pack/rogue/tools/golem_upgrades
	name = "Construct Skill Exhibitor"
	cost = 35
	contains = list(/obj/item/golem_skill_core)

/datum/supply_pack/rogue/blackmarket_tools/golem_skillcore
	name = "Construct Skill Exhibitor (Self-Service)"
	cost = 50
	contains = list(/obj/item/golem_skill_core/blackmarket)

/obj/item/golem_skill_core/examine(mob/user)
	. = ..()
	if(in_use)
		. += span_warning("It's spinning and whirring.")

/obj/item/golem_skill_core/attack(mob/living/T, mob/U)
	if(!ishuman(U))
		return
	var/mob/living/user = U
	if(!ishuman(T))
		to_chat(user, span_warning("[T] is not a Construct. It will have no effect."))
		return

	var/mob/living/carbon/human/M = T
	if(!HAS_TRAIT(M, TRAIT_IRONMAN))
		if(user == M)
			to_chat(user, span_warning("I am not a Construct. It will have no effect."))//Constructs can't upgrade themselves anyway, but I think it's at least somewhat useful to say something when an organic tries to use it on themselves
		else
			to_chat(user, span_warning("[M] is not a Construct. It will have no effect."))
		return
	if(HAS_TRAIT(user, TRAIT_IRONMAN) && !self_usable)
		if(!isdoll(user))//dolls can install skill exhibitors in themselves or in other constructs
			to_chat(user, span_warning("I am unable to modify Constructs. I must ask another."))//Constructs NEED to ask organics to modify them.
			return
	if(user.get_skill_level(/datum/skill/craft/engineering) < SKILL_LEVEL_APPRENTICE && !self_usable) //need to be at least level 2 skill level in engineering to use this
		to_chat(user, span_warning("I fiddle around trying to properly insert [src] into [M], but I'm not skilled enough."))
		return
	if(in_use)
		to_chat(user, span_warning("I can't- [src] is still working."))
		return

	var/list/learnable_skills = list()
	var/list/skill_datums = list()
	if(M.mind)
		for(var/skill_type in SSskills.all_skills)
			var/datum/skill/skill = GetSkillRef(skill_type)
			if(skill in M.skills?.known_skills)
				if(M?.mind?.sleep_adv.enough_sleep_xp_to_advance(skill_type, 1))
					LAZYADD(learnable_skills, skill)//we need the actual names of the skill_types so the dialog boxes say "Skill" rather than the type path
					LAZYADD(skill_datums,skill_type)//hold the skill datums so we can reference them later to use in our leveling up procs

	if(!length(learnable_skills))//don't waste the core if we can't use it
		to_chat(user, span_warning("[M] has no new skills to develop."))
		return

	in_use = TRUE
	smeltresult = null //edge case where you'd fully activate it and then smelt it before the construct selects their skill to level, I like denying the smelt more than denying the skill up
	var/time_to_upgrade = 130
	time_to_upgrade -= (user.get_skill_level(/datum/skill/craft/engineering) * 10)//starts at 10 seconds normally, reduced by 1 second per each engineering skill level above 3

	user.visible_message(span_notice("[user] presses [src] against [M]'s head."), span_notice("I begin to insert [src] into [M]'s head."))
	if(!do_mob(user, M, time_to_upgrade))
		disable()
		return

	var/skill_choice = input(M, "Improve yourself.","Skills") as null|anything in learnable_skills
	if(skill_choice)
		for(var/real_skill in skill_datums)//really ugly but I can't think of a way to implement this to show the skill names properly in the dialog box. real_skill is the actual datum for the skill rather than the "Skill" string
			if(skill_choice == GetSkillRef(real_skill))
				if(!M?.mind?.sleep_adv.enough_sleep_xp_to_advance(real_skill, 1))//this should only ever happen if you try and install two knowledge cores at the same time for the same skill, which we don't want to happen
					user.visible_message(span_notice("[src] fizzles in [user]'s hand."), span_notice("[src] fizzles and returns to a resting state."))
					disable()
					return
				M.mind.sleep_adv.adjust_sleep_xp(real_skill, -M.mind.sleep_adv.get_requried_sleep_xp_for_skill(real_skill, 1))
				M.adjust_skillrank(real_skill, 1, FALSE)
				M.visible_message(span_notice("[M] absorbs [src]."), span_notice("I absorb [src] into myself, becoming more skilled."))
				if(M.get_skill_level(real_skill) >= 4)//if our skill is now expert or more, gain a triumph
					to_chat(M, span_boldgreen("Gaining such exquisite expertise in [lowertext(skill_choice)] is a true TRIUMPH."))
					M.adjust_triumphs(1)
				M.allmig_reward++//we also need to do this for RCP and endround triumphs- it's the closest thing Constructs have to sleeping.
				add_sleep_experience(user, /datum/skill/craft/engineering, user.STAINT)//give some engi exp for the installer as a reward since it's a skill check
				qdel(src)
				return
	else //if you click "cancel" in the dialog
		user.visible_message(span_notice("[src] deactivates in [user]'s hand."), span_notice("[src] turns off. Perhaps [M] does not yet wish to improve?"))
		disable()
		return

/obj/item/golem_skill_core/proc/disable() //reset it to inactive mode to be paired later on
	in_use = FALSE
	smeltresult = /obj/item/ingot/bronze
	return
