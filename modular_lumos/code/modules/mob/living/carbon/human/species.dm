Pu/datum/species/handle_digestion(mob/living/carbon/human/H)
	. = ..()
	switch(H.nutrition)
		if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
			if(prob(50))
				H.eye_blurry += 2
		if(NUTRITION_LEVEL_CRAVING to NUTRITION_LEVEL_STARVING)
			if(prob(50))
				H.eye_blurry += 2
				H.adjustStaminaLoss(4)
		if(-INFINITY to NUTRITION_LEVEL_CRAVING)
			if(prob(50))
				H.eye_blurry += 2
				H.hallucination += 2
				H.adjustStaminaLoss(4)
