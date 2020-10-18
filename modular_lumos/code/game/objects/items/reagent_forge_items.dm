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
	var/required_hammered = 100
	//this is the current amount of times it has been hammered
	var/hammered = 0

	var/on_fire = FALSE
	var/brittle = FALSE
	var/finished_product

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

/obj/item/forging/unfinished/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/stack/cable_coil) || istype(I, /obj/item/stack/sheet/sinew))
		var/obj/item/stack/use_coil = I
		if(use_coil.amount < 5)
			return
		if(!do_after(user, 10 SECONDS, target = src))
			return
		if(!use_coil.use(5))
			return
		var/obj/item/forging/finished/f_product = finished_product
		var/obj/item/forging/finished/s_product = new f_product(get_turf(src))
		s_product.force = force
		qdel(src)
	else
		return ..()

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

/obj/item/forging/unfinished/staff
	name = "unfinished staff"
	icon_state = "staff"
	finished_product = /obj/item/forging/finished/staff
	starting_force = 0

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
