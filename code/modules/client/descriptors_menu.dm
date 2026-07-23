/// TGUI Descriptors Menu. - replaces the legacy "Describe myself" browser window.
/// Mutations reuse handle_descriptors_topic() so behavior matches the legacy menu.
/datum/descriptors_menu
	var/datum/preferences/prefs

/datum/descriptors_menu/New(datum/preferences/prefs)
	src.prefs = prefs

/datum/descriptors_menu/Destroy()
	prefs = null
	return ..()

/datum/descriptors_menu/ui_state(mob/user)
	return GLOB.always_state

/datum/descriptors_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CharacterDescriptors")
		ui.open()

/datum/descriptors_menu/ui_close(mob/user)
	. = ..()
	qdel(src)

/datum/descriptors_menu/ui_data(mob/user)
	var/list/data = list()
	var/list/choices = list()
	for(var/choice_type in prefs.pref_species.descriptor_choices)
		var/datum/descriptor_choice/choice = DESCRIPTOR_CHOICE(choice_type)
		var/datum/descriptor_entry/entry = prefs.get_descriptor_entry_for_choice(choice_type)
		if(!choice || !entry)
			continue
		var/datum/mob_descriptor/descriptor = MOB_DESCRIPTOR(entry.descriptor_type)
		choices += list(list(
			"name" = choice.name,
			"type" = "[choice_type]",
			"current" = descriptor.name,
		))
	data["choices"] = choices

	var/static/list/full_translation = CUSTOM_PREFIX_TRANSLATION_LIST
	var/static/list/article_translation = CUSTOM_ARTICLE_TRANSLATION_LIST
	var/static/list/custom_descriptor_types = CUSTOM_DESCRIPTOR_TYPE_LIST
	var/static/list/prefix_support = CUSTOM_DESCRIPTOR_SHOWS_PREFIX
	var/static/list/article_only_types = CUSTOM_DESCRIPTOR_ARTICLE_ONLY
	var/list/customs = list()
	for(var/i in 1 to CUSTOM_DESCRIPTOR_AMOUNT)
		if(!prefs.has_descriptor_type_in_entries(custom_descriptor_types[i]))
			continue
		var/datum/custom_descriptor_entry/custom_entry = prefs.custom_descriptors[i]
		var/datum/mob_descriptor/descriptor = MOB_DESCRIPTOR(custom_descriptor_types[i])
		var/desc_type = custom_descriptor_types[i]
		var/list/entry_data = list(
			"index" = i,
			"name" = descriptor.name,
			"content" = custom_entry.content_text,
			"has_prefix" = FALSE,
			"prefix" = null,
		)
		if(desc_type in prefix_support)
			var/is_article_only = (desc_type in article_only_types)
			var/list/translation = is_article_only ? article_translation : full_translation
			var/prefix_display = translation["[custom_entry.prefix_type]"]
			if(!prefix_display)
				prefix_display = is_article_only ? "a" : "Has a"
			entry_data["has_prefix"] = TRUE
			entry_data["prefix"] = prefix_display
		customs += list(entry_data)
	data["customs"] = customs
	return data

/datum/descriptors_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	var/mob/user = usr
	if(!user?.client || !prefs)
		return
	switch(action)
		if("choose")
			prefs.handle_descriptors_topic(user, list("preference" = "choose_descriptor", "descriptor_choice" = "[params["type"]]"))
			return TRUE
		if("prefix")
			prefs.handle_descriptors_topic(user, list("preference" = "custom_descriptor_prefix", "index" = "[params["index"]]"))
			return TRUE
		if("content")
			prefs.handle_descriptors_topic(user, list("preference" = "custom_descriptor_content", "index" = "[params["index"]]"))
			return TRUE
		if("print")
			prefs.handle_descriptors_topic(user, list("preference" = "print_descriptor_setup"))
			return TRUE
