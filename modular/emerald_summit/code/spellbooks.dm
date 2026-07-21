// Emerald Summit port — extracted from modular_azurepeak/code/game/objects/items/spellbooks.dm

/obj/item/book/spellbook
	var/open = FALSE
	icon = 'icons/roguetown/items/books.dmi'
	icon_state = "spellbookbrown_0"
	slot_flags = ITEM_SLOT_HIP
	var/base_icon_state = "spellbookbrown"
	unique = TRUE
	firefuel = 2 MINUTES
	dropshrink = 0.6
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'
	force = 5
	associated_skill = /datum/skill/misc/reading
	name = "\improper tome of the arcyne"
	desc = "A crackling, glowing book, filled with runes and symbols that hurt the mind to stare at."
	var/picked // if the book has had it's style picked or not
	var/born_of_rock = FALSE // was a magical stone used to make it instead of a gem

/obj/item/book/spellbook/getonmobprop(tag)
	. = ..()
	if(tag)
		if(open)
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
		else
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/book/spellbook/examine(mob/user)
	. = ..()
	. += span_notice("Reading it once per day allows you to unbind up to two spells and refund their spell points.")
	if(born_of_rock)
		. += span_notice("This tome was made from a magical stone instead of a proper gem. Holding it in your hand with it open reduces spell casting time by [ROCK_CHARGE_REDUCTION * 100]%")
	else
		. += span_notice("This tome was made from a gem. Holding it in your hand with it open reduces spell casting time by [GEM_CHARGE_REDUCTION * 100]%")

/obj/item/book/spellbook/attack_self(mob/user)
	if(!open)
		attack_right(user)
		return
	..()
	user.update_inv_hands()

/obj/item/book/spellbook/rmb_self(mob/user)
	attack_right(user)
	return

/obj/item/book/spellbook/read(mob/user)
	change_spells()
	return FALSE

/obj/item/book/spellbook/proc/change_spells(mob/user = usr)
	var/datum/mind/user_mind = user.mind
	if(!user_mind) return // How??
	if(user_mind.has_changed_spell)
		to_chat(user, span_warning("I have already unbinded my spells today!"))
		return
	var/list/resettable_spells = list()
	var/list/spell_list = user_mind.spell_list
	for(var/i = 1, i <= spell_list.len, i++)
		var/obj/effect/proc_holder/spell/spell = spell_list[i]
		if(spell.refundable == TRUE)
			if(spell.cost > 0)
				resettable_spells["[spell.name]: [spell.cost]"] = spell_list[i]
	if(!resettable_spells.len)
		to_chat(user, span_warning("I have no spells to unbind!"))
		return
	user_mind.has_changed_spell = TRUE //To pre-empt a halting duplication in the for loop here
	var/unlearn_success = FALSE
	for(var/i = 1, i <= 2, i++)
		var/choice = input(user, "Choose up to two spells to unbind. Cancel both to not use up your daily unbinding.") as null|anything in resettable_spells
		var/obj/effect/proc_holder/spell/item = resettable_spells[choice]
		if(!item)
			break
		if(!resettable_spells.len)
			return
		if(user_mind.RemoveSpell(item))
			user_mind.used_spell_points -= item.cost
			unlearn_success = TRUE
		resettable_spells.Remove(choice)
		user_mind.check_learnspell()
	if(!unlearn_success)
		user_mind.has_changed_spell = FALSE //If we didn't unlearn anything, reset

/obj/item/book/spellbook/proc/get_castred()
	if(born_of_rock)
		return ROCK_CHARGE_REDUCTION
	else
		return GEM_CHARGE_REDUCTION

/obj/item/book/spellbook/attack_right(mob/user)
	if(!picked)
		var/list/designlist = list("green", "yellow", "brown")
		var/mob/living/carbon/human/gamer = user
		if(gamer.get_skill_level(/datum/skill/magic/arcane) >= SKILL_LEVEL_EXPERT)
			designlist = list("green", "yellow", "brown", "steel", "gem", "skin", "mimic", "wyrdbark", "sunfire", "abyssal", "cinder", "vessel", "edgebound", "sovereign")
		var/the_time = world.time
		var/design = tgui_input_list(user, "Select a design.","Spellbook Design", designlist)		
		if(!design)
			return
		if(world.time > (the_time + 30 SECONDS))
			return
		base_icon_state = "spellbook[design]"
		update_icon()
		picked = TRUE
		name = "\improper [design] tome"
		switch(design) //super lazy but idrc
			if("green")
				return
			if("yellow")
				return
			if("brown") //preserve default name and desc for the basic options
				return
			if("steel")
				desc = "A metallic tome adorned with alignments of runes and alchemical symbols. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("gem")
				desc = "The pages form a window to the breadth of the stars. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("skin")
				desc = "Profane symbols adorn this spellbook- is that blood dripping off the pages? Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("mimic")
				desc = "This book seems to be reading you, instead. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("wyrdbark")
				desc = "Formed of heartwood and fae magics, leaves flutter about when it opens. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("sunfire")
				desc = "Astrata's radiance pours freely from this book's enchanted parchment. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("abyssal")
				desc = "Frigid and numb to the touch; you feel so much smaller just looking at it. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("cinder")
				desc = "Wafting smoke and smoldering crackles come from the papyrus, though it never catches alight. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("vessel")
				desc = "A stoppered bottle of ink that forms into a fully-fledged tome when uncorked. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
				name = "\improper arcyne vessel" //calling it 'vessel tome' is weird as fuck
			if("edgebound")
				desc = "Harsh, sturdy, and practical; can a war-mage ask for more? Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
			if("sovereign")
				desc = "Regal and opulent, you feel a stronge urge to call this tome some title of reverence. Can be used to unbind spells, or to assist the caster in arcing some of their projectiles."
		return
	if(!open)
		slot_flags &= ~ITEM_SLOT_HIP
		open = TRUE
		playsound(src, 'sound/items/book_open.ogg', 100, FALSE, -1)
	else
		slot_flags |= ITEM_SLOT_HIP
		open = FALSE
		playsound(src, 'sound/items/book_close.ogg', 100, FALSE, -1)
	curpage = 1
	update_icon()
	user.update_inv_hands()

/obj/item/book/spellbook/update_icon()
	icon_state = "[base_icon_state]_[open]"

