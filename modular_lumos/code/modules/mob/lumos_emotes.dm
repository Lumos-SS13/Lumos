// New and improved with stolen anti-spam and muzzle checks
/datum/emote/living/buzz
	key = "buzz"
	key_third_person = "buzzes"
	message = "buzzes."
	message_param = "buzzes at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/buzz/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'sound/machines/buzz-sigh.ogg', 50, 1, -1)

/datum/emote/living/buzz2
	key = "buzz2"
	message = "buzzes twice."
	message_param = "buzzes aggressively at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/buzz2/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'sound/machines/buzz-two.ogg', 50, 1, -1)

/datum/emote/living/chime
	key = "chime"
	key_third_person = "chimes"
	message = "chimes."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/chime/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'sound/machines/chime.ogg', 50, 1, -1)

/datum/emote/living/ping
	key = "ping"
	key_third_person = "pings"
	message = "pings."
	message_param = "pings at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/ping/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'sound/machines/ping.ogg', 50, 1, -1)

/datum/emote/living/fart //I'm so sorry Coldud, this must be done.
    key = "fart"
    key_third_person = "farts"
    message = "farts."
    message_param = "farts at %t."
    emote_type = EMOTE_AUDIBLE
    muzzle_ignore = TRUE
    restraint_check = FALSE
    mob_type_allowed_typecache = /mob/living/carbon/human

/datum/emote/living/fart/run_emote(mob/living/user, params)
    if(!(. = ..()))
        return
    user.adjust_nutrition(rand(-10, -2))

    if(user.nextsoundemote >= world.time)
        return

    user.nextsoundemote = world.time + 20
    playsound(user, pickweight(list(
		'modular_lumos/sound/effects/fart.ogg' = 50, 
		'modular_lumos/sound/effects/fart2.ogg' = 30,
		'modular_lumos/sound/effects/fart3.ogg' = 5,
		'modular_lumos/sound/effects/fart4.ogg' = 10)), 50, FALSE)
		
/datum/emote/living/chitter
	key = "chitter"
	key_third_person = "chitters"
	message = "chitters."
	message_param = "chitters at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/chitter/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_lumos/sound/effects/chitter.ogg', 50, 1, -1)

/datum/emote/living/preen
	key = "preen"
	key_third_person = "preens"
	message = "preens themselves."
	message_param = "preens at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/caw
	key = "caw"
	key_third_person = "caws"
	message = "caws."
	message_param = "caws at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/caw/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_lumos/sound/effects/caw.ogg', 50, 1, -1)

/datum/emote/living/engilaugh
	key = "engilaugh"
	key_third_person = "engilaughs"
	message = "laughs like a texan."
	message_param = "laughs at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/engilaugh/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_lumos/sound/effects/engilaugh.ogg', 50, 1, -1)

/datum/emote/living/demolaugh
	key = "demolaugh"
	key_third_person = "demolaughs"
	message = "breaks down laughing."
	message_param = "laughs at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/demolaugh/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_lumos/sound/effects/demolaugh.ogg', 50, 1, -1)

/datum/emote/living/heavylaugh
	key = "heavylaugh"
	key_third_person = "heavylaughs"
	message = "laughs boisterously."
	message_param = "laughs at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/caw/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_lumos/sound/effects/heavylaugh.ogg', 50, 1, -1)

/datum/emote/living/soldierlaugh
	key = "soldierlaugh"
	key_third_person = "soldierlaughs"
	message = "breaks down wheezing."
	message_param = "wheezes at %t."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = FALSE
	mob_type_allowed_typecache = list(/mob/living/brain, /mob/living/silicon, /mob/living/carbon/human)

/datum/emote/living/soldierlaugh/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'modular_lumos/sound/effects/soldierlaugh.ogg', 50, 1, -1)
