// Emerald Summit port — extracted from code/game/objects/items/rogueweapons/melee/knives.dm

/obj/item/rogueweapon/huntingknife/idagger/silver/psydagger/preblessed/ComponentInitialize()
	AddComponent(\
		/datum/component/silverbless,\
		pre_blessed = BLESSING_PSYDONIAN,\
		silver_type = SILVER_PSYDONIAN,\
		added_force = 0,\
		added_blade_int = 0,\
		added_int = 100,\
		added_def = 2,\
	)

