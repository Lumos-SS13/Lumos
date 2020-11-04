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
		'modular_lumos/sound/effects/fart4.mp3' = 10)), 50, FALSE)
    var/brap = rand(1,5)
    user.atmos_spawn_air("miasma=[brap];TEMP=310.15")
