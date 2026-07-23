/// TGUI Markings menu - replaces the legacy "Markings customization" browser window.
/// Mutations reuse handle_body_markings_topic() so behavior matches the legacy menu.
/datum/markings_menu
	var/datum/preferences/prefs

/datum/markings_menu/New(datum/preferences/prefs)
	src.prefs = prefs

/datum/markings_menu/Destroy()
	prefs = null
	return ..()

/datum/markings_menu/ui_state(mob/user)
	return GLOB.always_state

/datum/markings_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "BodyMarkings")
		ui.open()

/datum/markings_menu/ui_close(mob/user)
	. = ..()
	qdel(src)

/proc/marking_zone_display_name(zone)
	switch(zone)
		if(BODY_ZONE_R_ARM)
			return "Right Arm"
		if(BODY_ZONE_L_ARM)
			return "Left Arm"
		if(BODY_ZONE_HEAD)
			return "Head"
		if(BODY_ZONE_CHEST)
			return "Chest"
		if(BODY_ZONE_R_LEG)
			return "Right Leg"
		if(BODY_ZONE_L_LEG)
			return "Left Leg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "Right Hand"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "Left Hand"
	return zone

/datum/markings_menu/ui_data(mob/user)
	var/list/data = list()
	var/list/zones = list()
	for(var/zone in GLOB.marking_zones)
		var/list/markings = list()
		if(prefs.body_markings[zone])
			for(var/key in prefs.body_markings[zone])
				markings += list(list(
					"name" = key,
					"color" = "#[prefs.body_markings[zone][key]]",
				))
		zones += list(list(
			"zone" = zone,
			"name" = marking_zone_display_name(zone),
			"markings" = markings,
			"can_add" = length(markings) < MAXIMUM_MARKINGS_PER_LIMB,
		))
	data["zones"] = zones
	return data

/datum/markings_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	var/mob/user = usr
	if(!user?.client || !prefs)
		return
	// All actions funnel into the shared legacy topic handler.
	var/static/list/allowed_actions = list(
		"use_preset",
		"reset_all_colors",
		"reset_color",
		"change_color",
		"marking_move_up",
		"marking_move_down",
		"change_marking",
		"remove_marking",
		"add_marking",
	)
	if(!(action in allowed_actions))
		return
	var/list/href_list = list("preference" = action)
	if(params["zone"])
		href_list["key"] = "[params["zone"]]"
	if(params["name"])
		href_list["name"] = "[params["name"]]"
	prefs.handle_body_markings_topic(user, href_list)
	prefs.update_preview_icon()
	return TRUE
