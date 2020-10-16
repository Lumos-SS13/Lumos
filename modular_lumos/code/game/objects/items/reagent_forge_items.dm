/obj/item/forging/hot_metal
	name = "hot metal"
	desc = "This is metal that has become very hot."

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

/obj/item/forging/construct
	//0 is the default. The more mistakes, the less damage it does. I wonder if its possible to get negative mistakes... (yes it is)
	var/mistakes = 0
	//this is the amount of times it is required to be hammered
	var/required_hammered = 10
	//this is the current amount of times it has been hammered
	var/hammered = 0

	var/on_fire = FALSE
	var/brittle = FALSE
	var/finished_product

/obj/item/forging/construct/proc/remove_flames()
	on_fire = FALSE

/obj/item/forging/construct/sword
	name = "hot sword object"
	desc = "A hot metal mass that resembles a sword"
	finished_product = /obj/item/forging/unfinished/sword

/obj/item/forging/construct/staff
	name = "hot staff object"
	desc = "A hot metal mass that resembles a sword"
	finished_product = /obj/item/forging/unfinished/staff

/obj/item/forging/unfinished
	var/finished_product
	var/starting_force

/obj/item/forging/unfinished/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/stack/cable_coil) || istype(I, /obj/item/stack/sheet/sinew))
		var/obj/item/stack/use_coil = I
		if(!do_after(user, 10 SECONDS, target = src))
			return
		if(!use_coil.use(5))
			return
		var/obj/item/forging/finished/f_product = finished_product
		var/obj/item/forging/finished/s_product = new f_product(get_turf(src))
		s_product.force = force
		qdel(src)

/obj/item/forging/unfinished/proc/create_force(num = 0)
	var/subtracting_force = num * 4
	force -= subtracting_force
	force = max(force, 0)
	
/obj/item/forging/unfinished/sword
	name = "unfinished sword"
	finished_product = /obj/item/forging/finished/sword
	starting_force = 20

/obj/item/forging/unfinished/staff
	name = "unfinished staff"
	finished_product = /obj/item/forging/finished/staff
	starting_force = 0

/obj/item/forging/finished
	//this is the reagent that the hell forge can add to the weapon
	var/imbued_reagent

/obj/item/forging/finished/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/chosen_container = I
		chosen_container.reagents.trans_to(src, 1000)

/obj/item/forging/finished/sword
	name = "sword"

/obj/item/forging/finished/staff
	name = "staff"

/obj/item/forging/finished/attack(mob/living/M, mob/living/user)
	. = ..()
	if(imbued_reagent)
		M.reagents.add_reagent(imbued_reagent, 1)
