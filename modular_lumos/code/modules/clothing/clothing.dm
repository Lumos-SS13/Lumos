/obj/item/clothing/ears/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/ears.dmi'
	icon = 'modular_lumos/icons/obj/clothing/ears.dmi'

/obj/item/clothing/glasses/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/eyes.dmi'
	icon = 'modular_lumos/icons/obj/clothing/glasses.dmi'

/obj/item/clothing/gloves/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/hands.dmi'
	icon = 'modular_lumos/icons/obj/clothing/gloves.dmi'

/obj/item/clothing/head/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/head.dmi'
	icon = 'modular_lumos/icons/obj/clothing/hats.dmi'

/obj/item/clothing/neck/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/neck.dmi'
	icon = 'modular_lumos/icons/obj/clothing/neck.dmi'

/obj/item/clothing/mask/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/mask.dmi'
	icon = 'modular_lumos/icons/obj/clothing/masks.dmi'

/obj/item/clothing/shoes/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/feet.dmi'
	icon = 'modular_lumos/icons/obj/clothing/shoes.dmi'

/obj/item/clothing/suit/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/suit.dmi'
	icon = 'modular_lumos/icons/obj/clothing/suits.dmi'

/obj/item/clothing/under/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/uniform.dmi'
	icon = 'modular_lumos/icons/obj/clothing/uniforms.dmi'

/obj/item/clothing/back/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/back.dmi'
	icon = 'modular_lumos/icons/obj/clothing/back.dmi'

/obj/item/storage/belt/yogs
	mob_overlay_icon = 'modular_lumos/icons/mob/belt.dmi'
	icon = 'modular_lumos/icons/obj/clothing/belts.dmi'

//Clothing Here

/**
  * An undroppable mask that changes the user's speech to be unintelligable
  */
/obj/item/clothing/mask/yogs/cluwne
	name = "clown wig and mask"
	desc = "A true prankster's facial attire. A clown is incomplete without his wig and mask."
	alternate_screams = list('modular_lumos/sound/voice/cluwnelaugh1.ogg','modular_lumos/sound/voice/cluwnelaugh2.ogg','modular_lumos/sound/voice/cluwnelaugh3.ogg')
	flags_cover = MASKCOVERSEYES
	icon_state = "cluwne"
	item_state = "cluwne"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	item_flags = ABSTRACT | DROPDEL
	flags_inv = HIDEEARS | HIDEEYES
	modifies_speech = TRUE

	///world.time when a clune laugh was last played
	var/last_sound = 0
	///cooldown before playing another cluwne laugh
	var/delay = 15
	///if the mask should cluwne you when you put it on
	var/auto_cluwne = TRUE

/obj/item/clothing/mask/yogs/cluwne/Initialize()
	.=..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/**
  * Plays one of three cluwne laughs
  */
/obj/item/clothing/mask/yogs/cluwne/proc/play_laugh()
	if(world.time > last_sound + delay)
		var/i = rand(1,3)
		switch(i)
			if(1)
				playsound (src, 'modular_lumos/sound/voice/cluwnelaugh1.ogg', 30, 1)
			if(2)
				playsound (src, 'modular_lumos/sound/voice/cluwnelaugh2.ogg', 30, 1)
			if(3)
				playsound (src, 'modular_lumos/sound/voice/cluwnelaugh3.ogg', 30, 1)
		last_sound = world.time

/obj/item/clothing/mask/yogs/cluwne/handle_speech(datum/source, list/speech_args) //whenever you speak
	if(!CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED))
		if(prob(5)) //the brain isnt fully gone yet...
			speech_args[SPEECH_MESSAGE] = pick("HELP ME!!","PLEASE KILL ME!!","I WANT TO DIE!!", "END MY SUFFERING", "I CANT TAKE THIS ANYMORE!!" ,"SOMEBODY STOP ME!!")
			play_laugh()
		if(prob(3))
			speech_args[SPEECH_MESSAGE] = pick("HOOOOINKKKKKKK!!", "HOINK HOINK HOINK HOINK!!","HOINK HOINK!!","HOOOOOOIIINKKKK!!") //but most of the time they cant speak,
			play_laugh()
		else
			speech_args[SPEECH_MESSAGE] = pick("HEEEENKKKKKK!!", "HONK HONK HONK HONK!!","HONK HONK!!","HOOOOOONKKKK!!") //More sounds,
			play_laugh()

/obj/item/clothing/mask/yogs/cluwne/equipped(mob/user, slot)
	. = ..()
	if(!ishuman(user))
		return
	if(slot == SLOT_WEAR_MASK)
		play_laugh()
		if(auto_cluwne)
			var/mob/living/carbon/human/H = user
			H.dna.add_mutation(CLUWNEMUT)

/**
  * Togglable cluwne mask that has a small chance to turn the user into a cluwne or create a floor cluwne with the user as a target
  *
  * The logic of the cluwne mask is predetermined in [/obj/item/clothing/mask/yogs/cluwne/happy_cluwne/proc/Initialize] to prevent spamming the equip until you get a floor cluwne
  */
/obj/item/clothing/mask/yogs/cluwne/happy_cluwne
	name = "Happy Cluwne Mask"
	desc = "The mask of a poor cluwne that has been scrubbed of its curse by the Nanotrasen supernatural machinations division. Guaranteed to be 99% curse free and 99.9% not haunted. "
	item_flags = ABSTRACT
	clothing_flags = VOICEBOX_TOGGLABLE
	auto_cluwne = FALSE

	/// If active, turns the user into a cluwne
	var/does_cluwne = FALSE
	/// If active, creates a floor cluwne with the user as a target
	var/does_floor_cluwne = FALSE

/obj/item/clothing/mask/yogs/cluwne/happy_cluwne/Initialize()
	.=..()
	REMOVE_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
	if(prob(1)) //this function pre-determines the logic of the cluwne mask. applying and reapplying the mask does not alter or change anything
		does_cluwne = TRUE
		does_floor_cluwne = FALSE
	else if(prob(0.1))
		does_cluwne = FALSE
		does_floor_cluwne = TRUE

/obj/item/clothing/mask/yogs/cluwne/happy_cluwne/equipped(mob/user, slot)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(slot == SLOT_WEAR_MASK)
		if(does_cluwne)
			log_admin("[key_name(H)] was made into a cluwne by [src]")
			message_admins("[key_name(H)] got cluwned by [src]")
			to_chat(H, "<span class='userdanger'>The masks straps suddenly tighten to your face and your thoughts are erased by a horrible green light!</span>")
			H.dropItemToGround(src)
			ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
			H.cluwneify()
			qdel(src)
		else if(does_floor_cluwne)
			var/turf/T = get_turf(src)
			var/mob/living/simple_animal/hostile/floor_cluwne/S = new(T)
			S.Acquire_Victim(user)
			log_admin("[key_name(user)] summoned a floor cluwne using the [src]")
			message_admins("[key_name(user)] summoned a floor cluwne using the [src]")
			to_chat(H, "<span class='warning'>The mask suddenly slips off your face and... slides under the floor?</span>")
			to_chat(H, "<i>...dneirf uoy ot gnoleb ton seod tahT</i>")

/obj/item/clothing/shoes/yogs/cluwne
	desc = "The prankster's standard-issue clowning shoes. Damn, they're huge!"
	name = "clown shoes"
	icon_state = "cluwne"
	item_state = "cluwne"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	item_flags = DROPDEL
	slowdown = SHOES_SLOWDOWN+1
	var/footstep = 1
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes/clown

/obj/item/clothing/shoes/yogs/cluwne/Initialize()
	.=..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/shoes/yogs/cluwne/step_action()
	if(footstep > 1)
		playsound(src, "clownstep", 50, 1)
		footstep = 0
	else
		footstep++

/obj/item/clothing/shoes/yogs/cluwne/equipped(mob/user, slot)
	. = ..()
	if(!ishuman(user))
		return
	if(slot == SLOT_SHOES)
		var/mob/living/carbon/human/H = user
		H.dna.add_mutation(CLUWNEMUT)
	return

/obj/item/clothing/under/yogs/cluwne
	name = "clown suit"
	desc = "<i>'HONK!'</i>"
	alternate_screams = list('modular_lumos/sound/voice/cluwnelaugh1.ogg','modular_lumos/sound/voice/cluwnelaugh2.ogg','modular_lumos/sound/voice/cluwnelaugh3.ogg')
	icon_state = "cluwne"
	item_state = "cluwne"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	item_flags = DROPDEL
	can_adjust = 0

/obj/item/clothing/under/yogs/cluwne/Initialize()
	.=..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/under/yogs/cluwne/equipped(mob/living/carbon/user, slot)
	if(!ishuman(user))
		return
	if(slot == SLOT_W_UNIFORM)
		var/mob/living/carbon/human/H = user
		H.dna.add_mutation(CLUWNEMUT)
	return ..()

