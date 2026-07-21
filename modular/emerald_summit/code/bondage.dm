// Emerald Summit port — extracted from code/game/objects/structures/roguetown/bondage.dm

/obj/structure/bondage/x_pillory
	name = "x-pillory"
	desc = "A brutal restraint shaped like a cross."
	icon_state = "x_pillory"
	layer = OBJ_LAYER
	plane = GAME_PLANE
	var/buckle_offset_x = 0
	var/buckle_offset_y = 2

/obj/structure/bondage/x_pillory/post_buckle_mob(mob/living/M)
	. = ..()
	M.set_mob_offsets("bed_buckle", _x = buckle_offset_x, _y = buckle_offset_y)

/obj/structure/bondage/x_pillory/post_unbuckle_mob(mob/living/M)
	. = ..()
	M.reset_offsets("bed_buckle")

/obj/structure/bondage/x_pillory/user_unbuckle_mob(mob/living/buckled_mob, mob/living/user)
	// Someone else is unbuckling the victim
	if(user != buckled_mob)
		user.visible_message(span_notice("[user] starts unstrapping [buckled_mob] from [src]..."), \
			span_notice("You start unstrapping [buckled_mob] from [src]..."))
		if(do_after(user, 3 SECONDS, src))
			return ..()
		return

	// Victim trying to unbuckle self
	to_chat(user, span_warning("You struggle against the tight straps..."))
	if(do_after(user, 10 SECONDS, src))
		user.visible_message(span_warning("[user] manages to unstrap [user.p_them()]self from [src]!"), \
			span_notice("You manage to unstrap yourself from [src]!"))
		return ..()

/obj/structure/bondage/gloryhole
	name = "gloryhole"
	desc = "A wooden partition with a suspicious hole."
	icon_state = "gloryhole"
	density = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = GAME_PLANE_UPPER
	buckleverb = "position"
	var/buckle_offset_x = 0
	var/buckle_offset_y = 1

/obj/structure/bondage/gloryhole/post_buckle_mob(mob/living/M)
	. = ..()
	M.set_mob_offsets("bed_buckle", _x = buckle_offset_x, _y = buckle_offset_y)

/obj/structure/bondage/gloryhole/post_unbuckle_mob(mob/living/M)
	. = ..()
	M.reset_offsets("bed_buckle")

/obj/structure/bondage/torture_table/lever
	name = "torture table lever"
	desc = "A torture table with a built-in lever mechanism."
	icon = 'icons/roguetown/misc/64x64.dmi'
	icon_state = "tort_table_lever"

