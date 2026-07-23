/// TGUI Culinary Preferences menu - replaces the legacy "Culinary Preferences"
/// browser window and its food/drink selection popups.
/datum/culinary_menu
	var/datum/preferences/prefs

/datum/culinary_menu/New(datum/preferences/prefs)
	src.prefs = prefs

/datum/culinary_menu/Destroy()
	prefs = null
	return ..()

/datum/culinary_menu/ui_state(mob/user)
	return GLOB.always_state

/datum/culinary_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CulinaryPreferences")
		ui.open()

/datum/culinary_menu/ui_close(mob/user)
	. = ..()
	qdel(src)

/// The display glass used for a drink of the given quality, mirroring get_cached_drink_flat_icon().
/proc/drink_glass_type_by_quality(drink_quality)
	if(drink_quality <= 0)
		return /obj/item/reagent_containers/glass/cup/wooden
	if(drink_quality <= 1)
		return /obj/item/reagent_containers/glass/cup
	if(drink_quality <= 2)
		return /obj/item/reagent_containers/glass/bottle
	if(drink_quality <= 3)
		return /obj/item/reagent_containers/glass/cup/silver
	return /obj/item/reagent_containers/glass/cup/golden

/datum/culinary_menu/proc/food_entry(food_type)
	if(!ispath(food_type, /obj/item/reagent_containers/food/snacks))
		return null
	var/obj/item/food = food_type
	return list(
		"type" = "[food_type]",
		"name" = capitalize(initial(food.name)),
		"icon" = "[initial(food.icon)]",
		"icon_state" = initial(food.icon_state),
	)

/datum/culinary_menu/proc/drink_entry(drink_type)
	if(!ispath(drink_type, /datum/reagent/consumable))
		return null
	var/datum/reagent/consumable/drink = drink_type
	var/obj/item/glass = drink_glass_type_by_quality(initial(drink.quality))
	return list(
		"type" = "[drink_type]",
		"name" = capitalize(initial(drink.name)),
		"icon" = "[initial(glass.icon)]",
		"icon_state" = initial(glass.icon_state),
	)

/datum/culinary_menu/ui_static_data(mob/user)
	var/list/data = list()
	var/list/foods = list()
	for(var/list/food_data in GLOB.food_with_faretypes)
		var/list/entry = food_entry(food_data["type"])
		if(!entry)
			continue
		entry["quality"] = food_data["faretype"]
		foods += list(entry)
	data["foods"] = foods
	var/list/drinks = list()
	for(var/list/drink_data in GLOB.drink_with_qualities)
		var/list/entry = drink_entry(drink_data["type"])
		if(!entry)
			continue
		entry["quality"] = drink_data["quality"]
		drinks += list(entry)
	data["drinks"] = drinks
	return data

/datum/culinary_menu/ui_data(mob/user)
	return list(
		"favourite_food" = food_entry(prefs.culinary_preferences[CULINARY_FAVOURITE_FOOD]),
		"hated_food" = food_entry(prefs.culinary_preferences[CULINARY_HATED_FOOD]),
		"favourite_drink" = drink_entry(prefs.culinary_preferences[CULINARY_FAVOURITE_DRINK]),
		"hated_drink" = drink_entry(prefs.culinary_preferences[CULINARY_HATED_DRINK]),
	)

/datum/culinary_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	var/mob/user = usr
	if(!user?.client || !prefs)
		return
	switch(action)
		if("set_food")
			var/food_type = text2path(params["type"])
			if(!ispath(food_type, /obj/item/reagent_containers/food/snacks))
				return
			var/preference_type = params["hated"] ? CULINARY_HATED_FOOD : CULINARY_FAVOURITE_FOOD
			var/opposite_preference = (preference_type == CULINARY_FAVOURITE_FOOD) ? CULINARY_HATED_FOOD : CULINARY_FAVOURITE_FOOD
			if(prefs.culinary_preferences[opposite_preference] == food_type)
				to_chat(user, span_warning("You can't set the same item as both favorite and hated!"))
				return TRUE
			prefs.culinary_preferences[preference_type] = food_type
			return TRUE
		if("set_drink")
			var/drink_type = text2path(params["type"])
			if(!ispath(drink_type, /datum/reagent/consumable))
				return
			var/preference_type = params["hated"] ? CULINARY_HATED_DRINK : CULINARY_FAVOURITE_DRINK
			var/opposite_preference = (preference_type == CULINARY_FAVOURITE_DRINK) ? CULINARY_HATED_DRINK : CULINARY_FAVOURITE_DRINK
			if(prefs.culinary_preferences[opposite_preference] == drink_type)
				to_chat(user, span_warning("You can't set the same drink as both favorite and hated!"))
				return TRUE
			prefs.culinary_preferences[preference_type] = drink_type
			return TRUE
