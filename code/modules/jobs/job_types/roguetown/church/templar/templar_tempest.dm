/datum/advclass/templar/tempest
	name = "Tempest"
	tutorial = "You are a templar of the Church, trained in ranged combat to bring a Tempest of holy wrath upon your enemies."
	outfit = /datum/outfit/job/roguetown/templar/tempest
	category_tags = list(CTAG_TEMPLAR)
	cmode_music = 'sound/music/combat_holy.ogg'

	subclass_languages = list(/datum/language/grenzelhoftian)
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_SPD = 3,// +1 spd so they can use their missing DE a little better
		STATKEY_PER = 2,
		STATKEY_END = 1,
	)

	subclass_skills = list(
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/bows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/magic/holy = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/medicine = SKILL_LEVEL_NOVICE,
	)

	subclass_stashed_items = list(
		"The Verses and Acts of the Ten" = /obj/item/book/rogue/bibble,
	)

/datum/outfit/job/roguetown/templar/tempest/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/holysee
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted/holysee
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/holysee
	wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
	gloves = /obj/item/clothing/gloves/roguetown/chain
	belt = /obj/item/storage/belt/rogue/leather/black
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/silver
	backpack_contents = list(
		/obj/item/ritechalk = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/storage/belt/rogue/pouch/coins/mid = 1,
		/obj/item/storage/keyring/acolyte = 1
		)
	H.cmode_music = 'sound/music/cmode/church/combat_reckoning.ogg' // this is probably awful implementation. too bad!
	switch(H.patron?.type)
		if(/datum/patron/divine/undivided)
			wrists = /obj/item/clothing/neck/roguetown/psicross/undivided
			if(H.mind)
				var/cloaks = list("Cloak", "Tabard")
				var/cloakchoice = input(H,"Choose your covering", "TAKE UP FASHION") as anything in cloaks
				switch(cloakchoice)
					if("Cloak")
						cloak = /obj/item/clothing/cloak/undivided
					if("Tabard")
						cloak = /obj/item/clothing/cloak/templar/undivided_alt
				var/helms = list("Sallet", "Barbute")
				var/helmchoice = input(H, "Choose your headwear", "TAKE UP NOGGIN PROTECTION") as anything in helms
				switch(helmchoice)
					if("Sallet")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/undivided
					if("Barbute")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/holyseebarbute
		if(/datum/patron/divine/astrata)
			wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
			if(H.mind)
				var/helms = list("Astratan Helm", "Astratan Bucket", "Astratan Kulah khud")
				var/helmchoice = input(H, "Choose your headwear", "TAKE UP NOGGIN PROTECTION") as anything in helms
				switch(helmchoice)
					if("Astratan Helm")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/astratahelm
					if("Astratan Bucket")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/astratan
					if("Astratan Kulah khud")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/ranesh_stratan
			cloak = /obj/item/clothing/cloak/templar/astratan
		if(/datum/patron/divine/abyssor)
			wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
			head = /obj/item/clothing/head/roguetown/helmet/heavy/abyssorgreathelm
			cloak = /obj/item/clothing/cloak/tabard/abyssorite
		if(/datum/patron/divine/xylix)
			cloak = /obj/item/clothing/cloak/templar/xylixian
			head = /obj/item/clothing/head/roguetown/helmet/heavy/xylixhelm
			H.cmode_music = 'sound/music/combat_jester.ogg'
		if(/datum/patron/divine/dendor)
			wrists = /obj/item/clothing/neck/roguetown/psicross/dendor
			head = /obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
			cloak = /obj/item/clothing/cloak/tabard/crusader/dendor
			H.cmode_music = 'sound/music/cmode/garrison/combat_warden.ogg'
		if(/datum/patron/divine/necra)
			wrists = /obj/item/clothing/neck/roguetown/psicross/necra
			if(H.mind)
				var/helms = list("Skull Helm", "Hood Helm")
				var/helmchoice = input(H, "Choose your headwear", "TAKE UP NOGGIN PROTECTION") as anything in helms
				switch(helmchoice)
					if("Skull Helm")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/necrahelm
					if("Hood Helm")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/necran
			cloak = /obj/item/clothing/cloak/templar/necran
		if(/datum/patron/divine/pestra)
			wrists = /obj/item/clothing/neck/roguetown/psicross/pestra
			head = /obj/item/clothing/head/roguetown/helmet/heavy/pestran
			cloak = /obj/item/clothing/cloak/templar/pestran
		if(/datum/patron/divine/eora) //Eora content from stonekeep
			wrists = /obj/item/clothing/neck/roguetown/psicross/eora
			head = /obj/item/clothing/head/roguetown/helmet/heavy/eoran
			cloak = /obj/item/clothing/cloak/templar/eoran
		if(/datum/patron/divine/noc)
			wrists = /obj/item/clothing/neck/roguetown/psicross/noc
			head = /obj/item/clothing/head/roguetown/helmet/heavy/nochelm
			cloak = /obj/item/clothing/cloak/tabard/devotee/noc
		if(/datum/patron/divine/ravox)
			wrists = /obj/item/clothing/neck/roguetown/psicross/ravox
			if(H.mind)
				var/helms = list("Justice Eagle", "Plumed Helm")
				var/helmchoice = input(H, "Choose your headwear", "TAKE UP NOGGIN PROTECTION") as anything in helms
				switch(helmchoice)
					if("Justice Eagle")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/ravoxhelm
					if("Plumed Helm")
						head = /obj/item/clothing/head/roguetown/helmet/heavy/ravox_visor
			cloak = /obj/item/clothing/cloak/templar/ravox
			mask = /obj/item/clothing/head/roguetown/roguehood/ravoxgorget
		if(/datum/patron/divine/malum)
			wrists = /obj/item/clothing/neck/roguetown/psicross/malum
			cloak = /obj/item/clothing/cloak/templar/malumite
			head = /obj/item/clothing/head/roguetown/helmet/heavy/malum
		if(/datum/patron/old_god)
			wrists = /obj/item/clothing/neck/roguetown/psicross
			cloak = /obj/item/clothing/cloak/tabard/crusader/psydon
	// Patron dagger in satchel
	var/patron_dagger = get_templar_patron_dagger(H)
	if(patron_dagger)
		backpack_contents += patron_dagger

	H.dna.species.soundpack_m = GLOB.voice_packs[/datum/voicepack/male/knight]
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T2, passive_gain = CLERIC_REGEN_MINOR, devotion_limit = CLERIC_REQ_2)	//Capped to T2 miracles.
	if(H.mind)
		SStreasury.grant_savings(ECONOMIC_LOWER_MIDDLE_CLASS, H)

/datum/outfit/job/roguetown/templar/tempest/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Crossbow", "Bow")
	switch(H.patron?.type)
		if(/datum/patron/divine/eora)
			weapons += "Harp Bow (long)"
			weapons += "Harp Bow (short)"
	var/weapon_choice = input(H, "Choose your WEAPON.", "TAKE UP YOUR GOD'S ARMS") as anything in weapons
	switch(weapon_choice)
		if("Crossbow")
			H.equip_to_slot_or_del(new /obj/item/quiver/bolt/standard(H), SLOT_BELT_R, TRUE)
			H.equip_to_slot_or_del(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(H), SLOT_BACK_L, TRUE)
		if("Bow")
			H.equip_to_slot_or_del(new /obj/item/quiver/arrows(H), SLOT_BELT_R, TRUE)
			H.equip_to_slot_or_del(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve(H), SLOT_BACK_L, TRUE)
		if("Harp Bow (long)")
			H.equip_to_slot_or_del(new /obj/item/quiver/arrows(H), SLOT_BELT_R, TRUE)
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow/eora(H))
		if("Harp Bow (short)")
			H.equip_to_slot_or_del(new /obj/item/quiver/arrows(H), SLOT_BELT_R, TRUE)
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve/eora(H))

	// -- Start of section for god specific bonuses --
	if(H.patron?.type == /datum/patron/divine/undivided)
		H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
	if(H.patron?.type == /datum/patron/divine/astrata)
		H.adjust_skillrank(/datum/skill/magic/holy, SKILL_LEVEL_NOVICE, TRUE)
		H.cmode_music = 'sound/music/cmode/church/combat_astrata.ogg'
	if(H.patron?.type == /datum/patron/divine/dendor)
		H.adjust_skillrank(/datum/skill/labor/farming, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
	if(H.patron?.type == /datum/patron/divine/noc)
		H.adjust_skillrank(/datum/skill/misc/reading, SKILL_LEVEL_JOURNEYMAN, TRUE) // Really good at reading... does this really do anything? No. BUT it's soulful.
		H.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/magic/arcane, SKILL_LEVEL_NOVICE, TRUE)
		ADD_TRAIT(H, TRAIT_ALCHEMY_EXPERT, TRAIT_GENERIC)
	if(H.patron?.type == /datum/patron/divine/abyssor)
		H.adjust_skillrank(/datum/skill/labor/fishing, SKILL_LEVEL_APPRENTICE, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, SKILL_LEVEL_NOVICE, TRUE)
		ADD_TRAIT(H, TRAIT_WATERBREATHING, TRAIT_GENERIC)
		H.grant_language(/datum/language/abyssal)
	if(H.patron?.type == /datum/patron/divine/necra)
		ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
		H.cmode_music = 'sound/music/cmode/church/combat_necra.ogg'
	if(H.patron?.type == /datum/patron/divine/pestra)
		H.adjust_skillrank(/datum/skill/misc/medicine, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/craft/alchemy, SKILL_LEVEL_NOVICE, TRUE)
		ADD_TRAIT(H, TRAIT_ALCHEMY_EXPERT, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	if(H.patron?.type == /datum/patron/divine/eora)
		ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
		H.cmode_music = 'sound/music/cmode/church/combat_eora.ogg'
	if(H.patron?.type == /datum/patron/divine/malum)
		H.adjust_skillrank(/datum/skill/craft/blacksmithing, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/craft/armorsmithing, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/craft/weaponsmithing, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/craft/smelting, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/labor/lumberjacking, SKILL_LEVEL_APPRENTICE, TRUE)
	if(H.patron?.type == /datum/patron/divine/ravox)
		H.adjust_skillrank(/datum/skill/misc/athletics, SKILL_LEVEL_NOVICE, TRUE)
	if(H.patron?.type == /datum/patron/divine/xylix)
		H.adjust_skillrank(/datum/skill/misc/climbing, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, SKILL_LEVEL_NOVICE, TRUE)
		H.adjust_skillrank(/datum/skill/misc/music, SKILL_LEVEL_NOVICE, TRUE)
	// -- End of section for god specific bonuses --
