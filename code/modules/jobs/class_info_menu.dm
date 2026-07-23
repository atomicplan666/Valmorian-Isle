/// TGUI class info menu - replaces the legacy "classhelp" browser popup that
/// shows a class's subclasses, stats, and traits from the class selection menu.
/datum/class_info_menu
	var/datum/job/job

/datum/class_info_menu/New(datum/job/job)
	src.job = job

/datum/class_info_menu/Destroy()
	job = null
	return ..()

/datum/class_info_menu/ui_state(mob/user)
	return GLOB.always_state

/datum/class_info_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ClassInfo")
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/class_info_menu/ui_close(mob/user)
	. = ..()
	qdel(src)

/datum/class_info_menu/proc/stat_list(list/stats)
	var/list/out = list()
	for(var/stat in stats)
		out += list(list(
			"name" = capitalize(stat),
			"value" = stats[stat],
			"roman" = "\Roman[stats[stat]]",
		))
	return out

/datum/class_info_menu/proc/trait_list(list/traits)
	var/list/out = list()
	for(var/trait in traits)
		out += list(list(
			"name" = "[trait]",
			"desc" = GLOB.roguetraits[trait],
		))
	return out

/datum/class_info_menu/ui_static_data(mob/user)
	var/list/data = list()
	data["title"] = job.title
	data["jester"] = istype(job, /datum/job/roguetown/jester)
	data["class_stats"] = stat_list(job.job_stats)
	data["class_ceilings"] = stat_list(job.stat_ceilings)
	data["class_traits"] = trait_list(job.job_traits)

	var/list/subclasses = list()
	for(var/sclass in job.job_subclasses)
		var/datum/advclass/adv = sclass
		var/datum/advclass/adv_ref = SSrole_class_handler.get_advclass_by_name(initial(adv.name))
		if(!adv_ref)
			continue
		var/list/entry = list(
			"name" = adv_ref.name,
			"tutorial" = adv_ref.tutorial,
			"stats" = stat_list(adv_ref.subclass_stats),
			"ceilings" = stat_list(adv_ref.adv_stat_ceiling),
			"extra_context" = adv_ref.extra_context,
			"age_preview" = istype(adv_ref.age_mod) ? adv_ref.age_mod.get_preview_string() : null,
		)

		// Subclass traits fall back to class traits, mirroring the legacy popup.
		if(length(adv_ref.traits_applied))
			entry["traits"] = trait_list(adv_ref.traits_applied)
			entry["traits_are_class"] = FALSE
		else if(length(job.job_traits))
			entry["traits"] = trait_list(job.job_traits)
			entry["traits_are_class"] = TRUE
		else
			entry["traits"] = list()
			entry["traits_are_class"] = FALSE

		var/list/languages = list()
		for(var/lang_type in adv_ref.subclass_languages)
			var/datum/language/lang = lang_type
			languages += initial(lang.name)
		entry["languages"] = languages

		entry["stashed_items"] = adv_ref.subclass_stashed_items?.Copy() || list()

		var/list/virtues = list()
		for(var/virtue_type in adv_ref.subclass_virtues)
			var/datum/virtue/virtue = virtue_type
			virtues += initial(virtue.name)
		entry["virtues"] = virtues

		var/list/aspects = null
		if(LAZYLEN(adv_ref.subclass_mage_aspects))
			var/list/aspect_cfg = adv_ref.subclass_mage_aspects
			aspects = list(
				"mastery" = !!aspect_cfg["mastery"],
				"major" = aspect_cfg["major"] || 0,
				"minor" = aspect_cfg["minor"] || 0,
				"utilities" = aspect_cfg["utilities"] || 0,
				"innate" = list(),
				"traditions" = list(),
			)
			for(var/aspect_path in aspect_cfg["locked_aspects"])
				var/datum/magic_aspect/aspect = aspect_path
				aspects["innate"] += initial(aspect.name)
			if(islist(aspect_cfg["variants"]))
				var/list/overrides = aspect_cfg["variants"]
				for(var/aspect_path in overrides)
					var/datum/magic_aspect/aspect = aspect_path
					aspects["traditions"] += "[capitalize(overrides[aspect_path])] [initial(aspect.name)]"
		entry["mage_aspects"] = aspects

		// Notable skills: journeyman+ or any combat skill, top 5, mirroring the legacy popup.
		var/list/notable_skills = list()
		for(var/sk in adv_ref.subclass_skills)
			if(adv_ref.subclass_skills[sk] >= SKILL_LEVEL_JOURNEYMAN || ispath(sk, /datum/skill/combat))
				notable_skills[sk] = adv_ref.subclass_skills[sk]
		var/list/skills_out = list()
		if(length(notable_skills))
			notable_skills = sortTim(notable_skills, /proc/cmp_numeric_dsc, TRUE)
			var/max_skills = 5
			for(var/sk in notable_skills)
				if(max_skills <= 0)
					break
				var/datum/skill/skill = sk
				skills_out += list(list(
					"name" = initial(skill.name),
					"level" = SSskills.level_names[notable_skills[sk]],
				))
				max_skills--
		entry["skills"] = skills_out

		subclasses += list(entry)
	data["subclasses"] = subclasses
	return data
