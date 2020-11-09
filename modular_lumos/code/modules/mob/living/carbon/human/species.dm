/datum/species/handle_digestion(mob/living/carbon/human/H)
	. = ..()
	if(H.nutrition <= NUTRITION_LEVEL_HUNGRY)
		if(prob(50))
			if(H.eye_blurry <= 120)
				H.eye_blurry += 1
	if(H.nutrition <= NUTRITION_LEVEL_STARVING)
		if(prob(50))
			if(H.eye_blurry <= 120)
				H.eye_blurry += 1
			H.adjustStaminaLoss(4)
	if(H.nutrition <= NUTRITION_LEVEL_CRAVING)
		if(prob(50))
			if(H.eye_blurry <= 120)
				H.eye_blurry += 1
			H.adjustStaminaLoss(4)
			H.hallucination += 2
	if(H.nutrition <= 0)
		if(prob(50))
			if(H.eye_blurry <= 120)
				H.eye_blurry += 1
			H.adjustStaminaLoss(4)
			H.hallucination += 2
