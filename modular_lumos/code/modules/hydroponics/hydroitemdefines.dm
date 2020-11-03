/obj/item/scythe
	icon = 'modular_lumos/icons/obj/items_and_weapons.dmi'
	icon_state = "scythe0"
	lefthand_file = 'modular_lumos/icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'modular_lumos/icons/mob/inhands/weapons/polearms_righthand.dmi'
	name = "scythe"
	desc = "A flimsy scythe. It has a somewhat dull metal head attached to a weak plastic pole."
	force = 5
	throwforce = 5
	throw_speed = 2
	throw_range = 3
	w_class = WEIGHT_CLASS_NORMAL
	flags_1 = CONDUCT_1
	armour_penetration = 0
	slot_flags = ITEM_SLOT_BACK
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	hitsound = 'sound/weapons/bladeslice.ogg'

	sharpness = SHARP_EDGED

	var/kudzu_range = 0

/obj/item/scythe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is beheading [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		var/obj/item/bodypart/BP = C.get_bodypart(BODY_ZONE_HEAD)
		if(BP)
			BP.drop_limb()
			playsound(src,pick('sound/misc/desceration-01.ogg','sound/misc/desceration-02.ogg','sound/misc/desceration-01.ogg') ,50, 1, -1)
	return (BRUTELOSS)

/obj/item/scythe/pre_attack(atom/A, mob/living/user, params)
	if(istype(A, /obj/structure/spacevine))
		qdel(A)
		for(var/obj/structure/spacevine/targetKudzu in range(kudzu_range))
			if(prob(50))
				qdel(targetKudzu)
		return TRUE
	if(isvineimmune(A))
		force = initial(force)
		var/damage_dealing = 2
		if(istype(A, /mob/living/simple_animal/hostile/venus_human_trap))
			damage_dealing = 4
		force *= damage_dealing

/obj/item/scythe/super
	name = "super scythe"
	desc = "A scythe that deals moderately well with overgrown spacevines."
	icon_state = "scythe1"
	force = 10
	armour_penetration = 5

	kudzu_range = 1

/obj/item/scythe/ultra
	name = "ultra scythe"
	desc = "A scythe that boasts the best spacevine prevention."
	icon_state = "scythe2"
	force = 15
	armour_penetration = 10

	kudzu_range = 2

/obj/item/scythe/ultra/legacy
	name = "ultra scyth"
	desc = "Yes yes, it is missing an e."
	icon_state = "scythe2"
	force = 45
	armour_penetration = 40

	kudzu_range = 5
