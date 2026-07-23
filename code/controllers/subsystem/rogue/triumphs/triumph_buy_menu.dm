/// TGUI Triumph leaderboard - replaces the legacy "triumph_leaderboard" browser popup.
GLOBAL_DATUM_INIT(triumph_leaderboard_menu, /datum/triumph_leaderboard_menu, new)

/datum/triumph_leaderboard_menu/ui_state(mob/user)
	return GLOB.always_state

/datum/triumph_leaderboard_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "TriumphLeaderboard")
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/triumph_leaderboard_menu/ui_data(mob/user)
	var/list/data = list()
	data["season"] = GLOB.triumph_wipe_season
	var/list/entries = list()
	var/position_number = 0
	for(var/key in SStriumphs.triumph_leaderboard)
		position_number++
		entries += list(list(
			"key" = key,
			"amount" = SStriumphs.triumph_leaderboard[key],
		))
		if(position_number >= SStriumphs.triumph_leaderboard_positions_tracked)
			break
	data["entries"] = entries
	return data

/// TGUI Triumph buy menu - replaces the legacy "triumph_buy_window" browser menu.
/// One datum per client, tracked in SStriumphs.active_triumph_menus.
/datum/triumph_buy_menu
	var/client/linked_client

/datum/triumph_buy_menu/Destroy(force, ...)
	SStgui.close_uis(src)
	linked_client = null
	return ..()

/datum/triumph_buy_menu/proc/triumph_menu_startup_slop()
	if(!linked_client)
		return
	ui_interact(linked_client.mob)

/// Push fresh data to the open menu window (name kept from the legacy HTML menu,
/// still called by SStriumphs.call_menu_refresh()).
/datum/triumph_buy_menu/proc/show_menu()
	SStgui.update_uis(src)

/datum/triumph_buy_menu/ui_state(mob/user)
	return GLOB.always_state

/datum/triumph_buy_menu/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "TriumphBuyMenu")
		ui.open()

/datum/triumph_buy_menu/ui_close(mob/user)
	. = ..()
	SStriumphs.remove_triumph_buy_menu(linked_client)

/datum/triumph_buy_menu/proc/item_state(datum/triumph_buy/item)
	if(SSticker.HasRoundStarted() && item.pre_round_only)
		return "round_started"
	for(var/datum/triumph_buy/conflict_check in SStriumphs.active_triumph_buy_queue)
		if(item.type in conflict_check.conflicts_with)
			return "conflict"
	return "buy"

/datum/triumph_buy_menu/ui_data(mob/user)
	var/list/data = list()
	data["triumphs"] = linked_client ? SStriumphs.get_triumphs(linked_client.ckey) : 0
	var/list/categories = list()
	var/list/items_by_category = list()
	for(var/cat_key in SStriumphs.central_state_data)
		categories += cat_key
		var/list/items = list()
		if(cat_key == TRIUMPH_CAT_ACTIVE_DATUMS)
			for(var/datum/triumph_buy/active in SStriumphs.active_triumph_buy_queue)
				if(!active.visible_on_active_menu)
					continue
				items += list(list(
					"ref" = REF(active),
					"desc" = active.desc,
					"cost" = active.triumph_cost,
					"buyer" = active.key_of_buyer,
					"state" = (SSticker.HasRoundStarted() && active.pre_round_only) ? "round_started" : "unbuy",
				))
		else
			for(var/page in SStriumphs.central_state_data[cat_key])
				for(var/datum/triumph_buy/current_check in SStriumphs.central_state_data[cat_key][page])
					items += list(list(
						"ref" = REF(current_check),
						"desc" = current_check.desc,
						"cost" = current_check.triumph_cost,
						"buyer" = null,
						"state" = item_state(current_check),
					))
		items_by_category[cat_key] = items
	data["categories"] = categories
	data["items"] = items_by_category
	return data

/datum/triumph_buy_menu/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	if(!linked_client)
		return
	switch(action)
		if("buy")
			var/datum/triumph_buy/target_datum = locate(params["ref"])
			if(!istype(target_datum))
				return TRUE
			var/conflicting = FALSE
			for(var/datum/triumph_buy/current_actives in SStriumphs.active_triumph_buy_queue)
				if(target_datum.type in current_actives.conflicts_with)
					conflicting = TRUE
			if(SSticker.HasRoundStarted() && target_datum.pre_round_only)
				conflicting = TRUE
			if(!conflicting)
				if(target_datum in SStriumphs.active_triumph_buy_queue)
					SStriumphs.attempt_to_unbuy_triumph_condition(linked_client, target_datum)
				else
					SStriumphs.attempt_to_buy_triumph_condition(linked_client, target_datum)
			return TRUE
