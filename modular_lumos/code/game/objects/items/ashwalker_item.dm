/obj/item/ashwalker
	name = "ashwalker parent item"
	desc = "you shouldn't see this"
	
/obj/item/ashwalker/priest_staff
	name = "blessed staff"
	desc = "A staff revered by Ashwalkers, its purpose unknown."
	ashwalker_desc = "A relic of our people, incantations carved upon it reveal the stave can bestow blessings."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "asclepius_dormant"

/obj/item/ashwalker/priest_staff/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return
	if(!istype(target, /mob/living/carbon/human))
		to_chat(user, "<span class='warning'>The rod pulses, perhaps your target is not humanoid enough.</span>")
		return
	if(!istype(user, /mob/living/carbon/human))
		to_chat(user, "<span class='warning'>The rod pulses, perhaps you are not humanoid enough.</span>")
		return
	var/mob/living/carbon/human/userHuman = user
	if(!isashwalker(user))
		to_chat(user, "<span class='warning'>The rod glows red, burning you for attempting to use it.</span>")
		userHuman.adjustFireLoss(10)
		return
	if(target == user)
		to_chat(user, "<span class='warning'>The rod pulses, you cannot target yourself.</span>")
		return
	var/choice = input(user, "Which Blessing?") as null|anything in list("Tongue", "Lung", "Species")
	if(!choice)
		return
	switch(choice)
		if("Tongue")
			ritualistic_process(user, target, "speak our tongue", 1)
		if("Lung")
			ritualistic_process(user, target, "breathe our air", 2)
		if("Species")
			ritualistic_process(user, target, "use our tendril", 3)

/obj/item/ashwalker/priest_staff/proc/ritualistic_chat(mob/user, mob/target, caseby = null, ritual_chat = null)
	if(!user || !target || !caseby)
		return
	switch(caseby)
		if(1)
			to_chat(target, "<span class='warning'>You feel a foreign power start to warm your body... If you don't move, you feel a change will happen.</span>")
			to_chat(user, "<span class='warning'>You begin the ritual to bless them as one who can [ritual_chat].</span>")
		if(2)
			to_chat(target, "<span class='warning'>The power starts to consolidate!</span>")
			to_chat(user, "<span class='warning'>The power starts to consolidate!</span>")
		if(3)
			to_chat(target, "<span class='warning'>The ritual is completed.</span>")
			to_chat(user, "<span class='warning'>The ritual is completed.</span>")
		if(4)
			to_chat(target, "<span class='warning'>The ritual is interrupted.</span>")
			to_chat(user, "<span class='warning'>The ritual is interrupted.</span>")

/obj/item/ashwalker/priest_staff/proc/ritualistic_process(mob/user, mob/target, ritual_chat = null, blessingby = null)
	if(!user || !target || !ritual_chat || !blessingby)
		return
	ritualistic_chat(user, target, 1, ritual_chat)
	if(!do_after(user, 10 SECONDS, target = src))
		ritualistic_chat(user, target, 4)
		return
	ritualistic_chat(user, target, 2)
	if(!do_after(user, 10 SECONDS, target = src))
		ritualistic_chat(user, target, 4)
		return
	ritualistic_chat(user, target, 3)
	switch(blessingby)
		if(1)
			if(istype(target, /mob/living/carbon/human))
				var/mob/living/carbon/human/targetHuman = target
				targetHuman.grant_language(/datum/language/draconic)
		if(2)
			if(istype(target, /mob/living/carbon/human))
				var/mob/living/carbon/human/targetHuman = target
				var/obj/item/organ/organ = new /obj/item/organ/lungs/ashwalker
				organ.Insert(targetHuman)
		if(3)
			if(istype(target, /mob/living/carbon/human))
				var/mob/living/carbon/human/targetHuman = target
				targetHuman.set_species(/datum/species/lizard/ashwalker)

/obj/mecha/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/ashwalker/priest_staff))
		if(!do_after(user, 2 SECONDS, target = src))
			return
		qdel(src)
