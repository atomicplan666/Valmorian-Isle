// Emerald Summit port — extracted from code/modules/spells/spell_types/wizard/projectiles_single/frost_bolt.dm

/obj/effect/proc_holder/spell/invoked/projectile/frostbolt // to do: get scroll icon
	name = "Frost Bolt"
	desc = "Shoot a shard of ice. Its victim suffers slowness and fatigue, intensified by repeated casts."
	range = 8
	projectile_type = /obj/projectile/magic/frostbolt
	overlay_state = "frost_bolt"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 8
	recharge_time = 6 SECONDS //cooldown

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = FALSE //can you use it if you are antimagicked?
	charging_slowdown = 3
	spell_tier = 2
	invocations = list("Sagitta Glaciei!")
	invocation_type = "shout"
	glow_color = GLOW_COLOR_ICE
	glow_intensity = GLOW_INTENSITY_LOW
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane //can be arcane, druidic, blood, holy
	cost = 3

	xp_gain = TRUE
	miracle = FALSE

