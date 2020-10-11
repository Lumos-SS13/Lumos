/datum/species/handle_digestion(mob/living/carbon/human/H)
	. = ..()
	if(H.nutrition <= NUTRITION_LEVEL_HUNGRY)
		if(prob(50))
			H.eye_blurry += 1
	if(H.nutrition <= NUTRITION_LEVEL_STARVING)
		if(prob(50))
			H.eye_blurry += 1
			H.adjustStaminaLoss(2)
	if(H.nutrition <= NUTRITION_LEVEL_CRAVING)
		if(prob(50))
			H.eye_blurry += 1
			H.adjustStaminaLoss(2)
			H.hallucination += 2
	if(H.nutrition <= 0)
		if(prob(50))
			H.eye_blurry += 1
			H.adjustStaminaLoss(2)
			H.hallucination += 2
			H.adjustToxLoss(0.5)
			H.adjustBruteLoss(0.5)
