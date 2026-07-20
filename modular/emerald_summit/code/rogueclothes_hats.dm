// Emerald Summit port — extracted from code/modules/clothing/rogueclothes/hats.dm

/obj/item/clothing/head/roguetown/nochood
	name = "moon hood"
	desc = "A hood worn by those who favor Noc with a mask in the shape of a crescent."
	color = null
	icon_state = "nochood"
	item_state = "nochood"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	dynamic_hair_suffix = ""
	sewrepair = TRUE

/obj/item/clothing/head/roguetown/padded/briarthorns
	name = "briar thorns"
	desc = "The pain of wearing it might distract you from the whispers of a mad God overpowering your sanity..."
	icon_state = "briarthorns"
	max_integrity = 150
	body_parts_covered = HEAD|HAIR|EARS 
	armor = ARMOR_HEAD_BAD //durability and some padded defense for briars

/obj/item/clothing/head/roguetown/padded/briarthorns/pickup(mob/living/user)
	. = ..()
	to_chat(user, span_warning ("The thorns prick me."))
	user.adjustBruteLoss(4)

/obj/item/clothing/head/roguetown/helmet/blacksteel/bucket
	name = "blacksteel bucket helm"
	desc = "A bucket helmet forged of durable blacksteel. None shall pass.."
	body_parts_covered = FULL_HEAD
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkhelm"
	item_state = "bkhelm"
	flags_inv = HIDEEARS|HIDEFACE|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = ARMOR_PLATE_BSTEEL
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	block2add = FOV_BEHIND
	max_integrity = 425
	smeltresult = /obj/item/ingot/blacksteel
	smelt_bar_num = 2

// Full ES flower hat family

/obj/item/clothing/head/flowers
	name = "Flowers"
	desc = " "
	icon_state = "dflower"
	item_state = "dflower"
	icon = 'icons/roguetown/misc/flowerspack.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_MASK
	alternate_worn_layer = 8.9 //On top of helmet
	body_parts_covered = NONE
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3

/obj/item/clothing/head/flowers/purple_lily
	name = "Purple lily"
	desc = "A purple lily, steeped in the hues of twilight. It whispers of forgotten prayers beneath a dying sun."
	icon_state = "dflower1"
	item_state = "dflower1"

/obj/item/clothing/head/flowers/snapdragon
	name = "Snapdragon"
	desc = "A snapdragon, vibrant yet fragile. Its blooms mimic a beast’s maw-silent, but ever hungry for remembrance."
	icon_state = "dflower2"
	item_state = "dflower2"

/obj/item/clothing/head/flowers/redpurple_rose
	name = "Red-purple rose"
	desc = "A red-purple rose, blooming like a wound upon memory. Its petals weep in silence for fallen kings."
	icon_state = "dflower3"
	item_state = "dflower3"

/obj/item/clothing/head/flowers/burdock_flower_purple
	name = "Purple burdock flower"
	desc = "A purple burdock flower, tangled and wild. Said to bloom on cursed soil, where no light lingers."
	icon_state = "dflower4"
	item_state = "dflower4"

/obj/item/clothing/head/flowers/yellow_lily
	name = "Yellow lily"
	desc = "A yellow lily, bright as false hope. Carried once by a maiden who walked into the abyss."
	icon_state = "dflower5"
	item_state = "dflower5"

/obj/item/clothing/head/flowers/burdock_flower_pink
	name = "Pink burdock flower"
	desc = "A pink burdock flower, soft in color, bitter in tale. Legends say it grew from the tears of exiled witches."
	icon_state = "dflower6"
	item_state = "dflower6"

/obj/item/clothing/head/flowers/yarrow_white
	name = "White yarrow"
	desc = "A white yarrow, pale as bone. It grows in graves where even time dares not tread."
	icon_state = "dflower7"
	item_state = "dflower7"

/obj/item/clothing/head/flowers/rose_pink
	name = "Pink rose"
	desc = "A pink rose, delicate and silent. Its scent recalls a lullaby sung on the eve of ruin."
	icon_state = "dflower8"
	item_state = "dflower8"

/obj/item/clothing/head/flowers/roses_red
	name = "Red roses rose"
	desc = "A cluster of red roses, rich and sanguine. Their beauty is as fleeting as the breath of the slain."
	icon_state = "dflower9"
	item_state = "dflower9"

/obj/item/clothing/head/flowers/peony
	name = "Peony"
	desc = "A peony, lush and secretive. In its folds lie whispers of ancient sorrow."
	icon_state = "dflower10"
	item_state = "dflower10"

/obj/item/clothing/head/flowers/forget_me_not_alt
	name = "Pink-forget-me-not"
	desc = "A pink forget-me-not, gentle and strange. A flower of promises never kept."
	icon_state = "dflower11"
	item_state = "dflower11"

/obj/item/clothing/head/flowers/forget_me_not
	name = "Forget-me-not"
	desc = "A blue forget-me-not, eternal in mourning. It blooms only where memories die."
	icon_state = "dflower12"
	item_state = "dflower12"

/obj/item/clothing/head/flowers/blue_rose
	name = "Blue rose"
	desc = "A blue rose, cold and unnatural. Said to bloom only in places where reality frays."
	icon_state = "dflower13"
	item_state = "dflower13"

/obj/item/clothing/head/flowers/orange_rose
	name = "Orange rose"
	desc = "An orange rose, burning like embered pride. Fades as quickly as ambition in the dark."
	icon_state = "dflower14"
	item_state = "dflower14"

/obj/item/clothing/head/flowers/sunflower
	name = "Sunflower"
	desc = "A sunflower, ever-turning toward light long gone. A cruel symbol of futile hope."
	icon_state = "dflower15"
	item_state = "dflower15"

/obj/item/clothing/head/flowers/yellow_bells
	name = "Yellow bells"
	desc = "Yellow bells, ringing in silence. In old songs, they mark the hour of a warrior's last breath."
	icon_state = "dflower16"
	item_state = "dflower16"

/obj/item/clothing/head/flowers/poppy
	name = "Poppy"
	desc = "A poppy, crimson and still. Grows where blood once sang through shattered hearts."
	icon_state = "dflower17"
	item_state = "dflower17"

/obj/item/clothing/head/flowers/blue_purple_bells
	name = "Blue and purple bells"
	desc = "Blue and purple bells, swaying in unseen winds. Their chime echoes through forgotten catacombs."
	icon_state = "dflower18"
	item_state = "dflower18"

/obj/item/clothing/head/flowers/iris
	name = "Iris"
	desc = "An iris of deep hue, regal yet sorrowed. A herald of endings, cloaked in grace."
	icon_state = "dflower19"
	item_state = "dflower19"

/obj/item/clothing/head/flowers/muscaris
	name = "Muscaris"
	desc = "A muscaris bloom, clustered like whispers. Found near ruins where no laughter remains."
	icon_state = "dflower20"
	item_state = "dflower20"

/obj/item/clothing/head/flowers/lavander
	name = "Lavander"
	desc = "Lavander, soft and spectral. Used to anoint the dead in lands now nameless."
	icon_state = "dflower21"
	item_state = "dflower21"

/obj/item/clothing/head/flowers/milva
	name = "Milva"
	desc = "A milva blossom, name lost to time. Said to bloom for those who choose exile over chains."
	icon_state = "dflower22"
	item_state = "dflower22"

/obj/item/clothing/head/flowers/yellow_iris
	name = "Yellow iris"
	desc = "A yellow iris, bright like defiance. Once worn by those who marched into oblivion, unafraid."
	icon_state = "dflower23"
	item_state = "dflower23"
