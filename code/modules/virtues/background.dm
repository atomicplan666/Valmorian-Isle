// Backgrounds: virtue-like picks focused on a character's previous life - skills and starting
// equipment, kept in their own free slot alongside (not instead of) the two normal virtue picks.
// Ported from Emerald Summit PR #240 (github.com/Furnace-Chronicles/Emerald-Summit/pull/240),
// 2026-08-21. Most of these already existed in VI as ordinary virtues (crafter.dm's "Skilled
// Apprentice"/"Labourious Apprentice", combat.dm's "Trained & Ready"/bowman/crossbowman,
// utility.dm's granary/performer/tracker/intellectual/prowler's light-steps choice, items.dm's
// arsonist) - those are retired here in favour of this dedicated per-archetype system, with VI's
// own enhancements over the ES originals kept where they existed (see each background's comment).
// Two backgrounds (Tailor, Enchanter) have no ES equivalent - they were choices inside the retired
// Skilled Apprentice virtue and are ported here as their own backgrounds so that content isn't lost.
//
// Not ported: ES's "Portable Smelter" contraption (Blacksmith/Scrapper) and "Scroll of Find
// Familiar" (Rogue Alchemist) - neither the portable-smelter item nor the findfamiliar spell exist
// in VI. A couple of item paths were substituted for VI's closest equivalent (surgery/scalpel/improv
// -> surgery/scalpel, alchemical/endpot -> alchemical/healthpot, the bare armor/leather/jacket ->
// its /artijacket subtype, which is the only one VI actually has).

/datum/virtue/background/none //for having no background
	name = "None"
	desc = "You have aspired to (or been given) little in the way of trade or upbringing."

/datum/virtue/background/artificer
	name = "Artificer's Apprentice"
	desc = "In my youth, I worked under a skilled artificer, studying construction and engineering."
	custom_text = "Tinkerer comes with cogs and bronze ingots. Mason comes with a blowrod and bricks."
	added_traits = list(TRAIT_SMITHING_EXPERT)
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/carpentry, 2, 2),
						list(/datum/skill/craft/masonry, 2, 2),
						list(/datum/skill/craft/engineering, 2, 2),
						list(/datum/skill/craft/smelting, 2, 2),
						list(/datum/skill/craft/ceramics, 2, 2)
	)

/datum/virtue/background/artificer/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Tinkerer", "Mason"))
	switch(equip_choice)
		if("Tinkerer")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/artificertinker)
		if("Mason")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/artificermason)

/datum/virtue/background/blacksmith
	name = "Blacksmith's Apprentice"
	desc = "In my youth, I worked under a skilled blacksmith, honing my skills with an anvil."
	custom_text = "Smith loadout comes with ingots and equipment to start smithing. Scrapper is focused on finding refuse to recycle (& has smithing tools)."
	added_traits = list(TRAIT_SMITHING_EXPERT)
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/weaponsmithing, 2, 2),
						list(/datum/skill/craft/armorsmithing, 2, 2),
						list(/datum/skill/craft/blacksmithing, 2, 2),
						list(/datum/skill/craft/smelting, 2, 2))

/datum/virtue/background/blacksmith/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Smith", "Scrapper"))
	switch(equip_choice)
		if("Smith")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/smithapp)
		if("Scrapper")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/smithscrap)

/datum/virtue/background/tailor
	name = "Tailor's Apprentice"
	desc = "In my youth, I worked under a skilled tailor, learning to cut, stitch and mend."
	custom_text = "Stashed Needle & Scissors."
	added_traits = list(TRAIT_SEWING_EXPERT)
	added_skills = list(list(/datum/skill/labor/butchering, 2, 2),
						list(/datum/skill/craft/sewing, 3, 3),
						list(/datum/skill/craft/tanning, 2, 2))
	added_stashed_items = list(
		"Needle" = /obj/item/needle,
		"Scissors" = /obj/item/rogueweapon/huntingknife/scissors
	)

/datum/virtue/background/enchanter
	name = "Enchanter's Apprentice"
	desc = "In my youth, I worked under a skilled enchanter, learning to bind lux to matter."
	custom_text = "Allows you to do magical rituals. Stashed Chalk, Mortar, and Pestle."
	added_traits = list(TRAIT_ENCHANTING_EXPERT, TRAIT_ALCHEMY_EXPERT, TRAIT_ARCYNE, TRAIT_LEYLINE_ATTUNEMENT)
	added_skills = list(list(/datum/skill/craft/alchemy, 2, 2),
						list(/datum/skill/craft/blacksmithing, 2, 2),
						list(/datum/skill/craft/engineering, 2, 2),
						list(/datum/skill/craft/smelting, 2, 2),
						list(/datum/skill/magic/arcane, 2, 2))
	added_stashed_items = list(
		"Pestle" = /obj/item/pestle,
		"Mortar" = /obj/item/reagent_containers/glass/mortar,
		"Chalk" = /obj/item/chalk
	)

/datum/virtue/background/brawler
	name = "Brawler's Apprentice"
	desc = "I have trained under a skilled brawler, and have some experience fighting with my fists."
	custom_text = "+2 to Unarmed and Wrestling (Max Journeyman), with choice of Katar or Knuckles."

/datum/virtue/background/brawler/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Katar", "Knuckles"))
	switch(equip_choice)
		if("Katar")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/brawlkatar)
			H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, 3)
			H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, 3)
		if("Knuckles")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/brawlknuck)
			H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, 3)
			H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 2, 3)

/datum/virtue/background/granary
	name = "Cunning Provisioner"
	desc = "You've worked in or around the docks enough to steal away a sack of supplies that no one would surely miss, just in case. You've picked up on some cooking and fishing tips in your spare time, as well."
	custom_text = "Both come with a cooling backpack. Chef is equipped with a variety of foods + pan for cooking (and a chef's knife). Fisher has a fishing rod, bait, and supplies for making fishing traps."
	added_traits = list(TRAIT_HOMESTEAD_EXPERT)
	added_skills = list(list(/datum/skill/craft/cooking, 3, 6),
						list(/datum/skill/labor/fishing, 2, 6))

/datum/virtue/background/granary/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Chef", "Fisher"))
	switch(equip_choice)
		if("Chef")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/backpack/rogue/artibackpack/cunningchef)
		if("Fisher")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/backpack/rogue/artibackpack/cunningfish)

/datum/virtue/background/duelist
	name = "Duelist's Apprentice"
	desc = "I have trained under a duelist of considerable skill, and have taken up their arms of choice."
	custom_text = "+2 to Swords or Knives (max Journeyman) depending on equipment choice (Rapier, Arming Sword, or Two Daggers)."

/datum/virtue/background/duelist/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Dueler (Rapier)", "Swordsman (Arming)", "Scoundrel (Twin Daggers)"))
	switch(equip_choice)
		if("Dueler (Rapier)")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/duelistnoble,
					"Rapier" = /obj/item/rogueweapon/sword/rapier
				)
			H.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, 3)
		if("Swordsman (Arming)")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/duelistsword)
			H.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, 3)
		if("Scoundrel (Twin Daggers)")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/duelistscoundrel)
			H.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, 3)

/datum/virtue/background/executioner
	name = "Dungeoneer's Apprentice"
	desc = "I was set to be a dungeoneer some time ago, and I was taught by one. I managed to bring my gear with me."
	custom_text = "+2 to Axes or Whips/Flails (Max Journeyman) depending on equipment choice (Whip or Axe)."

/datum/virtue/background/executioner/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Dungeon Guard", "Executioner"))
	switch(equip_choice)
		if("Dungeon Guard")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/dungeonguard)
			H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 2, 3)
		if("Executioner")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/dungeonexecute,
					"Axe" = /obj/item/rogueweapon/stoneaxe/woodcut
				)
			H.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, 3)

/datum/virtue/background/forester
	name = "Forester"
	desc = "The forest is your home, or at least, it used to be. You always long to return and roam free once again, and you have not forgotten your knowledge on how to be self sufficient."
	custom_text = "Lumberer comes with an axe, fishing rod, and whetstone. Farmer has an assortment of seeds, crops, and a hoe."
	added_skills = list(list(/datum/skill/craft/cooking, 2, 2),
						list(/datum/skill/misc/athletics, 2, 2),
						list(/datum/skill/labor/farming, 2, 2),
						list(/datum/skill/labor/fishing, 2, 2),
						list(/datum/skill/labor/lumberjacking, 2, 2)
	)

/datum/virtue/background/forester/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Lumberer", "Farmer"))
	switch(equip_choice)
		if("Lumberer")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/forestlumber,
					"Axe" = /obj/item/rogueweapon/stoneaxe/woodcut
				)
		if("Farmer")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/forestfarm,
					"Hoe" = /obj/item/rogueweapon/hoe
				)

/datum/virtue/background/hunter
	name = "Hunter's Apprentice"
	desc = "In my youth, I trained under a skilled hunter, learning how to butcher animals and work with leather/hide."
	custom_text = "Trapper comes with bait and ingredients for a mantrap. Tanner comes with bait and fat."
	added_traits = list(TRAIT_SURVIVAL_EXPERT, TRAIT_MASTERFUL_HUNTER)
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/traps, 2, 2),
						list(/datum/skill/labor/butchering, 2, 2),
						list(/datum/skill/craft/sewing, 2, 2),
						list(/datum/skill/craft/tanning, 2, 2),
						list(/datum/skill/misc/tracking, 2, 2),
						list(/datum/skill/misc/hunting, 2, 2)
	)

/datum/virtue/background/hunter/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Trapper", "Tanner"))
	switch(equip_choice)
		if("Trapper")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/huntertrap)
			H.adjust_skillrank_up_to(/datum/skill/craft/traps, 3, 3)
		if("Tanner")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/huntertan)

//VALMORIAN: kept VI's richer version (up to 6 languages, own item stash) instead of ES's simpler
//3-language pick; added ES's +1 INT since VI's didn't have it.
/datum/virtue/background/linguist
	name = "Intellectual"
	desc = "I've spent my life surrounded by various books or sophisticated foreigners, be it through travel or other fortunes beset on my life. I've picked up several tongues and wits, and keep a journal closeby. I can tell people's exact prowess."
	custom_text = "Maximizes Assess benefits with a bonus of the target's Stats. Allows the choice of up to 6 languages to learn. +1 INT."
	added_traits = list(TRAIT_INTELLECTUAL)
	added_skills = list(list(/datum/skill/misc/reading, 3, 6))
	added_stashed_items = list(
		"Quill" = /obj/item/natural/feather,
		"Scroll #1" = /obj/item/paper/scroll,
		"Scroll #2" = /obj/item/paper/scroll,
		"Book Crafting Kit" = /obj/item/book_crafting_kit,
		"Unfinished Skillbook" = /obj/item/skillbook/unfinished
	)
	max_choices = 6
	choice_costs = list(0, 0, 0, 2, 3, 4)
	extra_choices = list(
		"Elvish" = /datum/language/elvish,
		"Dwarvish" = /datum/language/dwarvish,
		"Orcish" = /datum/language/orcish,
		"Infernal" = /datum/language/hellspeak,
		"Draconic" = /datum/language/draconic,
		"Celestial" = /datum/language/celestial,
		"Ranesheni" = /datum/language/raneshi,
		"Grenzelhoftian" = /datum/language/grenzelhoftian,
		"Kazengunese" = /datum/language/kazengunese,
		"Lingyuese" = /datum/language/lingyuese,
		"Undercommon" = /datum/language/undercommon,
		"Otavan" = /datum/language/otavan,
		"Etruscan" = /datum/language/etruscan,
		"Gronnic" = /datum/language/gronnic,
		"Aavnic" = /datum/language/aavnic
	)

/datum/virtue/background/linguist/apply_to_human(mob/living/carbon/human/recipient)
	recipient.change_stat("intelligence", 1)
	addtimer(CALLBACK(src, PROC_REF(linguist_apply), recipient), 5 SECONDS)

/datum/virtue/background/linguist/proc/linguist_apply(mob/living/carbon/human/recipient)
	if(check_triumphs(recipient))
		for(var/lang in picked_choices)
			recipient.grant_language(extra_choices[lang])

/datum/virtue/background/light_steps
	name = "Light Steps"
	desc = "Years of skulking about have left my steps quiet, and my hunched gait quicker."
	added_traits = list(TRAIT_LIGHT_STEP)
	added_skills = list(list(/datum/skill/misc/sneaking, 3, 6))

/datum/virtue/background/light_steps/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Skulker", "Larcenous"))
	switch(equip_choice)
		if("Skulker")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/lightstep)
			H.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 1, 3)
			H.adjust_skillrank_up_to(/datum/skill/misc/stealing, 1, 3)
			H.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, 4)
		if("Larcenous")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/larcscoundrel)
			H.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, 3, 4)
			H.adjust_skillrank_up_to(/datum/skill/misc/stealing, 3, 4)
			H.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 1, 3)

/datum/virtue/background/militia
	name = "Militiaman"
	desc = "I have trained with the local garrison in case I'm ever to be levied to fight for my lord. My gear is stashed away, in case I am ever levied."
	custom_text = "+2 to Maces, Polearms, & Slings (Max Journeyman) depending on equipment choice (Cudgel, Quarterstaff, Spear+Sling)."

/datum/virtue/background/militia/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my precious things.", list("Guard (Cudgel, Buckler)", "Watchman (Quarterstaff)", "Conscript (Spear, Sling)"))
	switch(equip_choice)
		if("Guard (Cudgel, Buckler)")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/militiaguard,
					"Cudgel" = /obj/item/rogueweapon/mace/cudgel,
					"Buckler" = /obj/item/rogueweapon/shield/buckler,
				)
			H.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, 3)
		if("Watchman (Quarterstaff)")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/militiawatch,
					"Quarterstaff" = /obj/item/rogueweapon/woodstaff/quarterstaff/steel
				)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, 3)
		if("Conscript (Spear, Sling)")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/militiaconscript,
					"Militia Spear" = /obj/item/rogueweapon/spear,
				)
			H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, 3)
			H.adjust_skillrank_up_to(/datum/skill/combat/slings, 2, 3)

/datum/virtue/background/mining
	name = "Miner's Apprentice"
	desc = "The dark shafts, the damp smells of ichor and the laboring hours are no stranger to me. I keep my pickaxe and lamptern close, and have been taught how to mine well."
	added_skills = list(list(/datum/skill/labor/mining, 3, 6))

/datum/virtue/background/mining/apply_to_human(mob/living/carbon/human/H)
	if(H.mind)
		H.mind.special_items = list("Mining Backpack" = /obj/item/storage/backpack/rogue/backpack/minerbag)

//VALMORIAN: kept VI's richer version (max 3 instruments, paid stacking) instead of ES's single free pick.
/datum/virtue/background/performer
	name = "Performer"
	desc = "Music, artistry and the act of showmanship carried me through life. I've hidden a favorite instrument of mine, know how to please anyone I touch, and how to crack the eggs of hecklers."
	custom_text = "Comes with a stashed instrument of your choice. You choose the instrument after spawning in."
	added_traits = list(TRAIT_NUTCRACKER, TRAIT_GOODLOVER)
	added_skills = list(list(/datum/skill/misc/music, 4, 4))
	max_choices = 3
	choice_costs = list(0, 2, 2)
	extra_choices = list(
		"Guitar" = /obj/item/rogue/instrument/guitar,
		"Lute" = /obj/item/rogue/instrument/lute,
		"Hurdy Gurdy" = /obj/item/rogue/instrument/hurdygurdy,
		"Harp" = /obj/item/rogue/instrument/harp,
		"Flute" = /obj/item/rogue/instrument/flute,
		"Accordion" = /obj/item/rogue/instrument/accord,
		"Shamisen" = /obj/item/rogue/instrument/shamisen,
		"Drum" = /obj/item/rogue/instrument/drum,
		"Viola" = /obj/item/rogue/instrument/viola,
		"Vocal Talisman" = /obj/item/rogue/instrument/vocals,
		"Psyaltery" = /obj/item/rogue/instrument/psyaltery
	)

/datum/virtue/background/performer/apply_to_human(mob/living/carbon/human/recipient)
	if(check_triumphs(recipient))
		for(var/choice in picked_choices)
			if(ispath(extra_choices[choice], /obj/item))
				recipient.mind?.special_items[choice] = extra_choices[choice]

//VALMORIAN: kept VI's extra grants from the old Skilled Apprentice choice (expert traits + the
//secular diagnose spell) on top of ES's equipment-choice structure.
/datum/virtue/background/physician
	name = "Physician's Apprentice"
	desc = "In my youth, I worked under a skilled physician, studying medicine and alchemy."
	custom_text = "Alchemist comes with a bedroll, healing vials, and basic medical supplies. Surgeon is equipped with improvised surgical tools, a bedroll, and a needle."
	added_traits = list(TRAIT_MEDICINE_EXPERT, TRAIT_ALCHEMY_EXPERT)
	added_skills = list(list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/alchemy, 2, 2),
						list(/datum/skill/misc/medicine, 2, 2)
	)

/datum/virtue/background/physician/apply_to_human(mob/living/carbon/human/H)
	if(!H.mind?.has_spell(/obj/effect/proc_holder/spell/invoked/diagnose/secular))
		H.mind?.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Alchemist", "Surgeon"))
	switch(equip_choice)
		if("Alchemist")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/physalc)
		if("Surgeon")
			if(H.mind)
				H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/physurg)

//VALMORIAN: kept VI's richer version of the old items/arsonist virtue (traps skill, explosive supply
//trait, flint) instead of building ES's simpler roguealchemist fresh.
/datum/virtue/background/roguealchemist
	name = "Rogue Alchemist"
	desc = "I like to watch the world burn, and I've stowed away bombs and materials to help me achieve that fact. Every day I can take one bomb from any HERMES."
	custom_text = "Guaranteed Journeyman for Trapmaking. Firebombs & bomb materials."
	added_skills = list(list(/datum/skill/craft/alchemy, 2, 4), list(/datum/skill/craft/traps, 3, 3))
	added_traits = list(TRAIT_ALCHEMY_EXPERT, TRAIT_EXPLOSIVE_SUPPLY)

/datum/virtue/background/roguealchemist/apply_to_human(mob/living/carbon/human/H)
	if(H.mind)
		H.mind.special_items = list("Equipment Bag" = /obj/item/storage/roguebag/arsonbomb)

/datum/virtue/background/sailor
	name = "Sailor"
	desc = "You spent your daes on the sea, learning to brace ships against storms and swim against Abyssor's tides."
	custom_text = "Comes with carpentry tools, fishing rod + bait, and an axe."
	added_skills = list(list(/datum/skill/misc/swimming, 2, 3),
						list(/datum/skill/misc/athletics, 2, 3),
						list(/datum/skill/craft/crafting, 2, 2),
						list(/datum/skill/craft/carpentry, 2, 2),
						list(/datum/skill/labor/fishing, 2, 6))

/datum/virtue/background/sailor/apply_to_human(mob/living/carbon/human/H)
	if(H.mind)
		H.mind.special_items = list(
			"Equipment Bag" = /obj/item/storage/roguebag/sailfix,
			"Axe" = /obj/item/rogueweapon/stoneaxe/woodcut
		)

//VALMORIAN: kept VI's version of the old utility/tracker virtue, adding ES's net + rope stash.
/datum/virtue/background/tracker
	name = "Sleuth"
	desc = "You realised long ago that the ability to find a man is as helpful to aid the law as it is to evade it."
	added_skills = list(list(/datum/skill/misc/tracking, 3, 6))
	added_traits = list(TRAIT_SLEUTH)
	custom_text = "- Upon right clicking a track, you will Mark the person who made them <i>(Expert skill required, not exclusive to this Background)</i>.\n- Further tracks found will be automatically highlighted as theirs, along with the person themselves, if they are not sneaking or invisible at the time.\n- Reduces the cooldown for tracking, allows track examining right away, and movement no longer cancels tracking. Comes with a net and rope."
	added_stashed_items = list("Equipment Bag" = /obj/item/storage/roguebag/sleuth)

//VALMORIAN: merges the old separate combat/bowman + combat/crossbowman virtues into one
//equipment-choice background, matching ES's Toxophilite.
/datum/virtue/background/bowman
	name = "Toxophilite"
	desc = "I've had an interest in archery from a young age, and I always keep a spare bow and quiver around."
	custom_text = "+2 to Bows or Crossbows (Max Journeyman), depending on equipment choice (Recurve Bow or Crossbow)."

/datum/virtue/background/bowman/apply_to_human(mob/living/carbon/human/H)
	var/equip_choice = tgui_input_list(H, "My lyfe before, STASHed away ...", "TREES and STATUES hold my things.", list("Archer", "Crossbowman"))
	switch(equip_choice)
		if("Archer")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/toxarcher,
					"Recurve Bow" = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve,
					"Quiver" = /obj/item/quiver/arrows
				)
			H.adjust_skillrank_up_to(/datum/skill/combat/bows, 2, 3)
		if("Crossbowman")
			if(H.mind)
				H.mind.special_items = list(
					"Equipment Bag" = /obj/item/storage/roguebag/toxcross,
					"Crossbow" = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow,
					"Quiver" = /obj/item/quiver/bolts
				)
			H.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, 3)


// ALL OBJ HERE!

//Rogue Alchemist
/obj/item/storage/roguebag/arsonbomb
	populate_contents = list(
		/obj/item/bomb,
		/obj/item/bomb,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/ash,
		/obj/item/ash,
		/obj/item/ash,
		/obj/item/ash,
		/obj/item/rogueore/coal,
		/obj/item/rogueore/coal,
		/obj/item/natural/cloth,
		/obj/item/natural/cloth,
		/obj/item/flint
	)

//Artificer
/obj/item/storage/roguebag/artificertinker
	populate_contents = list(
		/obj/item/contraption,
		/obj/item/contraption,
		/obj/item/contraption,
		/obj/item/ingot/bronze,
		/obj/item/ingot/bronze,
		/obj/item/ingot/bronze,
		/obj/item/natural/bundle/stick,
		/obj/item/natural/bundle/stick,
		/obj/item/natural/bundle/stick,
		/obj/item/natural/bundle/stick
	)

/obj/item/storage/roguebag/artificermason
	populate_contents = list(
		/obj/item/rogueweapon/blowrod,
		/obj/item/natural/bundle/brick,
		/obj/item/natural/bundle/brick,
		/obj/item/natural/bundle/brick,
		/obj/item/natural/bundle/brick,
		/obj/item/natural/bundle/brick,
		/obj/item/natural/bundle/brick,
		/obj/item/natural/bundle/brick
	)

//Blacksmith
/obj/item/storage/roguebag/smithapp
	populate_contents = list(
		/obj/item/rogueweapon/tongs,
		/obj/item/rogueweapon/hammer/iron,
		/obj/item/ingot/iron,
		/obj/item/ingot/iron,
		/obj/item/ingot/iron,
		/obj/item/ingot/steel,
		/obj/item/ingot/steel,
		/obj/item/rogueore/coal,
		/obj/item/rogueore/coal,
		/obj/item/rogueore/coal,
		/obj/item/rogueore/coal
	)

/obj/item/storage/roguebag/smithscrap
	populate_contents = list(
		/obj/item/rogueweapon/tongs,
		/obj/item/rogueweapon/hammer/iron,
		/obj/item/ingot/iron,
		/obj/item/rogueore/coal,
		/obj/item/rogueore/coal,
		/obj/item/rogueore/coal,
		/obj/item/rogueore/coal,
		/obj/item/rogueore/coal
	)

//Brawler
/obj/item/storage/roguebag/brawlkatar
	populate_contents = list(
		/obj/item/clothing/wrists/roguetown/bracers/leather,
		/obj/item/rogueweapon/katar,
		/obj/item/needle/thorn
	)

/obj/item/storage/roguebag/brawlknuck
	populate_contents = list(
		/obj/item/clothing/wrists/roguetown/bracers/leather,
		/obj/item/rogueweapon/knuckles,
		/obj/item/needle/thorn
	)

//Cunning Provisioner
/obj/item/storage/backpack/rogue/artibackpack/cunningchef
	populate_contents = list(
		/obj/item/reagent_containers/food/snacks/rogue/dough,
		/obj/item/reagent_containers/food/snacks/rogue/dough,
		/obj/item/reagent_containers/food/snacks/rogue/dough,
		/obj/item/reagent_containers/food/snacks/butter,
		/obj/item/rogueweapon/huntingknife/chefknife,
		/obj/item/reagent_containers/food/snacks/egg,
		/obj/item/cooking/pan,
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak,
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak,
		/obj/item/reagent_containers/food/snacks/rogue/meat/steak,
		/obj/item/reagent_containers/food/snacks/rogue/cheese
	)

/obj/item/storage/backpack/rogue/artibackpack/cunningfish
	populate_contents = list(
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/grown/log/tree/small,
		/obj/item/grown/log/tree/small,
		/obj/item/natural/bundle/stick,
		/obj/item/natural/bundle/stick,
		/obj/item/fishingrod
	)

//Duelist
/obj/item/storage/roguebag/duelistnoble
	populate_contents = list(
		/obj/item/clothing/ring/duelist,
		/obj/item/clothing/ring/duelist,
		/obj/item/rogueweapon/huntingknife/idagger/steel/parrying,
		/obj/item/clothing/head/roguetown/duelhat,
		/obj/item/clothing/suit/roguetown/armor/gambeson/light
	)

/obj/item/storage/roguebag/duelistsword
	populate_contents = list(
		/obj/item/clothing/suit/roguetown/armor/gambeson/lord,
		/obj/item/rogueweapon/sword/iron,
		/obj/item/natural/bundle/cloth,
		/obj/item/natural/bundle/cloth,
		/obj/item/rogueweapon/surgery/hammer,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot,
		/obj/item/alch/urtica,
		/obj/item/alch/valeriana,
		/obj/item/alch/urtica,
		/obj/item/alch/valeriana
	)

/obj/item/storage/roguebag/duelistscoundrel
	populate_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel,
		/obj/item/rogueweapon/huntingknife/idagger/steel,
		/obj/item/clothing/under/roguetown/trou/leather,
		/obj/item/clothing/suit/roguetown/armor/leather/jacket/artijacket
	)

//Dungeoneer
/obj/item/storage/roguebag/dungeonguard
	populate_contents = list(
		/obj/item/clothing/suit/roguetown/armor/leather,
		/obj/item/clothing/under/roguetown/trou/leather,
		/obj/item/clothing/head/roguetown/helmet/leather,
		/obj/item/rogueweapon/whip,
		/obj/item/rope/chain,
		/obj/item/clothing/head/roguetown/helmet/kettle,
		/obj/item/clothing/suit/roguetown/armor/gambeson/light,
		/obj/item/rope/chain,
		/obj/item/needle/thorn
	)

/obj/item/storage/roguebag/dungeonexecute
	populate_contents = list(
		/obj/item/clothing/suit/roguetown/armor/leather,
		/obj/item/clothing/under/roguetown/trou/leather,
		/obj/item/clothing/head/roguetown/helmet/leather,
		/obj/item/natural/whetstone,
		/obj/item/needle/thorn
	)

//Forester
/obj/item/storage/roguebag/forestlumber
	populate_contents = list(
		/obj/item/natural/whetstone,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/natural/worms,
		/obj/item/fishingrod
	)

/obj/item/storage/roguebag/forestfarm
	populate_contents = list(
		/obj/item/reagent_containers/glass/bucket,
		/obj/item/rogueweapon/huntingknife,
		/obj/item/reagent_containers/food/snacks/grown/wheat,
		/obj/item/reagent_containers/food/snacks/grown/wheat,
		/obj/item/reagent_containers/food/snacks/grown/wheat,
		/obj/item/reagent_containers/food/snacks/grown/wheat,
		/obj/item/reagent_containers/food/snacks/grown/wheat,
		/obj/item/seeds/wheat,
		/obj/item/seeds/wheat,
		/obj/item/seeds/onion,
		/obj/item/seeds/onion,
		/obj/item/seeds/apple,
		/obj/item/seeds/apple,
		/obj/item/millstone
	)

//Hunter
/obj/item/storage/roguebag/huntertrap
	populate_contents = list(
		/obj/item/rogueweapon/huntingknife,
		/obj/item/bait,
		/obj/item/bait/sweet,
		/obj/item/bait/sweet,
		/obj/item/grown/log/tree/small,
		/obj/item/natural/bundle/fibers,
		/obj/item/natural/bundle/fibers,
		/obj/item/ingot/iron
	)

/obj/item/storage/roguebag/huntertan
	populate_contents = list(
		/obj/item/rogueweapon/huntingknife,
		/obj/item/natural/bundle/stick,
		/obj/item/natural/bundle/stick,
		/obj/item/natural/bundle/stick,
		/obj/item/needle/thorn,
		/obj/item/bait,
		/obj/item/bait/sweet,
		/obj/item/bait/sweet,
		/obj/item/reagent_containers/food/snacks/fat,
		/obj/item/reagent_containers/food/snacks/fat,
		/obj/item/reagent_containers/food/snacks/fat,
		/obj/item/cooking/pan/aalloy
	)

//Light Steps
/obj/item/storage/roguebag/lightstep
	populate_contents = list(
		/obj/item/lockpick,
		/obj/item/lockpick,
		/obj/item/lockpick,
		/obj/item/bomb/smoke,
		/obj/item/bomb/smoke,
		/obj/item/bomb/smoke
	)

/obj/item/storage/roguebag/larcscoundrel
	populate_contents = list(
		/obj/item/lockpickring/mundane,
		/obj/item/lockpick,
		/obj/item/lockpick,
		/obj/item/lockpick,
		/obj/item/rogueweapon/huntingknife/idagger
	)

//Militia
/obj/item/storage/roguebag/militiaguard
	populate_contents = list(
		/obj/item/clothing/head/roguetown/helmet/kettle,
		/obj/item/clothing/suit/roguetown/armor/gambeson/light,
		/obj/item/rope/chain,
		/obj/item/needle/thorn
	)

/obj/item/storage/roguebag/militiawatch
	populate_contents = list(
		/obj/item/clothing/head/roguetown/helmet/kettle,
		/obj/item/clothing/suit/roguetown/armor/gambeson/light,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot
	)

/obj/item/storage/roguebag/militiaconscript
	populate_contents = list(
		/obj/item/clothing/head/roguetown/helmet/kettle,
		/obj/item/clothing/suit/roguetown/armor/gambeson/light,
		/obj/item/gun/ballistic/revolver/grenadelauncher/sling,
		/obj/item/quiver/sling
	)

//Miner
/obj/item/storage/backpack/rogue/backpack/minerbag
	populate_contents = list(
		/obj/item/rogueweapon/pick/steel,
		/obj/item/flashlight/flare/torch/lantern
	)

//Physician
/obj/item/storage/roguebag/physurg
	populate_contents = list(
		/obj/item/rogueweapon/surgery/saw/improv,
		/obj/item/rogueweapon/surgery/hemostat/improv,
		/obj/item/rogueweapon/surgery/hemostat/improv,
		/obj/item/rogueweapon/surgery/retractor/improv,
		/obj/item/rogueweapon/surgery/scalpel,
		/obj/item/rogueweapon/surgery/hammer,
		/obj/item/needle,
		/obj/item/bedroll
	)

/obj/item/storage/roguebag/physalc
	populate_contents = list(
		/obj/item/needle,
		/obj/item/natural/bundle/cloth,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot,
		/obj/item/alch/urtica,
		/obj/item/alch/valeriana,
		/obj/item/bedroll
	)

//Sailor
/obj/item/storage/roguebag/sailfix
	populate_contents = list(
		/obj/item/natural/bundle/stick,
		/obj/item/natural/bundle/stick,
		/obj/item/natural/bundle/stick,
		/obj/item/grown/log/tree/small,
		/obj/item/rogueweapon/handsaw,
		/obj/item/rogueweapon/hammer/wood,
		/obj/item/fishingrod
	)

//Sleuth
/obj/item/storage/roguebag/sleuth
	populate_contents = list(
		/obj/item/net,
		/obj/item/rope,
		/obj/item/rope
	)

//Toxophilite
/obj/item/storage/roguebag/toxarcher
	populate_contents = list(
		/obj/item/clothing/head/roguetown/helmet/leather,
		/obj/item/clothing/gloves/roguetown/fingerless_leather,
		/obj/item/clothing/under/roguetown/trou/leather
	)

/obj/item/storage/roguebag/toxcross
	populate_contents = list(
		/obj/item/clothing/head/roguetown/helmet/kettle,
		/obj/item/clothing/suit/roguetown/armor/gambeson/light
	)
