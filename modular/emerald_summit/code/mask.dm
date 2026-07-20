// Emerald Summit port — extracted from code/modules/clothing/rogueclothes/mask.dm

/obj/item/clothing/mask/rogue/spectacles/clear
	name = "clear spectacles"
	desc = "Spectacles with modified lenses, so people can see your pretty eyes."
	icon_state = "glassesclear"

/obj/item/clothing/mask/rogue/facemask/steel/pestra_beakmask // no craft recipe on purpose, since it's a better iron mask (no FOV malus) and is limited only to pestrans who do healing stuff
	name = "beak mask"
	desc = "<span class='necrosis'>\"...Local medicine… can do a lot. Although, while studying, I started to see it as backwards. But it did work at times.\"</br> A plague is death to you. But to me, it is an exam. And one must take exams sooner or later.</span>" // quotes from pathologic games

	icon = 'icons/roguetown/clothing/masks.dmi' // the sprites were in the files. I believe they are from IS12, I can't remember. I like the sprites a lot, if it's any solace
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/masks.dmi'
	item_state = "feldmask"
	icon_state = "feldmask"

	block2add = null
	max_integrity = 100
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDESNOUT
	body_parts_covered = FULL_HEAD
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	slot_flags = ITEM_SLOT_MASK
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)

	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/mask/rogue/exoticsilkmask
	name = "exotic silk mask"
	icon_state = "exoticsilkmask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE
	adjustable = CAN_CADJUST
	toggle_icon_state = FALSE

/obj/item/clothing/mask/rogue/exoticsilkmask/ComponentInitialize()
	AddComponent(/datum/component/adjustable_clothing, NECK, null, null, 'sound/foley/equip/rummaging-03.ogg', null, (UPD_HEAD|UPD_MASK))	//Standard mask

/obj/item/clothing/mask/rogue/eoramask
	name = "eoran mask"
	desc = "A silver mask in the likeness of a rabbit. Usually worn by the faithful of Eora during their rituals, but it's not like anyone's going to stop you. Right?"
	color = null
	icon_state = "eoramask"
	item_state = "eoramask"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64.dmi'
	flags_inv = HIDEFACE
	resistance_flags = FIRE_PROOF // Made of metal

/obj/item/clothing/mask/rogue/eoramask/equipped(mob/living/carbon/human/user, slot) //Copying Eora bud pacifism
	. = ..()
	if(slot == SLOT_HEAD)
		ADD_TRAIT(user, TRAIT_PACIFISM, "eoramask_[REF(src)]")

/obj/item/clothing/mask/rogue/eoramask/dropped(mob/living/carbon/human/user)
	..()
	REMOVE_TRAIT(user, TRAIT_PACIFISM, "eoramask_[REF(src)]")

/obj/item/clothing/mask/rogue/eoramask/attack_hand(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.head)
			to_chat(user, "<span class='warning'>I need some time to remove the mask peacefully.</span>")
			if(do_after(user, 50))
				return ..()
			return
	return ..()

