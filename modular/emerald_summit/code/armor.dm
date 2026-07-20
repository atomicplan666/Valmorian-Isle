// Emerald Summit port — extracted from code/modules/clothing/rogueclothes/armor.dm

/obj/item/clothing/suit/roguetown/armor/plate/half
	slot_flags = ITEM_SLOT_ARMOR
	name = "steel cuirass"
	desc = "A basic cuirass of steel. Lightweight and durable. A crossbow bolt will probably go right through this, but not an arrow."
	body_parts_covered = COVERAGE_VEST
	icon_state = "cuirass"
	item_state = "cuirass"
	armor = ARMOR_CUIRASS
	allowed_race = CLOTHED_RACES_TYPES
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	smelt_bar_num = 2

/obj/item/clothing/suit/roguetown/armor/plate/half/aalloy
	name = "decrepit cuirass"
	desc = "A withered cuirass. Aeon's grasp is upon its form."
	icon_state = "ancientcuirass"
	smeltresult = /obj/item/ingot/aalloy
	max_integrity = 150

/obj/item/clothing/suit/roguetown/armor/plate/half/fluted/ornate
	name = "silver cuirass"
	icon_state = "ornatecuirass"
	desc = "An ornate steel cuirass with tassets, favored by both the Holy Inquisition and the Order of the Silver cross. \
			Made to endure."

	max_integrity = 300

/obj/item/clothing/suit/roguetown/armor/plate/half/iron
	name = "iron breastplate"
	desc = "A basic cuirass of iron, protective and moderately durable."
	icon_state = "ibreastplate"
	max_integrity = 200
	smeltresult = /obj/item/ingot/iron
	smelt_bar_num = 2

/obj/item/clothing/suit/roguetown/armor/plate/blacksteel_full_plate
	name = "ancient blacksteel plate armor"
	desc = "A suit of Full Plate smithed from durable blacksteel. With an internally layered gambeson, the piercing and blunt protection is unmatched among its heavy-plated peers."
	body_parts_covered = COVERAGE_FULL
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkarmor"
	item_state = "bkarmor"
	armor = ARMOR_PLATE_BSTEEL
	allowed_race = CLOTHED_RACES_TYPES
	blocking_behavior = null
	max_integrity = 650
	smeltresult = /obj/item/ingot/blacksteel
	equip_delay_self = 12 SECONDS
	unequip_delay_self = 12 SECONDS
	equip_delay_other = 3 SECONDS
	strip_delay = 6 SECONDS
	smelt_bar_num = 4

