/datum/species
	var/vore_delay = 0

/datum/species/handle_digestion(mob/living/carbon/human/H)
	. = ..()
	if(H.nutrition > NUTRITION_LEVEL_HUNGRY)
		H.remove_movespeed_modifier(MOVESPEED_ID_MOB_HUNGER)
	if(H.nutrition <= NUTRITION_LEVEL_HUNGRY)
		if(prob(2))
			to_chat(H, "<span class='warning'>You are feeling quite hungry...</span>")
		H.add_movespeed_modifier(/datum/movespeed_modifier/hunger/small)
	if(H.nutrition <= NUTRITION_LEVEL_STARVING)
		if(prob(50))
			H.adjustStaminaLoss(2)
		H.add_movespeed_modifier(/datum/movespeed_modifier/hunger/medium)
		if(vore_delay < world.time)
			vore_delay = world.time + rand(1 MINUTES, 3 MINUTES)
			var/pick_sound = pick(list(	'modular_lumos/sound/effects/hungry1.ogg',
										'modular_lumos/sound/effects/hungry2.ogg',
										'modular_lumos/sound/effects/hungry3.ogg',
										'modular_lumos/sound/effects/hungry4.ogg'))
			playsound(H.loc, pick_sound, 20, FALSE, -3)
	if(H.nutrition <= NUTRITION_LEVEL_CRAVING)
		if(prob(50))
			H.adjustStaminaLoss(2)
		H.add_movespeed_modifier(/datum/movespeed_modifier/hunger/large)
	if(H.nutrition <= 0)
		if(prob(50))
			H.adjustStaminaLoss(2)
		H.add_movespeed_modifier(/datum/movespeed_modifier/hunger/xlarge)
