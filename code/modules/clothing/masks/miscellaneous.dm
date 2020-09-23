/obj/item/clothing/mask/muzzle
	name = "muzzle"
	desc = "To stop that awful noise."
	icon_state = "muzzle"
	item_state = "blindfold"
	flags_cover = MASKCOVERSMOUTH
	w_class = WEIGHT_CLASS_SMALL
	gas_transfer_coefficient = 0.9
	equip_delay_other = 20
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/mask/muzzle/attack_paw(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.wear_mask)
			to_chat(user, "<span class='warning'>You need help taking this off!</span>")
			return
	..()

/obj/item/clothing/mask/surgical
	name = "sterile mask"
	desc = "A sterile mask designed to help prevent the spread of diseases."
	icon_state = "sterile"
	item_state = "sterile"
	w_class = WEIGHT_CLASS_TINY
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH
	visor_flags_inv = HIDEFACE
	visor_flags_cover = MASKCOVERSMOUTH
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.01
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 25, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)
	actions_types = list(/datum/action/item_action/adjust)
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/mask/surgical/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/fakemoustache
	name = "fake moustache"
	desc = "Warning: moustache is fake."
	icon_state = "fake-moustache"
	flags_inv = HIDEFACE
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/mask/fakemoustache/italian
	name = "italian moustache"
	desc = "Made from authentic Italian moustache hairs. Gives the wearer an irresistable urge to gesticulate wildly."
	modifies_speech = TRUE

/obj/item/clothing/mask/fakemoustache/italian/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = " [message]"
		var/list/italian_words = strings("italian_replacement.json", "italian")

		for(var/key in italian_words)
			var/value = italian_words[key]
			if(islist(value))
				value = pick(value)

			message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
			message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
			message = replacetextEx(message, " [key]", " [value]")

		if(prob(3))
			message += pick(" Ravioli, ravioli, give me the formuoli!"," Mamma-mia!"," Mamma-mia! That's a spicy meat-ball!", " La la la la la funiculi funicula!")
	speech_args[SPEECH_MESSAGE] = trim(message)

/obj/item/clothing/mask/joy
	name = "joy mask"
	desc = "Express your happiness or hide your sorrows with this laughing face with crying tears of joy cutout."
	icon_state = "joy"
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/mask/pig
	name = "pig mask"
	desc = "A rubber pig mask with a builtin voice modulator."
	icon_state = "pig"
	item_state = "pig"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	clothing_flags = VOICEBOX_TOGGLABLE
	w_class = WEIGHT_CLASS_SMALL
	modifies_speech = TRUE

/obj/item/clothing/mask/pig/handle_speech(datum/source, list/speech_args)
	if(!CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED))
		speech_args[SPEECH_MESSAGE] = pick("Oink!","Squeeeeeeee!","Oink Oink!")

/obj/item/clothing/mask/pig/cursed //needs to be different otherwise you could turn the speedmodification off and on
	name = "Pig face"
	desc = "It looks like a mask, but closer inspection reveals it's melded onto this persons face!" //It's only ever going to be attached to your face.
	flags_inv = HIDEFACIALHAIR
	clothing_flags = NONE

/obj/item/clothing/mask/pig/cursed/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_MASK_TRAIT)
	playsound(get_turf(src), 'sound/magic/pighead_curse.ogg', 50, 1)

///frog mask - reeee!!
/obj/item/clothing/mask/frog
	name = "frog mask"
	desc = "An ancient mask carved in the shape of a frog.<br> Sanity is like gravity, all it needs is a push."
	icon_state = "frog"
	item_state = "frog"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL
	clothing_flags = VOICEBOX_TOGGLABLE
	modifies_speech = TRUE

/obj/item/clothing/mask/frog/handle_speech(datum/source, list/speech_args) //whenever you speak
	if(!CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED))
		if(prob(5)) //sometimes, the angry spirit finds others words to speak.
			speech_args[SPEECH_MESSAGE] = pick("HUUUUU!!","SMOOOOOKIN'!!","Hello my baby, hello my honey, hello my rag-time gal.", "Feels bad, man.", "GIT DIS GUY OFF ME!!" ,"SOMEBODY STOP ME!!", "NORMIES, GET OUT!!")
		else
			speech_args[SPEECH_MESSAGE] = pick("Ree!!", "Reee!!","REEE!!","REEEEE!!") //but its usually just angry gibberish,

/obj/item/clothing/mask/frog/cursed
	clothing_flags = NONE

/obj/item/clothing/mask/frog/cursed/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_MASK_TRAIT)

/obj/item/clothing/mask/frog/cursed/equipped(mob/user, slot)
	var/mob/living/carbon/C = user
	if(C.wear_mask == src && HAS_TRAIT_FROM(src, TRAIT_NODROP, CURSED_ITEM_TRAIT))
		to_chat(user, "<span class='userdanger'><B>[src] was cursed! Ree!!</B></span>")
	return ..()

/obj/item/clothing/mask/cowmask
	name = "Cow mask with a builtin voice modulator."
	desc = "A rubber cow mask,"
	icon_state = "cowmask"
	item_state = "cowmask"
	clothing_flags = VOICEBOX_TOGGLABLE
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL
	modifies_speech = TRUE

/obj/item/clothing/mask/cowmask/handle_speech(datum/source, list/speech_args)
	if(!CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED))
		speech_args[SPEECH_MESSAGE] = pick("Moooooooo!","Moo!","Moooo!")


/obj/item/clothing/mask/cowmask/cursed
	name = "cow face"
	desc = "It looks like a cow mask, but closer inspection reveals it's melded onto this persons face!"
	flags_inv = HIDEFACIALHAIR
	clothing_flags = NONE

/obj/item/clothing/mask/cowmask/cursed/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_MASK_TRAIT)
	playsound(get_turf(src), 'sound/magic/cowhead_curse.ogg', 50, 1)

/obj/item/clothing/mask/horsehead
	name = "horse head mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a horse."
	icon_state = "horsehead"
	item_state = "horsehead"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEEYES|HIDEEARS
	w_class = WEIGHT_CLASS_SMALL
	clothing_flags = VOICEBOX_TOGGLABLE

/obj/item/clothing/mask/horsehead/handle_speech(datum/source, list/speech_args)
	if(!CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED))
		speech_args[SPEECH_MESSAGE] = pick("NEEIIGGGHHHH!", "NEEEIIIIGHH!", "NEIIIGGHH!", "HAAWWWWW!", "HAAAWWW!")


/obj/item/clothing/mask/horsehead/cursed
	name = "horse face"
	desc = "It initially looks like a mask, but it's melded into the poor person's face."
	clothing_flags = NONE
	flags_inv = HIDEFACIALHAIR

/obj/item/clothing/mask/horsehead/cursed/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_MASK_TRAIT)
	playsound(get_turf(src), 'sound/magic/horsehead_curse.ogg', 50, 1)

/obj/item/clothing/mask/rat
	name = "rat mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a rat."
	icon_state = "rat"
	item_state = "rat"
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH

/obj/item/clothing/mask/rat/fox
	name = "fox mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a fox."
	icon_state = "fox"
	item_state = "fox"

/obj/item/clothing/mask/rat/bee
	name = "bee mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a bee."
	icon_state = "bee"
	item_state = "bee"

/obj/item/clothing/mask/rat/bear
	name = "bear mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a bear."
	icon_state = "bear"
	item_state = "bear"

/obj/item/clothing/mask/rat/bat
	name = "bat mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a bat."
	icon_state = "bat"
	item_state = "bat"

/obj/item/clothing/mask/rat/raven
	name = "raven mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a raven."
	icon_state = "raven"
	item_state = "raven"

/obj/item/clothing/mask/rat/jackal
	name = "jackal mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a jackal."
	icon_state = "jackal"
	item_state = "jackal"

/obj/item/clothing/mask/rat/tribal
	name = "tribal mask"
	desc = "A mask carved out of wood, detailed carefully by hand."
	icon_state = "bumba"
	item_state = "bumba"

/obj/item/clothing/mask/bandana
	name = "botany bandana"
	desc = "A fine bandana with nanotech lining and a hydroponics pattern."
	w_class = WEIGHT_CLASS_TINY
	flags_cover = MASKCOVERSMOUTH
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	visor_flags_cover = MASKCOVERSMOUTH
	slot_flags = ITEM_SLOT_MASK
	adjusted_flags = ITEM_SLOT_HEAD
	icon_state = "bandbotany"
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/mask/bandana/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/bandana/AltClick(mob/user)
	. = ..()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if((C.get_item_by_slot(SLOT_HEAD == src)) || (C.get_item_by_slot(SLOT_WEAR_MASK) == src))
			to_chat(user, "<span class='warning'>You can't tie [src] while wearing it!</span>")
			return
	if(slot_flags & ITEM_SLOT_HEAD)
		to_chat(user, "<span class='warning'>You must undo [src] before you can tie it into a neckerchief!</span>")
	else
		if(user.is_holding(src))
			var/obj/item/clothing/neck/neckerchief/nk = new(src)
			nk.name = "[name] neckerchief"
			nk.desc = "[desc] It's tied up like a neckerchief."
			nk.icon_state = icon_state
			nk.sourceBandanaType = src.type
			var/currentHandIndex = user.get_held_index_of_item(src)
			user.transferItemToLoc(src, null)
			user.put_in_hand(nk, currentHandIndex)
			user.visible_message("<span class='notice'>You tie [src] up like a neckerchief.</span>", "<span class='notice'>[user] ties [src] up like a neckerchief.</span>")
			qdel(src)
		else
			to_chat(user, "<span class='warning'>You must be holding [src] in order to tie it!")

/obj/item/clothing/mask/bandana/red
	name = "red bandana"
	desc = "A fine red bandana with nanotech lining."
	icon_state = "bandred"

/obj/item/clothing/mask/bandana/blue
	name = "blue bandana"
	desc = "A fine blue bandana with nanotech lining."
	icon_state = "bandblue"

/obj/item/clothing/mask/bandana/green
	name = "green bandana"
	desc = "A fine green bandana with nanotech lining."
	icon_state = "bandgreen"

/obj/item/clothing/mask/bandana/gold
	name = "gold bandana"
	desc = "A fine gold bandana with nanotech lining."
	icon_state = "bandgold"

/obj/item/clothing/mask/bandana/black
	name = "black bandana"
	desc = "A fine black bandana with nanotech lining."
	icon_state = "bandblack"

/obj/item/clothing/mask/bandana/skull
	name = "skull bandana"
	desc = "A fine black bandana with nanotech lining and a skull emblem."
	icon_state = "bandskull"

/obj/item/clothing/mask/mummy
	name = "mummy mask"
	desc = "Ancient bandages."
	icon_state = "mummy_mask"
	item_state = "mummy_mask"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/mask/scarecrow
	name = "sack mask"
	desc = "A burlap sack with eyeholes."
	icon_state = "scarecrow_sack"
	item_state = "scarecrow_sack"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/mask/gondola
	name = "gondola mask"
	desc = "Genuine gondola fur."
	icon_state = "gondola"
	item_state = "gondola"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_SMALL
	modifies_speech = TRUE

/obj/item/clothing/mask/gondola/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		message = " [message]"
		var/list/spurdo_words = strings("spurdo_replacement.json", "spurdo")
		for(var/key in spurdo_words)
			var/value = spurdo_words[key]
			if(islist(value))
				value = pick(value)
			message = replacetextEx(message,regex(uppertext(key),"g"), "[uppertext(value)]")
			message = replacetextEx(message,regex(capitalize(key),"g"), "[capitalize(value)]")
			message = replacetextEx(message,regex(key,"g"), "[value]")
	speech_args[SPEECH_MESSAGE] = trim(message)

/obj/item/clothing/mask/bandana/durathread
	name = "durathread bandana"
	desc =  "A bandana made from durathread, you wish it would provide some protection to its wearer, but it's far too thin..."
	icon_state = "banddurathread"

/obj/item/clothing/mask/paper
	name = "paper mask"
	desc = "A neat, circular mask made out of paper."
	icon_state = "plainmask"
	item_state = "plainmask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	resistance_flags = FLAMMABLE
	max_integrity = 100
	actions_types = list(/datum/action/item_action/adjust)
	var/list/papermask_designs = list()


/obj/item/clothing/mask/paper/Initialize(mapload)
	.=..()
	papermask_designs = list(
		"Blank" = image(icon = src.icon, icon_state = "plainmask"),
		"Neutral" = image(icon = src.icon, icon_state = "neutralmask"),
		"Eyes" = image(icon = src.icon, icon_state = "eyemask"),
		"Sleeping" = image(icon = src.icon, icon_state = "sleepingmask"),
		"Heart" = image(icon = src.icon, icon_state = "heartmask"),
		"Core" = image(icon = src.icon, icon_state = "coremask"),
		"Plus" = image(icon = src.icon, icon_state = "plusmask"),
		"Square" = image(icon = src.icon, icon_state = "squaremask"),
		"Bullseye" = image(icon = src.icon, icon_state = "bullseyemask"),
		"Vertical" = image(icon = src.icon, icon_state = "verticalmask"),
		"Horizontal" = image(icon = src.icon, icon_state = "horizontalmask"),
		"X" = image(icon = src.icon, icon_state = "xmask"),
		"Bugeyes" = image(icon = src.icon, icon_state = "bugmask"),
		"Double" = image(icon = src.icon, icon_state = "doublemask"),
		"Mark" = image(icon = src.icon, icon_state = "markmask")
		)

/obj/item/clothing/mask/paper/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return

	var/static/list/options = list("Blank" = "plainmask", "Neutral" = "neutralmask", "Eyes" = "eyemask",
							"Sleeping" ="sleepingmask", "Heart" = "heartmask", "Core" = "coremask",
							"Plus" = "plusmask", "Square" ="squaremask", "Bullseye" = "bullseyemask",
							"Vertical" = "verticalmask", "Horizontal" = "horizontalmask", "X" ="xmask",
							"Bugeyes" = "bugmask", "Double" = "doublemask", "Mark" = "markmask")

	var/choice = show_radial_menu(user,src, papermask_designs, custom_check = FALSE, radius = 36, require_near = TRUE)

	if(src && choice && !user.incapacitated() && in_range(user,src))
		icon_state = options[choice]
		user.update_inv_wear_mask()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		to_chat(user, "<span class='notice'>Your paper mask now has a [choice] symbol!</span>")
		return 1

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
