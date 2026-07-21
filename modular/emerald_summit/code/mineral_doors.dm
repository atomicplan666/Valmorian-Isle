// Emerald Summit port — extracted from code/game/objects/structures/mineral_doors.dm

/obj/structure/mineral_door/wood/fancywood/knight
	locked = TRUE
	keylock = TRUE
	grant_resident_key = TRUE
	resident_key_type = /obj/item/roguekey/knight
	resident_role = /datum/job/roguetown/knight
	lockid = null //Will be randomized

/obj/structure/mineral_door/wood/towner/woodcutter
	// ES /datum/advclass/woodcutter not ported — door remains keyed via lockid
	lockid = "towner_woodcutter"

