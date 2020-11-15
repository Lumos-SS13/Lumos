/obj/effect/slime_rune
	name = "slime rune"
	desc = "A rune that has special properties depending on which extract was used"
	icon = 'icons/effects/crayondecal.dmi'
	icon_state = "rune1"

	var/obj/item/slimecross/warping/parent_extract
	var/process_rune = FALSE

	var/colour = "null"

/obj/effect/slime_rune/Initialize()
	. = ..()
	if(process_rune)
		START_PROCESSING(SSobj, src)
	name =  colour + " slime rune"
	var/itemcolor = "#FFFFFF"
	switch(colour)
		if("orange")
			itemcolor = "#FFA500"
		if("purple")
			itemcolor = "#B19CD9"
		if("blue")
			itemcolor = "#ADD8E6"
		if("metal")
			itemcolor = "#7E7E7E"
		if("yellow")
			itemcolor = "#FFFF00"
		if("dark purple")
			itemcolor = "#551A8B"
		if("dark blue")
			itemcolor = "#0000FF"
		if("silver")
			itemcolor = "#D3D3D3"
		if("bluespace")
			itemcolor = "#32CD32"
		if("sepia")
			itemcolor = "#704214"
		if("cerulean")
			itemcolor = "#2956B2"
		if("pyrite")
			itemcolor = "#FAFAD2"
		if("red")
			itemcolor = "#FF0000"
		if("green")
			itemcolor = "#00FF00"
		if("pink")
			itemcolor = "#FF69B4"
		if("gold")
			itemcolor = "#FFD700"
		if("oil")
			itemcolor = "#505050"
		if("black")
			itemcolor = "#000000"
		if("light pink")
			itemcolor = "#FFB6C1"
		if("adamantine")
			itemcolor = "#008B8B"
	add_atom_colour(itemcolor, FIXED_COLOUR_PRIORITY)

/obj/effect/slime_rune/Destroy(force)
	if(process_rune)
		STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/effect/slime_rune/grey
	colour = "grey"
	process_rune = TRUE
	var/list/slime_count = list(
		0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0
	)
	var/list/slime_type = list(
		"grey", "orange", "purple", "blue", "metal", "yellow", "darkpurple", "darkblue", "silver", "bluespace", "sepia",
		"cerulean", "pyrite", "red", "green", "pink", "gold", "oil", "black", "lightpink", "adamantine", "rainbow"
	)

/obj/effect/slime_rune/grey/process()
	var/turf/src_turf = get_turf(src)
	for(var/obj/O in src_turf)
		if(!istype(O, /obj/item/slime_extract))
			continue
		var/obj/item/slime_extract/chosen_extract = O
		slime_count[chosen_extract.warping_array]++
		qdel(O)
	for(var/N in slime_count)
		if(N < 5)
			continue
		N -= 5
		var/mob/living/simple_animal/slime/spawn_slime
		spawn_slime.set_colour(slime_type[N])

/obj/effect/slime_rune/orange
	colour = "orange"
	process_rune = TRUE

/obj/effect/slime_rune/orange/process()
	var/turf/current_location = get_turf(src)
	for(var/A in current_location)
		if(A == src)
			continue
		else if(isliving(A)) //It's still a fire, idiot.
			var/mob/living/L = A
			L.adjust_fire_stacks(5)
			L.IgniteMob()
		else if(istype(A, /obj/item) && prob(20))
			var/obj/item/O = A
			O.microwave_act()
		else if(istype(A, /obj/item/grown/log))
			qdel(A)
			new /obj/item/stack/sheet/mineral/coal(loc, 1)

/obj/effect/slime_rune/purple
	colour = "purple"
	process_rune = TRUE

/obj/effect/slime_rune/purple/process()
	var/turf/src_turf = get_turf(src)
	for(var/obj/O in src_turf)
		if(istype(O, /obj/item/stack/sheet/cloth))
			var/obj/item/stack/sheet/cloth/chosenCloth = O
			if(!chosenCloth.use(4))
				continue
			new /obj/item/stack/medical/bruise_pack(src_turf)
		if(istype(O, /obj/item/stack/sheet/plastic))
			var/obj/item/stack/sheet/plastic/chosenPlastic = O
			if(!chosenPlastic.use(4))
				continue
			new /obj/item/stack/medical/ointment(src_turf)

/obj/effect/slime_rune/blue
	colour = "blue"
	process_rune = TRUE

/obj/effect/slime_rune/blue/process()
	var/turf/src_turf = get_turf(src)
	if(!isopenturf(src_turf))
		return
	reagents.add_reagent(/datum/reagent/water, 25)
	var/turf/open/open_src_turf = src_turf
	open_src_turf.MakeSlippery(TURF_WET_WATER, min_wet_time = 3 SECONDS, wet_time_to_add = 2 SECONDS)
	chem_splash(open_src_turf, 1, reagents)

/obj/effect/slime_rune/metal
	colour = "metal"
	density = TRUE
	max_integrity = 200

/obj/effect/slime_rune/yellow

/obj/effect/slime_rune/darkpurple

/obj/effect/slime_rune/darkblue

/obj/effect/slime_rune/silver

/obj/effect/slime_rune/bluespace

/obj/effect/slime_rune/sepia

/obj/effect/slime_rune/cerulean

/obj/effect/slime_rune/pyrite

/obj/effect/slime_rune/red

/obj/effect/slime_rune/green

/obj/effect/slime_rune/pink

/obj/effect/slime_rune/gold

/obj/effect/slime_rune/oil

/obj/effect/slime_rune/black

/obj/effect/slime_rune/lightpink

/obj/effect/slime_rune/adamantine

/obj/effect/slime_rune/rainbow

/obj/effect/slime_rune/attackby(obj/item/I, mob/user, params)
	if(I == parent_extract && istype(I, /obj/item/slimecross/warping))
		var/obj/item/slimecross/warping/selected_extract = I
		selected_extract.child_rune = null
		qdel(src)
	else
		..()

/obj/item/slimecross/warping
	name = "burning extract"
	desc = "It's boiling over with barely-contained energy."
	effect = "warping"
	icon_state = "warping"

	var/obj/effect/slime_rune/rune_type
	var/obj/effect/slime_rune/child_rune

/obj/item/slimecross/warping/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return
	if(child_rune)
		return
	if(istype(target, /turf/closed))
		return
	var/obj/effect/slime_rune/spawn_rune = new rune_type(get_turf(src))
	spawn_rune.parent_extract = src
