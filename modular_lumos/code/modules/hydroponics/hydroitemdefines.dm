/obj/item/scythe
	icon = 'modular_lumos/icons/obj/items_and_weapons.dmi'
	icon_state = "scythe0"
	lefthand_file = 'modular_lumos/icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'modular_lumos/icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "scythe"
	desc = "A flimsy scythe. It has a somewhat dull metal head attached to a weak plastic pole."
	force = 15
	var/bonusdamage = 5 //bonus damage against kudzu
	throwforce = 5
	throw_speed = 2
	throw_range = 3
	w_class = WEIGHT_CLASS_NORMAL
	flags_1 = CONDUCT_1
	armour_penetration = 20
	slot_flags = ITEM_SLOT_BACK
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	hitsound = 'sound/weapons/bladeslice.ogg'

	var/swiping = FALSE
	var/list/scythe_slash_angles = list(0, 45, -45)

/obj/item/scythe/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 90, 105)

/obj/item/scythe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is beheading [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		var/obj/item/bodypart/BP = C.get_bodypart(BODY_ZONE_HEAD)
		if(BP)
			BP.drop_limb()
			playsound(src,pick('sound/misc/desceration-01.ogg','sound/misc/desceration-02.ogg','sound/misc/desceration-01.ogg') ,50, 1, -1)
	return (BRUTELOSS)

/obj/item/scythe/proc/spacevine_check(atom/A)
	if(istype(A, /obj/structure/spacevine))
		return TRUE
	return FALSE

/obj/item/scythe/pre_attack(atom/A, mob/living/user, params)
	if(swiping || !istype(A, /obj/structure/spacevine) || get_turf(A) == get_turf(user) || !istype(A, /mob/living/simple_animal/hostile/venus_human_trap))
		return ..()
	else
		force = force + bonusdamage
		var/turf/user_turf = get_turf(user)
		var/dir_to_target = get_dir(user_turf, get_turf(A))
		var/stam_gain = 0
		swiping = TRUE
		for(var/i in scythe_slash_angles)
			var/turf/T = get_step(user_turf, turn(dir_to_target, i))
			for(var/obj/structure/spacevine/V in T)
				if(user.Adjacent(V))
					melee_attack_chain(user, V)
					stam_gain += 10					//should be hitcost
			for(var/mob/living/simple_animal/hostile/venus_human_trap/V in T)
				if(user.Adjacent(V))
					melee_attack_chain(user, V)
					stam_gain += 10
			stam_gain += 5								//Initial hitcost
			user.adjustStaminaLoss(-stam_gain)
		swiping = FALSE
		force = initial(force)

/obj/item/scythe/super
	name = "super scythe"
	desc = "An advanced scythe that deals moderately well with overgrown spacevines."
	icon_state = "scythe1"
	force = 20
	bonusdamage = 10
	armour_penetration = 30
	scythe_slash_angles = list(0, 45, -45, 90, -90)

/obj/item/scythe/ultra //most of this shit was taken from the transforming weapon item type
	name = "energy scythe"
	desc = "An energy-based scythe that quickly burns through vines."
	var/active = FALSE
	var/hitsound_on = 'sound/weapons/blade1.ogg'
	icon_state = "scythe2"
	var/icon_state_on = "scythe2_on"
	w_class = WEIGHT_CLASS_NORMAL
	var/w_class_on = WEIGHT_CLASS_BULKY
	force = 10 //less force when it's off, cause it's just a beatstick
	var/force_on = 30 //on par with energy sword
	bonusdamage = 0
	var/bonusdamage_on = 15
	throwforce = 15
	var/throwforce_on = 25
	armour_penetration = 15
	var/armour_penetration_on = 30
	var/list/attack_verb_off = list("bashed", "hit", "smashed")
	var/list/attack_verb_on = list("chopped", "sliced", "cut", "reaped")
	scythe_slash_angles = list(0, 45, -45, 90, -90, 135, -135, 180)
	var/total_mass_on
	var/clumsy_check = TRUE

/obj/item/scythe/ultra/Initialize()
	. = ..()
	if(active)
		if(attack_verb_on.len)
			attack_verb = attack_verb_on
	else
		if(attack_verb_off.len)
			attack_verb = attack_verb_off
		//skyrat edit
		if(embedding)
			updateEmbedding()
		//

/obj/item/scythe/ultra/attack_self(mob/living/carbon/user)
	if(transform_weapon(user))
		clumsy_transform_effect(user)

/obj/item/scythe/ultra/proc/transform_weapon(mob/living/user, supress_message_text)
	active = !active
	if(active)
		force = force_on
		total_mass = total_mass_on
		throwforce = throwforce_on
		hitsound = hitsound_on
		throw_speed = 4
		armour_penetration = armour_penetration_on
		if(attack_verb_on.len)
			attack_verb = attack_verb_on
		if(embedding)
			updateEmbedding()
		icon_state = icon_state_on
		w_class = w_class_on
		//skyrat edit
		if(embedding)
			updateEmbedding()
		//
		bonusdamage = bonusdamage_on
	else
		force = initial(force)
		throwforce = initial(throwforce)
		hitsound = initial(hitsound)
		throw_speed = initial(throw_speed)
		armour_penetration = initial(armour_penetration)
		if(attack_verb_off.len)
			attack_verb = attack_verb_off
		if(embedding)
			updateEmbedding()
		icon_state = initial(icon_state)
		w_class = initial(w_class)
		total_mass = initial(total_mass)
		//skyrat edit
		if(embedding)
			disableEmbedding()
		//
		bonusdamage = initial(bonusdamage)
	transform_messages(user, supress_message_text)
	add_fingerprint(user)
	return TRUE

/obj/item/scythe/ultra/proc/transform_messages(mob/living/user, supress_message_text)
	playsound(user, active ? 'sound/weapons/saberon.ogg' : 'sound/weapons/saberoff.ogg', 35, 1)  //changed it from 50% volume to 35% because deafness
	if(!supress_message_text)
		to_chat(user, "<span class='notice'>[src] [active ? "is now active":"is now off"].</span>")

/obj/item/scythe/ultra/proc/clumsy_transform_effect(mob/living/user)
	if(clumsy_check && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		to_chat(user, "<span class='warning'>You accidentally cut yourself with [src], like a doofus!</span>")
		user.take_bodypart_damage(5,5)