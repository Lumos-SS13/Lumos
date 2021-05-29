// Note - Split apart NV eyes after adding the Ashwalker specific eyesight because I disliked Ashwalkers having essentially fullbright eyes.
// Should be alot more varied, so daresay even NV eye'd species could theoretically be station side if they have the least NV eye. ~ Fajetti
// eyeball sprotes are in surgery.dmi

/obj/item/organ/eyes/night_vision
	name = "shadow eyes"
	desc = "A spooky set of eyes that can see in the dark."
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	actions_types = list(/datum/action/item_action/organ_action/use)
	var/night_vision = TRUE

/obj/item/organ/eyes/night_vision/basic // Best for normal species, sees moderately in the dark but still would need a lamp.
	name = "low-light eyes"
	desc = "A pair of eyes common to subterranean species. Can see a limited degree in the dark."
	icon_state = "eyeballs_lizard"

/obj/item/organ/eyes/night_vision/basic/ui_action_click()
	sight_flags = initial(sight_flags)
	switch(lighting_alpha)
		if (LIGHTING_PLANE_ALPHA_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
		else
			lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE
			sight_flags &= ~SEE_BLACKNESS
	owner.update_sight()

/obj/item/organ/eyes/night_vision/advanced // Alot more for antags like Ayyyliums
	name = "ultra-low-light eyes"
	desc = "A pair of eyes common to subterranean species. Can see in the dark fairly well."
	icon_state = "eyeballs_lizard"

/obj/item/organ/eyes/night_vision/advanced/ui_action_click()
	sight_flags = initial(sight_flags)
	switch(lighting_alpha)
		if (LIGHTING_PLANE_ALPHA_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
		if (LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
		else
			lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE
			sight_flags &= ~SEE_BLACKNESS
	owner.update_sight()

/obj/item/organ/eyes/night_vision/fullbright // Not for general game use unless it's explicitly antags or similar
	name = "no-light eyes"
	desc = "A pair of eyes capable of absorbing all light available, or making their own somehow."
	icon_state = "eyeballs_lizard"

/obj/item/organ/eyes/night_vision/fullbright/ui_action_click()
	sight_flags = initial(sight_flags)
	switch(lighting_alpha)
		if (LIGHTING_PLANE_ALPHA_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
		if (LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
		if (LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE)
			lighting_alpha = LIGHTING_PLANE_ALPHA_INVISIBLE
		else
			lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE
			sight_flags &= ~SEE_BLACKNESS
	owner.update_sight()

// night_vision/basic //

/obj/item/organ/eyes/night_vision/basic/mushroom
	name = "fung-eyes"
	desc = "While on the outside they look inert and dead, the eyes of mushroom people are actually very advanced."
	icon_state = "eyeballs_mushroom"

/obj/item/organ/eyes/night_vision/basic/ashwalker
	name = "reptilian eyes"
	desc = "Ashwalker eyes are adapted to the dark caves of their home."

// night_vision/advanced //
/obj/item/organ/eyes/night_vision/advanced/alien
	name = "xenomorphic eyes"
	desc = "It turned out they had them after all!"
	icon_state = "eyeballs_x"
	sight_flags = SEE_MOBS

/obj/item/organ/eyes/night_vision/advanced/zombie
	name = "undead eyes"
	desc = "Somewhat counterintuitively, these half-rotten eyes actually have superior vision to those of a living human."
	icon_state = "eyeballs_zombie"
	//sight_flags = SEE_MOBS        SKYRAT CHANGE - No more free thermals. Why did they keep this for so long?

// night_vision/fullbright //

/obj/item/organ/eyes/night_vision/fullbright/nightmare
	name = "burning red eyes"
	desc = "Even without their shadowy owner, looking at these eyes gives you a sense of dread."
	icon_state = "burning_eyes"

