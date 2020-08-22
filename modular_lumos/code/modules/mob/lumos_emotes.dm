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
