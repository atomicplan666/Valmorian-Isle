// Emerald Summit port — extracted from code/modules/spells/spell_types/wizard/projectiles_single/lightning_bolt.dm

/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt
	name = "Bolt of Lightning"
	desc = "Emit a bolt of lightning that burns a target, forcing them to drop items, preventing them from attacking, and slowing them down for a short time."
	clothes_req = FALSE
	overlay_state = "lightning"
	sound = 'sound/magic/lightning.ogg'
	range = 8
	projectile_type = /obj/projectile/magic/lightning
	releasedrain = 30
	chargedrain = 1
	chargetime = 15
	recharge_time = 20 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokelightning
	associated_skill = /datum/skill/magic/arcane
	glow_color = GLOW_COLOR_LIGHTNING
	glow_intensity = GLOW_INTENSITY_MEDIUM
	spell_tier = 2
	invocations = list("Fulmen!")
	invocation_type = "shout"
	cost = 3
	xp_gain = TRUE

