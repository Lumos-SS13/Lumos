/obj/item/forging/tongs
	name = "forging tongs"
	desc = "A tool used to hold really hot metal."
	//this var specifically is only for metal, the rest will be used in the contents
	var/has_sheet_metal = FALSE

/obj/item/forging/tongs/attack_self(mob/user)
	. = ..()
	for(var/obj/A in contents)
		A.forceMove(drop_location(src))

/obj/item/forging/tongs/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return
	if(istype(target, /obj/item/stack/sheet/metal))
		var/obj/item/stack/sheet/metal/chosen_metal = target
		if(!chosen_metal.use(1) || has_sheet_metal)
			return
		has_sheet_metal = TRUE
		return
	if(istype(target, /obj/item/forging/construct))
		if(contents.len > 0)
			return
		var/obj/item/forging/construct/chosen_construct = target
		chosen_construct.forceMove(src)
		return
	if(istype(target, /obj/item/forging/finished))
		if(contents.len > 0)
			return
		var/obj/item/forging/finished/chosen_finished = target
		chosen_finished.forceMove(src)
		return

/obj/item/forging/hammer
	name = "forging hammer"
	desc = "A tool used to beat really hot metal."

/obj/item/reagent_containers/glass/primitive_chem_isolator
	name = "primitive chemical isolator"
	desc = "A small cup that allows you to take out the chemicals you do not want. Alt + Click to take out chemicals."
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 15, 20, 25, 30, 50)
	item_flags = NO_MAT_REDEMPTION
	reagent_flags = OPENCONTAINER
	spillable = TRUE
	
/obj/item/reagent_containers/glass/primitive_chem_isolator/AltClick(mob/user)
	. = ..()
	if(reagents)
		var/choice = input(user, "Which chemical would you like to remove?") as null|anything in reagents.reagent_list
		if(!choice)
			return
		reagents.remove_reagent(choice, 1000)
