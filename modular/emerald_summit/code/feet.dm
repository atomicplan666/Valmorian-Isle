// Emerald Summit port — extracted from code/modules/clothing/rogueclothes/feet.dm

/obj/item/clothing/shoes/roguetown/boots/blacksteel/plateboots
	name = "ancient blacksteel plate boots"
	desc = "Boots forged of durable blacksteel."
	body_parts_covered = FEET|TAIL_LAMIA
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkboots"
	item_state = "bkboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	color = null
	blocksound = PLATEHIT
	max_integrity = 400
	armor = ARMOR_PLATE_BSTEEL
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel
	resistance_flags = FIRE_PROOF

