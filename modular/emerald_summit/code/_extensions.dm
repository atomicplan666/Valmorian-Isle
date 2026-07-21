// Emerald Summit port — vars/procs added to existing Valmorian types that ES content relies on

/obj/item
	var/leashable = FALSE

/mob/living/simple_animal
	var/purge_worth = FALSE

/obj/item/clothing
	var/list/prevent_crits

/obj/item/rogueweapon/woodstaff
	var/cast_time_reduction = null

/datum/controller/subsystem/treasury
	var/tax_value = 0.11

//ES compatibility shim: credits the Crown's purse (Valmorian has no flat treasury_value)
/datum/controller/subsystem/treasury/proc/give_money_treasury(amt, source, silent = FALSE)
	if(!amt)
		return
	if(discretionary_fund)
		discretionary_fund.balance += amt

/datum/mind
	var/has_changed_spell = FALSE // If the person has changed their spells for the day
	var/used_spell_points = 0
