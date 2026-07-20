// Emerald Summit port — extracted from code/modules/mob/living/simple_animal/friendly/farm_animals.dm

/obj/item/reagent_containers/food/snacks/egg/var/amount_grown = 0

/obj/item/reagent_containers/food/snacks/egg/process()
	..()
	if(fertile)
		if(isturf(loc))
			amount_grown += rand(1,2)
			if(amount_grown >= 100)
				visible_message(span_notice("[src] hatches with a quiet cracking sound."))
				new /mob/living/simple_animal/chick(get_turf(src))
				STOP_PROCESSING(SSobj, src)
				qdel(src)

