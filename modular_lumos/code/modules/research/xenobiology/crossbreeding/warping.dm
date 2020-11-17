/area/rainbow_rune_area
  	name = "Rainbow Rune Room"
  	icon_state = "away"
  	requires_power = FALSE
  	has_gravity = STANDARD_GRAVITY
  	noteleport = TRUE
  	hidden = TRUE

/obj/item/stack/sheet/resin
	name = "resin"
	desc = "Sheets made of resin from a species that is hostile."
	icon = 'modular_lumos/icons/obj/stack_items.dmi'
	icon_state = "resin"

GLOBAL_LIST_INIT(resin_recipes, list ( \
	new/datum/stack_recipe("resin wall", /obj/structure/alien/resin/wall, 3, time = 10, one_per_turf = 1, on_floor = 1), \
	new/datum/stack_recipe("resin window", /obj/structure/alien/resin/membrane, 3, time = 10, one_per_turf = 1, on_floor = 1), \
	new/datum/stack_recipe("resin nest", /obj/structure/bed/nest, 3, time = 10, one_per_turf = 1, on_floor = 1), \
	new/datum/stack_recipe("resin weeds", /obj/structure/alien/weeds/node, 3, time = 10, one_per_turf = 1, on_floor = 1), \
	))

/obj/item/stack/sheet/resin/get_main_recipes()
	. = ..()
	. += GLOB.resin_recipes

/obj/effect/slime_rune
	name = "slime rune"
	desc = "A rune that has special properties depending on which extract was used"
	icon = 'icons/effects/crayondecal.dmi'
	icon_state = "rune1"

	var/obj/item/slimecross/warping/parent_extract
	var/process_rune = FALSE

	var/colour = "null"

	anchored = TRUE

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
	if(parent_extract)
		parent_extract.child_rune = null
	. = ..()

/obj/effect/slime_rune/grey
	colour = "grey"
	process_rune = TRUE
	var/list/slime_count = list(
		0,0,0,0,0,0,0,0,0,0,0,
		0,0,0,0,0,0,0,0,0,0,0
	)
	var/list/slime_type = list(
		"grey", "orange", "purple", "blue", "metal", "yellow", "dark purple", "dark blue", "silver", "bluespace", "sepia",
		"cerulean", "pyrite", "red", "green", "pink", "gold", "oil", "black", "light pink", "adamantine", "rainbow"
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
		slime_count[N] -= 5
		var/mob/living/simple_animal/slime/spawn_slime = new /mob/living/simple_animal/slime(src_turf)
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

/obj/effect/slime_rune/orange/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(isliving(AM)) //It's still a fire, idiot.
		var/mob/living/L = AM
		L.adjust_fire_stacks(5)
		L.IgniteMob()

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

/obj/effect/slime_rune/blue/Initialize()
	. = ..()
	create_reagents(1000)

/obj/effect/slime_rune/blue/process()
	var/turf/src_turf = get_turf(src)
	if(!isopenturf(src_turf))
		return
	var/turf/open/opensrc_turf = src_turf
	reagents.add_reagent(/datum/reagent/water, 500)
	opensrc_turf.MakeSlippery(TURF_WET_LUBE,min_wet_time = 10 SECONDS, wet_time_to_add = 2 SECONDS)
	chem_splash(opensrc_turf, 3, list(reagents))

/obj/effect/slime_rune/metal
	colour = "metal"
	density = TRUE
	max_integrity = 200

/obj/effect/slime_rune/yellow
	colour = "yellow"
	process_rune = TRUE

	var/stored_energy = 0

/obj/effect/slime_rune/yellow/process()
	var/turf/src_turf = get_turf(src)
	var/area/src_area = get_area(src)
	for(var/obj/item/stock_parts/cell/charging in src_turf)
		if(charging.charge < 500)
			continue
		charging.use(500)
		stored_energy += 500
	for(var/obj/O in src_turf)
		for(var/obj/item/stock_parts/cell/internal_charging in O.contents)
			if(internal_charging.charge < 500)
				continue
			internal_charging.use(500)
			stored_energy += 500
	var/obj/machinery/power/apc/selectAPC = locate(/obj/machinery/power/apc) in src_area
	var/obj/item/stock_parts/cell/apc_cell = selectAPC.get_cell()
	if(!apc_cell)
		return
	var/hypothetical_charge = apc_cell.charge + 500
	if(hypothetical_charge >= apc_cell.maxcharge)
		return
	apc_cell.give(500)

/obj/effect/slime_rune/darkpurple
	colour = "dark purple"
	process_rune = TRUE
	
	var/timer = 0

/obj/effect/slime_rune/darkpurple/process()
	if(timer > world.time)
		return
	timer = world.time + 10 SECONDS

	var/turf/src_turf = get_turf(src)
	new /obj/item/stack/sheet/mineral/plasma(src_turf)

/obj/effect/slime_rune/darkblue
	colour = "dark blue"

/obj/effect/slime_rune/darkblue/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(isliving(AM))
		var/mob/living/livingAM = AM
		livingAM.adjust_bodytemperature(-80, 60)

/obj/effect/slime_rune/silver
	colour = "silver"
	process_rune = TRUE

	var/stored_nutrition = 0

/obj/effect/slime_rune/silver/process()
	var/turf/src_turf = get_turf(src)
	for(var/obj/item/reagent_containers/food/chosenFood in src_turf)
		for(var/datum/reagent/consumable/nutriment/chosenNutri in chosenFood.reagents.reagent_list)
			stored_nutrition += chosenNutri.volume
		qdel(chosenFood)

/obj/effect/slime_rune/silver/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(stored_nutrition < 5)
		return
	if(iscarbon(AM))
		var/mob/living/carbon/carbonAM = AM
		carbonAM.reagents.add_reagent(/datum/reagent/consumable/nutriment, 5)
		stored_nutrition -= 5

/obj/effect/slime_rune/bluespace
	colour = "bluespace"

/obj/effect/slime_rune/sepia
	colour = "sepia"
	process_rune = TRUE

	var/list/rune_victims = list()

/obj/effect/slime_rune/sepia/Destroy()
	for(var/mob/living/victimMob in rune_victims)
		victimMob.remove_status_effect(STATUS_EFFECT_STASIS, STASIS_MACHINE_EFFECT)
	. = ..()

/obj/effect/slime_rune/sepia/process()
	var/turf/src_turf = get_turf(src)
	for(var/mob/living/livingMob in src_turf)
		if(IS_IN_STASIS(livingMob))
			continue
		chill_out(livingMob)
		rune_victims += livingMob
	for(var/mob/living/victimMob in rune_victims)
		var/turf/victim_turf = get_turf(victimMob)
		if(victim_turf == src_turf)
			continue
		victimMob.remove_status_effect(STATUS_EFFECT_STASIS, STASIS_MACHINE_EFFECT)

/obj/effect/slime_rune/sepia/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(isliving(AM))
		var/mob/living/livingMob = AM
		chill_out(livingMob)
		rune_victims += livingMob

/obj/effect/slime_rune/sepia/proc/chill_out(mob/living/target)
	var/freq = rand(24750, 26550)
	playsound(src, 'sound/effects/spray.ogg', 5, TRUE, 2, frequency = freq)
	target.apply_status_effect(STATUS_EFFECT_STASIS, STASIS_MACHINE_EFFECT)
	target.ExtinguishMob()

/obj/effect/slime_rune/cerulean
	colour = "cerulean"

	var/linked_projection

/obj/effect/slime_rune/cerulean/Destroy(force)
	if(linked_projection)
		qdel(linked_projection)
	. = ..()

/obj/effect/cerulean_projection
	density = FALSE
	anchored = TRUE
	var/obj/effect/slime_rune/cerulean/linked_rune

/obj/effect/cerulean_projection/Destroy(force)
	if(linked_rune?.linked_projection == src)
		linked_rune.linked_projection = null
	. = ..()
	
/obj/effect/slime_rune/cerulean/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(linked_projection)
		qdel(linked_projection)
	var/turf/src_turf = get_turf(src)
	if(ishuman(AM))
		var/mob/living/carbon/human/AMHuman = AM
		var/mob/living/carbon/human/newHuman = new /mob/living/carbon/human(src_turf)
		newHuman.real_name = AMHuman.real_name
		AMHuman.dna.transfer_identity(newHuman)
		newHuman.updateappearance(mutcolor_update=1)
		newHuman.alpha = 222
		newHuman.color = COLOR_BLUE_LIGHT
		newHuman.move_resist = MOVE_FORCE_OVERPOWERING
		newHuman.a_intent = INTENT_HELP
		newHuman.density = FALSE
		newHuman.dir = AMHuman.dir
		linked_projection = newHuman
		return
	else if(isliving(AM) && !ishuman(AM))
		var/obj/effect/cerulean_projection/newProjection = new /obj/effect/cerulean_projection(src_turf)
		newProjection.icon = AM.icon
		newProjection.icon_state = AM.icon_state
		newProjection.name = AM.name
		newProjection.desc = AM.desc
		newProjection.alpha = 222
		newProjection.color = COLOR_BLUE_LIGHT
		newProjection.dir = AM.dir
		newProjection.linked_rune = src
		linked_projection = newProjection

/obj/effect/slime_rune/pyrite
	colour = "pyrite"
	
	var/list/random_color_list = list("#00aedb","#a200ff","#f47835","#d41243","#d11141","#00b159","#00aedb","#f37735","#ffc425","#008744","#0057e7","#d62d20","#ffa700")

/obj/effect/slime_rune/pyrite/Crossed(atom/movable/AM, oldloc)
	. = ..()
	AM.add_atom_colour(pick(random_color_list), WASHABLE_COLOUR_PRIORITY)

/obj/effect/slime_rune/red
	colour = "red"

/obj/effect/slime_rune/green
	colour = "green"
	process_rune = TRUE
	var/timer = 0

/obj/effect/slime_rune/green/process()
	if(timer > world.time)
		return
	timer = world.time + 10 SECONDS

	var/turf/src_turf = get_turf(src)
	for(var/obj/item/stack/sheet/mineral/plasma/choosePlasma in src_turf)
		if(!choosePlasma.use(4))
			return
		new /obj/item/stack/sheet/resin(src_turf)

/obj/effect/slime_rune/pink
	colour = "pink"

/obj/effect/slime_rune/gold
	colour = "gold"

	var/coin_amount = 0

/obj/effect/slime_rune/gold/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/coin))
		var/obj/item/coin/chosenCoin = I
		coin_amount += chosenCoin.value
		qdel(chosenCoin)
	else
		..()

/obj/effect/slime_rune/gold/attack_hand(mob/living/user)
	var/turf/src_turf = get_turf(src)
	if(coin_amount < 50)
		to_chat(user, "You need more coin traveller")
		return
	coin_amount -= 50
	var/obj/item/spawnItem = pick(subtypesof(/obj/item))
	new spawnItem(src_turf)

/obj/effect/slime_rune/oil
	colour = "oil"

	var/triggered = FALSE

/obj/effect/slime_rune/oil/Crossed(atom/movable/AM, oldloc)
	. = ..()
	parent_extract.child_rune = null
	if(!triggered)
		explosion(get_turf(src), -1, -1, 5, 0)
	triggered = TRUE
	qdel(src)

/obj/effect/slime_rune/black
	colour = "black"

	var/chosen_species

	var/list/species_list = list(
		/datum/species/lizard, /datum/species/plasmaman, /datum/species/human,
		/datum/species/pod, /datum/species/fly, /datum/species/shadow,
		/datum/species/mush, /datum/species/skeleton, /datum/species/jelly,
		/datum/species/lizard/ashwalker, /datum/species/vox, /datum/species/insect/moth,
		/datum/species/zombie, /datum/species/jelly/slime, /datum/species/jelly/luminescent,
		/datum/species/abductor, /datum/species/android, /datum/species/angel,
		/datum/species/golem, /datum/species/vampire, /datum/species/dwarf,
		/datum/species/human/humanoid/dunmer, /datum/species/xeno, /datum/species/dullahan
	)

/obj/effect/slime_rune/black/attack_hand(mob/living/user)
	. = ..()
	if(iscarbon(user))
		var/mob/living/carbon/userCarbon = user
		if(chosen_species)
			chosen_species = null
			to_chat(user, "You remove the link")
			return
		chosen_species = userCarbon.dna.species
		to_chat(user, "You add a link")

/obj/effect/slime_rune/black/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(iscarbon(AM))
		var/mob/living/carbon/AMCarbon = AM
		if(chosen_species)
			AMCarbon.set_species(chosen_species)
		else
			var/rand_species = pick(species_list)
			AMCarbon.set_species(rand_species)

/obj/effect/slime_rune/lightpink
	colour = "light pink"
	process_rune = TRUE

/obj/effect/slime_rune/lightpink/process()
	var/turf/src_turf = get_turf(src)
	for(var/mob/living/chooseLiving in src_turf)
		if(chooseLiving.stat != DEAD)
			chooseLiving.adjustFireLoss(-1)
			chooseLiving.adjustBruteLoss(-1)
			if(HAS_TRAIT(chooseLiving, TRAIT_TOXINLOVER))
				chooseLiving.adjustToxLoss(1)
			else
				chooseLiving.adjustToxLoss(-1)
			chooseLiving.adjustCloneLoss(-1)
			chooseLiving.adjustOxyLoss(-1)
		if(chooseLiving.stat == DEAD)
			chooseLiving.reagents.add_reagent(/datum/reagent/toxin/formaldehyde, 2)

/obj/effect/slime_rune/adamantine
	colour = "adamantine"
	process_rune = TRUE

	var/list/mineral_types = list()
	var/timer = 0

/obj/effect/slime_rune/adamantine/Initialize()
	. = ..()
	var/turf/src_turf = get_turf(src)
	for(var/directions in GLOB.alldirs)
		var/turf/dir_turf = get_step(src_turf, directions)
		if(!istype(dir_turf, /turf/closed/mineral))
			continue
		var/turf/closed/mineral/chosenMineralTurf = dir_turf
		if(!chosenMineralTurf.mineralType)
			mineral_types += /obj/item/stack/ore/glass
			continue
		mineral_types += chosenMineralTurf.mineralType

/obj/effect/slime_rune/adamantine/process()
	if(timer > world.time)
		return
	timer = world.time + 10 SECONDS

	var/turf/src_turf = get_turf(src)
	var/obj/spawnObj = pick(mineral_types)
	new spawnObj(src_turf)

/obj/effect/slime_rune/rainbow
	colour = "rainbow"

	var/obj/effect/slime_rune/rainbow_room/linked_room

/obj/effect/slime_rune/rainbow/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(!linked_room)
		linked_room = locate(/obj/effect/slime_rune/rainbow_room)
	AM.forceMove(get_turf(linked_room))

/obj/effect/slime_rune/rainbow_room
	colour = "rainbow"

/obj/effect/slime_rune/rainbow_room/Crossed(atom/movable/AM, oldloc)
	. = ..()
	var/obj/effect/slime_rune/rainbow/homeRune = locate(/obj/effect/slime_rune/rainbow) in world
	if(!homeRune)
		var/turf/safeTurf = find_safe_turf()
		AM.forceMove(safeTurf)
		return
	var/turf/rune_turf = get_turf(homeRune)
	AM.forceMove(rune_turf)

/obj/effect/slime_rune/attackby(obj/item/I, mob/user, params)
	if(I == parent_extract && istype(I, /obj/item/slimecross/warping))
		var/obj/item/slimecross/warping/selected_extract = I
		selected_extract.child_rune = null
		qdel(src)
	else
		..()

/obj/item/slimecross/warping
	name = "warping extract"
	desc = "It's body is constantly shifting."
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
	var/obj/effect/slime_rune/spawn_rune = new rune_type(get_turf(target))
	spawn_rune.parent_extract = src
	child_rune = spawn_rune

/obj/item/slimecross/warping/grey
	colour = "grey"
	rune_type = /obj/effect/slime_rune/grey

/obj/item/slimecross/warping/orange
	colour = "orange"
	rune_type = /obj/effect/slime_rune/orange

/obj/item/slimecross/warping/purple
	colour = "purple"
	rune_type = /obj/effect/slime_rune/purple

/obj/item/slimecross/warping/blue
	colour = "blue"
	rune_type = /obj/effect/slime_rune/blue

/obj/item/slimecross/warping/metal
	colour = "metal"
	rune_type = /obj/effect/slime_rune/metal

/obj/item/slimecross/warping/yellow
	colour = "yellow"
	rune_type = /obj/effect/slime_rune/yellow

/obj/item/slimecross/warping/darkpurple
	colour = "dark purple"
	rune_type = /obj/effect/slime_rune/darkpurple

/obj/item/slimecross/warping/darkblue
	colour = "dark blue"
	rune_type = /obj/effect/slime_rune/darkblue

/obj/item/slimecross/warping/silver
	colour = "silver"
	rune_type = /obj/effect/slime_rune/silver

/obj/item/slimecross/warping/bluespace
	colour = "bluespace"
	rune_type = /obj/effect/slime_rune/bluespace

/obj/item/slimecross/warping/bluespace/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(ismovable(target))
		var/atom/movable/movTarget = target
		if(movTarget.anchored)
			to_chat(user, "This is unable to be moved")
			return
		if(!child_rune)
			to_chat(user, "The rune is required to move things")
			return
		if(!do_after(user, 5 SECONDS, src))
			to_chat(user, "Moving interrupted")
			return
		movTarget.forceMove(get_turf(child_rune))

/obj/item/slimecross/warping/sepia
	colour = "sepia"
	rune_type = /obj/effect/slime_rune/sepia

/obj/item/slimecross/warping/cerulean
	colour = "cerulean"
	rune_type = /obj/effect/slime_rune/cerulean

/obj/item/slimecross/warping/pyrite
	colour = "pyrite"
	rune_type = /obj/effect/slime_rune/pyrite

/obj/item/slimecross/warping/red
	colour = "red"
	rune_type = /obj/effect/slime_rune/red

/obj/item/slimecross/warping/green
	colour = "green"
	rune_type = /obj/effect/slime_rune/green

/obj/item/slimecross/warping/pink
	colour = "pink"
	rune_type = /obj/effect/slime_rune/pink

/obj/item/slimecross/warping/gold
	colour = "gold"
	rune_type = /obj/effect/slime_rune/gold

/obj/item/slimecross/warping/oil
	colour = "oil"
	rune_type = /obj/effect/slime_rune/oil

/obj/item/slimecross/warping/black
	colour = "black"
	rune_type = /obj/effect/slime_rune/black

/obj/item/slimecross/warping/lightpink
	colour = "light pink"
	rune_type = /obj/effect/slime_rune/lightpink

/obj/item/slimecross/warping/adamantine
	colour = "adamantine"
	rune_type = /obj/effect/slime_rune/adamantine

/obj/item/slimecross/warping/rainbow
	colour = "rainbow"
	rune_type = /obj/effect/slime_rune/rainbow
