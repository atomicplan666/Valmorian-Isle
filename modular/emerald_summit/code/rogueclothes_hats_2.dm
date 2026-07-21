// Emerald Summit port — extracted from modular_stonehedge/code/modules/clothing/rogueclothes/hats.dm

/obj/item/clothing/head/roguetown/helmet/leather/armorhood/advanced

	name = "studded leather hood"
	desc = "A thick studded leather hood with buckles."
	icon_state = "studhood" //make into new sprite
	item_state = "studhood"
	max_integrity = 280
	//closer to metal helmet but still quite behind, same blunt resist of hardened leather helmet though.
	armor = list("blunt" = 90, "slash" = 80, "stab" = 70, "piercing" = 20, "fire" = 0, "magic" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP, BCLASS_SMASH) //studded armor values with stab prot too

