/// tgui replacements for the legacy lobby browser windows (Lore Primer, Crew Manifest).

GLOBAL_DATUM_INIT(lore_primer, /datum/lore_primer, new)

/datum/lore_primer/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "LorePrimer")
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/lore_primer/ui_state(mob/user)
	return GLOB.tgui_always_state

/datum/lore_primer/ui_static_data(mob/user)
	var/list/data = list()
	data["primer_html"] = jointext(GLOB.roleplay_readme, "\n")
	var/list/regions = list()
	for(var/region_id in GLOB.economic_regions)
		var/datum/economic_region/region = GLOB.economic_regions[region_id]
		if(!region)
			continue
		regions += list(list(
			"name" = region.name,
			"subtitle" = region.subtitle,
			"description" = region.description,
		))
	data["regions"] = regions
	return data

/// TGUI Late Join menu - replaces the legacy "latechoices" browser window.
/datum/late_join_menu
	var/mob/dead/new_player/owner

/datum/late_join_menu/New(mob/dead/new_player/owner)
	src.owner = owner

/datum/late_join_menu/Destroy()
	owner = null
	return ..()

/datum/late_join_menu/ui_state(mob/user)
	return GLOB.always_state

/datum/late_join_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "LateJoin")
		ui.open()

/datum/late_join_menu/ui_close(mob/user)
	. = ..()
	qdel(src)

/proc/latejoin_department_name(department_flag)
	switch(department_flag)
		if(NOBLEMEN)
			return "Ducal Family"
		if(COURTIERS)
			return "Courtiers"
		if(RETINUE)
			return "Retinue"
		if(GARRISON)
			return "Garrison"
		if(CHURCHMEN)
			return "Churchmen"
		if(BURGHERS)
			return "Burghers"
		if(ATC)
			return "Valmorian Trading Company"
		if(PEASANTS)
			return "Peasants"
		if(SIDEFOLK)
			return "Sidefolk"
		if(WANDERERS)
			return "Wanderers"
		if(INQUISITION)
			return "Inquisition"
		if(ANTAGONIST)
			return "Antagonists"
	return "Other"

/datum/late_join_menu/ui_data(mob/user)
	var/list/data = list()
	data["round_duration"] = DisplayTimeText(world.time - SSticker.round_start_time, 1)

	var/list/sieges = list()
	if(has_world_trait(/datum/world_trait/skeleton_siege))
		sieges += list(list("title" = "Siege Skeleton", "label" = "BECOME AN EVIL SKELETON"))
	if(has_world_trait(/datum/world_trait/goblin_siege))
		sieges += list(list("title" = "Goblin", "label" = "BECOME A GOBLIN"))
	data["sieges"] = sieges

	var/client/player = owner?.client
	var/list/omegalist = list()
	omegalist += list(GLOB.noble_positions)
	omegalist += list(GLOB.courtier_positions)
	omegalist += list(GLOB.retinue_positions)
	omegalist += list(GLOB.garrison_positions)
	omegalist += list(GLOB.church_positions)
	omegalist += list(GLOB.burgher_positions)
	omegalist += list(GLOB.atc_positions)
	omegalist += list(GLOB.peasant_positions)
	omegalist += list(GLOB.sidefolk_positions)
	omegalist += list(GLOB.wanderer_positions)
	omegalist += list(GLOB.inquisition_positions)
	omegalist += list(GLOB.antagonist_positions)

	var/list/categories = list()
	for(var/list/category in omegalist)
		var/datum/job/first_job = SSjob.name_occupations[category[1]]
		if(!first_job)
			continue
		var/list/jobs = list()
		for(var/job in category)
			var/datum/job/job_datum = SSjob.name_occupations[job]
			if(!job_datum)
				continue
			var/is_job_available = (owner.IsJobUnavailable(job_datum.title) == JOB_AVAILABLE)
			if(job_datum.always_show_on_latechoices)
				is_job_available = TRUE
			if(!is_job_available)
				continue

			var/used_name = job_datum.display_title || job_datum.title
			if(player?.prefs?.pronouns == SHE_HER && job_datum.f_title)
				used_name = job_datum.f_title

			// Limited subclass slots (the legacy "(!)" popup, now inline).
			var/list/subclass_slots = list()
			if(job_datum.has_limited_subclasses())
				for(var/adv in job_datum.job_subclasses)
					var/datum/advclass/advpath = adv
					var/datum/advclass/subclass = SSrole_class_handler.get_advclass_by_name(initial(advpath.name))
					if(!subclass || subclass.maximum_possible_slots == -1)
						continue
					subclass_slots += list(list(
						"name" = subclass.name,
						"occupied" = subclass.total_slots_occupied,
						"max" = subclass.maximum_possible_slots,
					))

			// Virtue/vice incompatibilities (the legacy "(!!)" popup, now inline).
			var/list/incompatibilities = list()
			if(player?.prefs && length(job_datum.job_subclasses))
				for(var/adv in job_datum.job_subclasses)
					var/datum/advclass/advpath = adv
					var/datum/advclass/subclass = SSrole_class_handler.get_advclass_by_name(initial(advpath.name))
					if(!subclass)
						continue
					var/list/reasons = list()
					for(var/virtuetype in subclass.virtue_limits)
						if(istype(player.prefs.virtue, virtuetype))
							reasons += player.prefs.virtue.name
						if(istype(player.prefs.virtuetwo, virtuetype))
							reasons += player.prefs.virtuetwo.name
					for(var/vicetype in subclass.vice_limits)
						for(var/vice in player.prefs.charflaws)
							var/datum/charflaw/cf = vice
							if(istype(vice, vicetype))
								reasons += cf.name
					if(length(reasons))
						incompatibilities += list(list(
							"subclass" = subclass.name,
							"reasons" = reasons,
						))

			jobs += list(list(
				"title" = job_datum.title,
				"name" = used_name,
				"current" = job_datum.current_positions,
				"total" = job_datum.total_positions,
				"command" = (job in GLOB.leadership_positions),
				"prioritized" = (job_datum in SSjob.prioritized_jobs),
				"subclass_slots" = subclass_slots,
				"incompatibilities" = incompatibilities,
			))
		if(!length(jobs))
			continue
		categories += list(list(
			"name" = latejoin_department_name(first_job.department_flag),
			"color" = first_job.selection_color,
			"jobs" = jobs,
		))
	data["categories"] = categories
	return data

/datum/late_join_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	if(!owner)
		return
	switch(action)
		if("join")
			owner.try_late_join(params["title"])
			return TRUE

GLOBAL_DATUM_INIT(crew_manifest_tgui, /datum/crew_manifest_tgui, new)

/datum/crew_manifest_tgui/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CrewManifest")
		// Matches the legacy window: a snapshot at open time, refreshed on reopen.
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/crew_manifest_tgui/ui_state(mob/user)
	return GLOB.tgui_always_state

/datum/crew_manifest_tgui/ui_data(mob/user)
	return list("manifest" = GLOB.data_core.get_manifest_list())
