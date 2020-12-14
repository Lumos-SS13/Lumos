/obj/item/forging/hot_metal
	name = "hot metal"
	desc = "This is metal that has become very hot."
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	icon_state = "heated_metal"
	resistance_flags = FIRE_PROOF

/obj/item/forging/hot_metal/attack_hand(mob/user)
	if(!user)
		return
	var/mob/living/carbon/C = user
	var/can_handle_hot = FALSE
	if(!istype(C))
		can_handle_hot = TRUE
	else if(C.gloves && (C.gloves.max_heat_protection_temperature > 360))
		can_handle_hot = TRUE
	else if(HAS_TRAIT(C, TRAIT_RESISTHEAT) || HAS_TRAIT(C, TRAIT_RESISTHEATHANDS))
		can_handle_hot = TRUE
	if(!can_handle_hot)
		to_chat(user, "<span class='warning'>The metal is too hot to touch! Forge it into an item.</span>")
		return
	else
		return ..()

/obj/item/forging/hot_metal/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/forging/hammer))
		var/choice = input(user, "What would you like to craft") as null|anything in list("Sword", "Staff", "Baton", "Bokken", "Chain-link")
		if(!choice)
			return
		switch(choice)
			if("Sword")
				var/obj/item/forging/construct/sword/sword = new /obj/item/forging/construct/sword(get_turf(src))
				sword.on_fire = TRUE
				addtimer(CALLBACK(sword, /obj/item/forging/construct.proc/remove_flames), 50 SECONDS)
			if("Staff")
				var/obj/item/forging/construct/sword/sword = new /obj/item/forging/construct/staff(get_turf(src))
				sword.on_fire = TRUE
				addtimer(CALLBACK(sword, /obj/item/forging/construct.proc/remove_flames), 50 SECONDS)
			if("Baton")
				var/obj/item/forging/construct/baton/baton = new /obj/item/forging/construct/baton(get_turf(src))
				baton.on_fire = TRUE
				addtimer(CALLBACK(baton, /obj/item/forging/construct.proc/remove_flames), 50 SECONDS)
			if("Bokken")
				var/obj/item/forging/construct/bokken/bokken = new /obj/item/forging/construct/bokken(get_turf(src))
				bokken.on_fire = TRUE
				addtimer(CALLBACK(bokken, /obj/item/forging/construct.proc/remove_flames), 50 SECONDS)
			if("Chain-link")
				var/obj/item/forging/construct/chainlink/chainlink = new /obj/item/forging/construct/chainlink(get_turf(src))
				chainlink.on_fire = TRUE
				addtimer(CALLBACK(chainlink, /obj/item/forging/construct.proc/remove_flames), 50 SECONDS)
		qdel(src)

/obj/item/forging/construct
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	resistance_flags = FIRE_PROOF
	//0 is the default. The more mistakes, the less damage it does. I wonder if its possible to get negative mistakes... (yes it is)
	var/mistakes = 0
	//this is the amount of times it is required to be hammered
	var/required_hammered = 50
	//this is the current amount of times it has been hammered
	var/hammered = 0

	var/randomized_hammer = TRUE

	var/on_fire = FALSE
	var/brittle = FALSE
	var/finished_product

/obj/item/forging/construct/Initialize()
	. = ..()
	if(randomized_hammer)
		required_hammered += rand(-25,25)
	
/obj/item/forging/construct/attack_hand(mob/user)
	if(!user)
		return
	var/mob/living/carbon/C = user
	var/can_handle_hot = FALSE
	if(!istype(C))
		can_handle_hot = TRUE
	else if(C.gloves && (C.gloves.max_heat_protection_temperature > 360))
		can_handle_hot = TRUE
	else if(HAS_TRAIT(C, TRAIT_RESISTHEAT) || HAS_TRAIT(C, TRAIT_RESISTHEATHANDS))
		can_handle_hot = TRUE
	if(!can_handle_hot)
		to_chat(user, "<span class='warning'>The metal is too hot to touch! Forge it into an item.</span>")
		return
	else
		return ..()

/obj/item/forging/construct/proc/remove_flames()
	on_fire = FALSE

/obj/item/forging/construct/sword
	name = "hot sword object"
	icon_state = "blade"
	desc = "A hot metal mass that resembles a sword"
	finished_product = /obj/item/forging/unfinished/sword

/obj/item/forging/construct/staff
	name = "hot staff object"
	icon_state = "staff"
	desc = "A hot metal mass that resembles a staff"
	finished_product = /obj/item/forging/unfinished/staff

/obj/item/forging/construct/baton
	name = "hot baton object"
	icon_state = "telebaton"
	desc = "A hot metal mass that resembles a baton"
	finished_product = /obj/item/forging/unfinished/baton

/obj/item/forging/construct/bokken
	name = "hot bokken object"
	icon_state = "bokken"
	desc = "A hot metal mass that resembles a bokken"
	finished_product = /obj/item/forging/unfinished/bokken

/obj/item/forging/construct/chainlink
	name = "hot chain-link object"
	icon_state = "hot_chain"
	desc = "A hot metal mass that resembles a chain-link"
	finished_product = /obj/item/forging/unfinished/chainlink
	required_hammered = 10
	randomized_hammer = FALSE

/obj/item/forging/unfinished
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	var/finished_product
	var/starting_force

/obj/item/forging/unfinished/proc/create_force(num = 0)
	force = starting_force
	var/subtracting_force = num * 2
	force -= subtracting_force
	force = max(force, 0)
	
/obj/item/forging/unfinished/sword
	name = "unfinished sword"
	icon_state = "blade"
	finished_product = /obj/item/forging/finished/sword
	force = 10
	starting_force = 10

/obj/item/forging/unfinished/staff
	name = "unfinished staff"
	icon_state = "staff"
	finished_product = /obj/item/forging/finished/staff
	force = 0
	starting_force = 0

/obj/item/forging/unfinished/baton
	name = "unfinished baton"
	icon_state = "telebaton"
	finished_product = /obj/item/forging/finished/baton
	force = 5
	starting_force = 5

/obj/item/forging/unfinished/bokken
	name = "unfinished bokken"
	icon_state = "bokken"
	finished_product = /obj/item/forging/finished/bokken
	force = 5
	starting_force = 5

/obj/item/forging/unfinished/chainlink
	name = "chain"
	desc = "A single chain, link it with others to make things."
	icon_state = "chain"

/obj/item/forging/finished
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	//this is the reagent that the hell forge can add to the weapon
	var/imbued_reagent

/obj/item/forging/finished/Initialize()
	. = ..()
	create_reagents(1000, NO_REACT)

/obj/item/forging/finished/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/reagent_containers))
		if(imbued_reagent)
			return
		var/obj/item/reagent_containers/chosen_container = I
		chosen_container.reagents.trans_to(src, 1000)
	else
		return ..()

/obj/item/forging/finished/pre_attack(atom/A, mob/living/user, params)
	. = ..()
	if(iscarbon(A))
		var/mob/living/carbon/C = A
		if(imbued_reagent)
			C.reagents.add_reagent(imbued_reagent, 1)
	user.adjustStaminaLoss(-10)

/obj/item/forging/finished/sword
	name = "sword"
	icon_state = "blade_finished"
	sharpness = SHARP_EDGED
	force = 10
	item_state = "sabre"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'

/obj/item/forging/finished/staff
	name = "staff"
	icon_state = "staff_finished"
	item_state = "godstaff-blue"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'

/obj/item/forging/finished/baton
	name = "baton"
	icon_state = "telebaton_finished"
	item_state = "nullrod"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	var/stun_stam_cost_coeff = 1.25
	var/hardstun_ds = TRUE
	var/softstun_ds = 0
	var/stam_dmg = 30
	var/cooldown_check = 0 // Used internally, you don't want to modify
	var/cooldown = 13 // Default wait time until can stun again.
	var/stun_time_silicon = 60 // How long it stuns silicons for - 6 seconds.
	var/affect_silicon = FALSE // Does it stun silicons.
	var/on_stun_sound = "sound/effects/woodhit.ogg" // Default path to sound for when we stun.
	var/stun_animation = TRUE // Do we animate the "hit" when stunning.

// Description for trying to stun when still on cooldown.
/obj/item/forging/finished/baton/proc/get_wait_description()
	return

// Description for when turning their baton "on"
/obj/item/forging/finished/baton/proc/get_on_description()
	. = list()
	.["local_on"] = "<span class ='warning'>You extend the baton.</span>"
	.["local_off"] = "<span class ='notice'>You collapse the baton.</span>"
	return .

// Default message for stunning mob.
/obj/item/forging/finished/baton/proc/get_stun_description(mob/living/target, mob/living/user)
	. = list()
	.["visible"] =  "<span class ='danger'>[user] has knocked down [target] with [src]!</span>"
	.["local"] = "<span class ='danger'>[user] has knocked down [target] with [src]!</span>"
	return .

// Default message for stunning a silicon.
/obj/item/forging/finished/baton/proc/get_silicon_stun_description(mob/living/target, mob/living/user)
	. = list()
	.["visible"] = "<span class='danger'>[user] pulses [target]'s sensors with the baton!</span>"
	.["local"] = "<span class='danger'>You pulse [target]'s sensors with the baton!</span>"
	return .

// Are we applying any special effects when we stun to carbon
/obj/item/forging/finished/baton/proc/additional_effects_carbon(mob/living/target, mob/living/user)
	return

// Are we applying any special effects when we stun to silicon
/obj/item/forging/finished/baton/proc/additional_effects_silicon(mob/living/target, mob/living/user)
	return

/obj/item/forging/finished/baton/proc/check_martial_counter(mob/living/carbon/human/target, mob/living/carbon/human/user)
	if(target.check_martial_melee_block())
		target.visible_message("<span class='danger'>[target.name] blocks [src] and twists [user]'s arm behind [user.p_their()] back!</span>",
					"<span class='userdanger'>You block the attack!</span>")
		user.Stun(40)
		return TRUE

/obj/item/forging/finished/baton/attack(mob/living/target, mob/living/user)
	if(IS_STAMCRIT(user))//CIT CHANGE - makes batons unusuable in stamina softcrit
		to_chat(user, "<span class='warning'>You're too exhausted for that.</span>")//CIT CHANGE - ditto
		return //CIT CHANGE - ditto

	add_fingerprint(user)
	if((HAS_TRAIT(user, TRAIT_CLUMSY)) && prob(50))
		to_chat(user, "<span class ='danger'>You club yourself over the head.</span>")
		user.DefaultCombatKnockdown(60 * force)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.apply_damage(2*force, BRUTE, BODY_ZONE_HEAD)
		else
			user.take_bodypart_damage(2*force)
		return
	if(iscyborg(target))
		return
	if(!isliving(target))
		return
	if(user.a_intent == INTENT_HARM)
		if(!..() || !iscyborg(target))
			return
	else
		if(cooldown_check < world.time)
			if(target.mob_run_block(src, 0, "[user]'s [name]", ATTACK_TYPE_MELEE, 0, user, null, null) & BLOCK_SUCCESS)
				playsound(target, 'sound/weapons/genhit.ogg', 50, 1)
				return
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				if(check_martial_counter(H, user))
					return
			var/list/desc = get_stun_description(target, user)
			if(stun_animation)
				user.do_attack_animation(target)
			playsound(get_turf(src), on_stun_sound, 75, 1, -1)
			target.DefaultCombatKnockdown(softstun_ds, TRUE, FALSE, hardstun_ds, stam_dmg)
			additional_effects_carbon(target, user)
			log_combat(user, target, "stunned", src)
			add_fingerprint(user)
			target.visible_message(desc["visible"], desc["local"])
			if(!iscarbon(user))
				target.LAssailant = null
			else
				target.LAssailant = WEAKREF(user)
			cooldown_check = world.time + cooldown
			user.adjustStaminaLossBuffered(getweight(user, STAM_COST_BATON_MOB_MULT))
		else
			var/wait_desc = get_wait_description()
			if(wait_desc)
				to_chat(user, wait_desc)

/obj/item/forging/finished/bokken
	name = "bokken"
	icon_state = "bokken_finished"
	item_state = "bokken"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	item_flags = ITEM_CAN_PARRY
	block_parry_data = /datum/block_parry_data/bokken

/obj/item/clothing
	var/imbued_reagent
	var/imbueable = FALSE

/obj/item/clothing/suit/armor/forging
	name = "chainmail armor"
	desc = "When they come together, chains are quite strong."
	icon = 'modular_lumos/icons/obj/clothing/suits.dmi'
	icon_state = "chainarmor"
	mob_overlay_icon = 'modular_lumos/icons/mob/clothing/suit.dmi'
	item_state = "chainarmor"
	armor = list("melee" = 40, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 10)
	imbueable = TRUE
	resistance_flags = FIRE_PROOF
	mutantrace_variation = STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/armor/forging/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate, 20, /obj/item/stack/sheet/animalhide/goliath_hide, list("melee" = 2, "wound" = 2))
	create_reagents(1000, NO_REACT)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/armor/forging/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/clothing/suit/armor/forging/process()
	if(!imbued_reagent)
		return
	if(istype(loc, /mob/living/carbon))
		var/mob/living/carbon/C = loc
		for(var/datum/reagent/in_reagent in C.reagents.reagent_list)
			if(istype(in_reagent, imbued_reagent))
				if((in_reagent.volume + 5) >= in_reagent.overdose_threshold)
					return
		C.reagents.add_reagent(imbued_reagent, 1)

/obj/item/clothing/suit/armor/forging/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers))
		if(imbued_reagent)
			return
		var/obj/item/reagent_containers/chosen_container = I
		chosen_container.reagents.trans_to(src, 1000)
	else
		return ..()

/obj/item/clothing/gloves/forging
	name = "chainmail gloves"
	desc = "When they come together, chains are quite strong."
	icon = 'modular_lumos/icons/obj/clothing/gloves.dmi'
	icon_state = "chainglove"
	mob_overlay_icon = 'modular_lumos/icons/mob/clothing/hands.dmi'
	item_state = "chainglove"
	transfer_prints = TRUE
	strip_delay = 40
	equip_delay_other = 20
	body_parts_covered = ARMS
	cold_protection = ARMS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	armor = list("melee" = 15, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 10)
	imbueable = TRUE

/obj/item/clothing/gloves/forging/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate, 5, /obj/item/stack/sheet/animalhide/goliath_hide, list("melee" = 3, "wound" = 2))
	create_reagents(1000, NO_REACT)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/gloves/forging/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/clothing/gloves/forging/process()
	if(!imbued_reagent)
		return
	if(istype(loc, /mob/living/carbon))
		var/mob/living/carbon/C = loc
		for(var/datum/reagent/in_reagent in C.reagents.reagent_list)
			if(istype(in_reagent, imbued_reagent))
				if((in_reagent.volume + 5) >= in_reagent.overdose_threshold)
					return
		C.reagents.add_reagent(imbued_reagent, 1)

/obj/item/clothing/gloves/forging/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers))
		if(imbued_reagent)
			return
		var/obj/item/reagent_containers/chosen_container = I
		chosen_container.reagents.trans_to(src, 1000)
	else
		return ..()

/obj/item/clothing/head/helmet/forging
	name = "chainmail helmet"
	desc = "When they come together, chains are quite strong."
	flags_inv = HIDEEARS|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	armor = list("melee" = 30, "bullet" = 15, "laser" = 0, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 10)
	resistance_flags = FIRE_PROOF
	icon = 'modular_lumos/icons/obj/clothing/head.dmi'
	icon_state = "chainhelmet"
	mob_overlay_icon = 'modular_lumos/icons/mob/clothing/head.dmi'
	item_state = "chainhelmet"
	strip_delay = 100
	dog_fashion = null
	imbueable = TRUE

/obj/item/clothing/head/helmet/forging/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate, 5, /obj/item/stack/sheet/animalhide/goliath_hide, list("melee" = 3, "wound" = 2))
	create_reagents(1000, NO_REACT)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/forging/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/clothing/head/helmet/forging/process()
	if(!imbued_reagent)
		return
	if(istype(loc, /mob/living/carbon))
		var/mob/living/carbon/C = loc
		for(var/datum/reagent/in_reagent in C.reagents.reagent_list)
			if(istype(in_reagent, imbued_reagent))
				if((in_reagent.volume + 5) >= in_reagent.overdose_threshold)
					return
		C.reagents.add_reagent(imbued_reagent, 1)

/obj/item/clothing/head/helmet/forging/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers))
		if(imbued_reagent)
			return
		var/obj/item/reagent_containers/chosen_container = I
		chosen_container.reagents.trans_to(src, 1000)
	else
		return ..()

/obj/item/clothing/wrists/forging
	name = "chainlink bracelet"
	desc = "a bracelet made out of multiple chains"
	icon = 'modular_lumos/icons/obj/clothing/wrist.dmi'
	icon_state = "chain_bracelet"
	resistance_flags = FIRE_PROOF
	imbueable = TRUE

/obj/item/clothing/wrists/forging/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate, 5, /obj/item/stack/sheet/animalhide/goliath_hide, list("melee" = 3, "wound" = 2))
	create_reagents(1000, NO_REACT)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/wrists/forging/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()
	
/obj/item/clothing/wrists/forging/process()
	if(!imbued_reagent)
		return
	if(istype(loc, /mob/living/carbon))
		var/mob/living/carbon/C = loc
		for(var/datum/reagent/in_reagent in C.reagents.reagent_list)
			if(istype(in_reagent, imbued_reagent))
				if((in_reagent.volume + 5) >= in_reagent.overdose_threshold)
					return
		C.reagents.add_reagent(imbued_reagent, 1)

/obj/item/clothing/wrists/forging/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/reagent_containers))
		if(imbued_reagent)
			return
		var/obj/item/reagent_containers/chosen_container = W
		chosen_container.reagents.trans_to(src, 1000)
	else
		return ..()

/obj/item/stack/sheet/bone_dust
	name = "bone dust"
	desc = "Bones that have been pulverized into dust. Useful for certain constructions."
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	icon_state = "bone_powder"

/obj/item/stack/sheet/bone_dust/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/stack/ore/glass))
		var/turf/usr_turf = get_turf(user)
		var/obj/item/stack/ore/glass/usedGlass = W
		if(!usedGlass.use(1))
			return
		if(!use(1))
			return
		new /obj/item/stack/sheet/bone_sand_mix(usr_turf)

/obj/item/stack/ore/glass/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/stack/sheet/bone_dust))
		var/turf/usr_turf = get_turf(user)
		var/obj/item/stack/sheet/bone_dust/usedBone = W
		if(!usedBone.use(1))
			return
		if(!use(1))
			return
		new /obj/item/stack/sheet/bone_sand_mix(usr_turf)

/obj/item/stack/sheet/bone/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/forging/hammer))
		if(!use(1))
			return
		new /obj/item/stack/sheet/bone_dust(get_turf(user))

/obj/item/stack/sheet/bone_sand_mix
	name = "sand-bone mix"
	desc = "Just dip it in some water and watch it become stronger!"
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	icon_state = "bone_sand_mix"

/obj/item/stack/sheet/bone_sand_mix/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(istype(target, /turf/open/water))
		if(!use(1))
			return
		new /obj/item/stack/sheet/ceramic_brick(get_turf(user))

/obj/item/stack/sheet/ceramic_brick
	name = "ceramic brick"
	desc = "A brick that can be used for creating forges."
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	icon_state = "sheet_bone_sand"

/obj/item/stack/sheet/mineral/wood/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/forging/hammer))
		var/obj/item/forging/chosen_forging
		if(amount < 5)
			return
		var/choice = input(user, "What would you like to make?") as null|anything in list("Hilt", "Orb", "Casing", "Handle")
		if(!choice)
			return
		switch(choice)
			if("Hilt")
				chosen_forging = /obj/item/forging/attachment/hilt
			if("Orb")
				chosen_forging = /obj/item/forging/attachment/orb
			if("Casing")
				chosen_forging = /obj/item/forging/attachment/casing
			if("Handle")
				chosen_forging = /obj/item/forging/attachment/handle
		if(use(5))
			new chosen_forging(get_turf(user))
			to_chat(user, "<span class ='warning'>You are successful in crafting the item...</span>")

/obj/item/forging/attachment
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	var/obj/item/forging/finished/spawnedFinish
	var/obj/item/forging/unfinished/reqUnfinished

/obj/item/forging/attachment/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(istype(target, reqUnfinished))
		var/obj/item/forging/unfinished/unFinished = target
		var/turf/spawnTurf = get_turf(target)
		to_chat(user, "<span class ='warning'>You start attaching the part, you must stand still...</span>")
		if(!do_after(user, 5 SECONDS, target = target))
			to_chat(user, "<span class ='warning'>You move, interrupting the building process...</span>")
			return
		to_chat(user, "<span class ='warning'>Success!</span>")
		var/obj/item/forging/finished/spawningNew = new spawnedFinish(spawnTurf)
		spawningNew.force = unFinished.force
		qdel(target)
		qdel(src)

/obj/item/forging/attachment/hilt
	name = "sword hilt"
	desc = "A hilt for a sword"
	icon_state = "hilt"
	spawnedFinish = /obj/item/forging/finished/sword
	reqUnfinished = /obj/item/forging/unfinished/sword

/obj/item/forging/attachment/orb
	name = "staff orb"
	desc = "An orb for a staff"
	icon_state = "orb"
	spawnedFinish = /obj/item/forging/finished/staff
	reqUnfinished = /obj/item/forging/unfinished/staff

/obj/item/forging/attachment/casing
	name = "baton casing"
	desc = "A casing for a baton"
	icon_state = "telebaton_handle"
	spawnedFinish = /obj/item/forging/finished/baton
	reqUnfinished = /obj/item/forging/unfinished/baton

/obj/item/forging/attachment/handle
	name = "bokken handle"
	desc = "A handle for a bokken"
	icon_state = "bokken_handle"
	spawnedFinish = /obj/item/forging/finished/bokken
	reqUnfinished = /obj/item/forging/unfinished/bokken

/datum/crafting_recipe/sand_bone_mix
	name = "sand-bone mix"
	reqs = 	list(/obj/item/stack/ore/glass = 1,
				 /obj/item/stack/sheet/bone_dust = 1)
	result = /obj/item/stack/sheet/bone_sand_mix
	category = CAT_PRIMAL

/datum/crafting_recipe/forge_spawn
	name = "forge"
	reqs = 	list(/obj/item/stack/sheet/ceramic_brick = 10)
	result = /obj/structure/forge
	category = CAT_PRIMAL

/datum/crafting_recipe/basin_spawn
	name = "water basin"
	reqs = 	list(/obj/item/stack/sheet/mineral/wood = 10)
	result = /obj/structure/water_basin
	category = CAT_PRIMAL

/datum/crafting_recipe/anvil_spawn
	name = "anvil"
	reqs = 	list(/obj/item/stack/sheet/metal = 10)
	result = /obj/structure/forging_anvil
	category = CAT_PRIMAL

/datum/crafting_recipe/chainarmor
	name = "chain armor"
	reqs = 	list(/obj/item/forging/unfinished/chainlink = 5)
	result = /obj/item/clothing/suit/armor/forging
	category = CAT_PRIMAL

/datum/crafting_recipe/chainglove
	name = "chain gloves"
	reqs = 	list(/obj/item/forging/unfinished/chainlink = 5)
	result = /obj/item/clothing/gloves/forging
	category = CAT_PRIMAL

/datum/crafting_recipe/chainhelmet
	name = "chain helmet"
	reqs = 	list(/obj/item/forging/unfinished/chainlink = 5)
	result = /obj/item/clothing/head/helmet/forging
	category = CAT_PRIMAL

/datum/crafting_recipe/chainbracelet
	name = "chain bracelet"
	reqs = 	list(/obj/item/forging/unfinished/chainlink = 2)
	result = /obj/item/clothing/wrists/forging
	category = CAT_PRIMAL
