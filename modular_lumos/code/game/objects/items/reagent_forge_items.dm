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
		var/choice = input(user, "What would you like to craft") as null|anything in list("Sword", "Staff")
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

	var/on_fire = FALSE
	var/brittle = FALSE
	var/finished_product

/obj/item/forging/construct/Initialize()
	. = ..()
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
	desc = "A hot metal mass that resembles a sword"
	finished_product = /obj/item/forging/unfinished/staff

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
	starting_force = 10

/obj/item/forging/unfinished/sword/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/forging/handle))
		if(!do_after(user, 10 SECONDS, target = src))
			return
		qdel(I)
		qdel(src)
		new /obj/item/forging/finished/sword(get_turf(src))

/obj/item/forging/unfinished/staff
	name = "unfinished staff"
	icon_state = "staff"
	finished_product = /obj/item/forging/finished/staff
	starting_force = 0

/obj/item/forging/unfinished/staff/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/forging/orb))
		if(!do_after(user, 10 SECONDS, target = src))
			return
		qdel(I)
		qdel(src)
		new /obj/item/forging/finished/staff(get_turf(src))

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

/obj/item/forging/finished/sword
	name = "sword"
	icon_state = "blade_finished"
	sharpness = SHARP_EDGED

/obj/item/forging/finished/staff
	name = "staff"
	icon_state = "staff_finished"

/obj/item/forging/finished/attack(mob/living/M, mob/living/user)
	. = ..()
	if(force <= 0)
		if(!do_after(user, 5 SECONDS, target = M))
			return
	if(imbued_reagent)
		M.reagents.add_reagent(imbued_reagent, 1)

/obj/item/stack/sheet/bone_dust
	name = "bone dust"
	desc = "Bones that have been pulverized into dust. Useful for certain constructions."
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	icon_state = "bone_powder"

/obj/item/stack/sheet/bone/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(istype(W, /obj/item/forging/hammer))
		if(use(1))
			new /obj/item/stack/sheet/bone_dust(get_turf(user))

/obj/item/stack/sheet/bone_sand_mix
	name = "sand-bone mix"
	desc = "Just dip it in some water and watch it become stronger!"
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	icon_state = "bone_sand_mix"

/obj/item/stack/sheet/bone_sand_mix/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(istype(target, /turf/open/water))
		if(use(1))
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
		var/choice = input(user, "What would you like to make?") as null|anything in list("Hilt", "Orb")
		if(!choice)
			return
		switch(choice)
			if("Hilt")
				chosen_forging = /obj/item/forging/handle
			if("Orb")
				chosen_forging = /obj/item/forging/orb
		if(use(5))
			new chosen_forging(get_turf(user))

/obj/item/forging/handle
	name = "sword handle"
	desc = "A handle for a sword"
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	icon_state = "hilt"

/obj/item/forging/orb
	name = "staff orb"
	desc = "An orb for a staff"
	icon = 'modular_lumos/icons/obj/forge_items.dmi'
	icon_state = "orb"

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
