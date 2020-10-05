/obj/item/scythe
	icon = 'modular_lumos/icons/obj/items_and_weapons.dmi'
	icon_state = "scythe0"
	lefthand_file = 'modular_lumos/icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'modular_lumos/icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "scythe"
	desc = "A flimsy scythe. It has a somewhat dull metal head attached to a weak plastic pole."
	force = 15
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
	if(swiping || !istype(A, /obj/structure/spacevine) || get_turf(A) == get_turf(user))
		return ..()
	else
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
			stam_gain += 5								//Initial hitcost
			user.adjustStaminaLoss(-stam_gain)
		swiping = FALSE

/obj/item/scythe/super
	name = "super scythe"
	desc = "A scythe that deals moderately well with overgrown spacevines."
	icon_state = "scythe1"
	force = 30
	armour_penetration = 30
	scythe_slash_angles = list(0, 45, -45, 90, -90)

/obj/item/scythe/ultra
	name = "ultra scyth"
	desc = "A scythe that boasts the best spacevine prevention."
	icon_state = "scythe2"
	force = 45
	armour_penetration = 40
	scythe_slash_angles = list(0, 45, -45, 90, -90, 135, -135, 180)
