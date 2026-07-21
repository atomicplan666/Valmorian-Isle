// Emerald Summit port — extracted from code/game/objects/items/rogueitems/leash.dm

/atom/movable/screen/alert/status_effect/leash_owner
	name = "Leash Master"
	desc = "You've got a leash, and a cute pet on the other end!"
	icon_state = "leash_master"

/atom/movable/screen/alert/status_effect/leash_freepet
	name = "Escaped Pet"
	desc = "You're on a leash, but you've no Master. If anyone grabs the leash they'll gain control!"
	icon_state = "leash_freepet"

/atom/movable/screen/alert/status_effect/leash_pet
	name = "Leashed Pet"
	desc = "You're on the leash now! Be good for your Master now.."
	icon_state = "leash_pet"

/datum/status_effect/leash_owner
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/leash_owner

/datum/status_effect/leash_freepet
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/leash_freepet

/datum/status_effect/leash_pet
	id = "leashed"
	status_type = STATUS_EFFECT_UNIQUE
	var/mob/redirect_component
	alert_type = /atom/movable/screen/alert/status_effect/leash_pet

/datum/status_effect/leash_pet/on_apply()
	redirect_component = owner
	if(!owner.stat)
		to_chat(owner, span_userdanger("You have been leashed!"))
	return ..()

/obj/item/leash/chain
	name = "chain leash"
	desc = "A durable metal chain with a metal clasp on the end for easy clipping onto bindings."
	icon = 'modular/icons/obj/leashes_collars.dmi'
	icon_state = "chainleash"
	item_state = "chainleash"
	resistance_flags = FIRE_PROOF
	equip_sound = 'sound/foley/equip/equip_armor_chain.ogg'
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'

