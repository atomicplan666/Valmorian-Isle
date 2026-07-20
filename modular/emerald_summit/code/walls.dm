// Emerald Summit port — extracted from code/game/turfs/closed/walls.dm

/turf/closed/wall/churchpass
    name = "stone wall"
    desc = "A strange wall, faintly shimmering."
    icon = 'icons/turf/walls/stone_wall.dmi'
    icon_state = "stone"
    explosion_block = 1
    baseturfs = list(/turf/open/floor/rogue/dirt/road)

/turf/closed/wall/churchpass/attack_hand(mob/user)
    if(HAS_TRAIT(user, TRAIT_CLERGY))
        to_chat(user, span_notice("The wall fades away before you..."))
        disappear()
        return
    else
        return ..()

/turf/closed/wall/churchpass/proc/disappear()
    density = FALSE
    opacity = FALSE
    icon_state = ""
    playsound(src, 'sound/misc/area.ogg', 10, FALSE)

    addtimer(CALLBACK(src, PROC_REF(reappear)), 10 SECONDS)

/turf/closed/wall/churchpass/proc/reappear()
    density = TRUE
    opacity = TRUE
    icon_state = initial(icon_state)
    playsound(src, 'sound/misc/area.ogg', 10, FALSE)

