/obj/structure/fish_tank
	name = "fish tank"
	desc = "A tank that is for growing fish."
	icon = 'modular_lumos/icons/obj/fish_items.dmi'
	icon_state = "tank1"

	///Dirty: how dirty a tank is
	var/dirty = 0
	var/clean = 255

	var/seaweed_grow = 0

	var/current_food = 0

	var/resting_period

	density = TRUE

/obj/structure/fish_tank/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/fish_tank/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/fish_tank/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/fishy))
		var/obj/item/fishy/fish = I
		if(contents.len >= 2)
			to_chat(user, "<span class='warning'>You cannot fit anymore fish!</span>")
			return
		fish.forceMove(src)
		fish.in_tank = TRUE
		update_icon()
		return
	else if(istype(I, /obj/item/fish_tool/brush))
		if(!do_after(user, 2 SECONDS, FALSE, src))
			return
		dirty = 0
		clean = 255
		update_icon()
		return
	else if(istype(I, /obj/item/fish_tool/clippers))
		if(seaweed_grow >= 25)
			seaweed_grow -= 25
			new /obj/item/reagent_containers/food/snacks/sea_weed(get_turf(src))
		return
	else if(istype(I, /obj/item/fish_tool/fish_food))
		var/obj/item/fish_tool/fish_food/food = I
		if(food.food_left >= 5)
			food.food_left -= 5
			current_food += 5
		return
	else
		return ..()

/obj/structure/fish_tank/attack_hand(mob/living/user)
	. = ..()
	if(contents.len)
		var/atom/A = contents[contents.len] //Get the most recent hidden thing
		if(istype(A, /obj/item/fishy))
			var/obj/item/fishy/fish = A
			fish.in_tank = FALSE
			fish.forceMove(src.loc)
			user.put_in_active_hand(fish)

/obj/structure/fish_tank/update_icon()
	. = ..()
	cut_overlays()
	var/seaweed_level = null
	switch(seaweed_grow)
		if(-INFINITY to 24)
			seaweed_level = 1
		if(25 to 49)
			seaweed_level = 2
		if(50 to 74)
			seaweed_level = 3
		if(75 to INFINITY)
			seaweed_level = 4
	add_overlay("seaweed1_[seaweed_level]")
	if(contents.len)
		add_overlay("feesh")
	add_overlay("seaweed2_[seaweed_level]")
	var/image/dirt_level = image(icon_state = "over_tank_full_dirty")
	dirt_level.alpha = dirty
	var/image/clean_level = image(icon_state = "over_tank_full_clean")
	clean_level.alpha = clean
	add_overlay(clean_level)
	add_overlay(dirt_level)

/obj/structure/fish_tank/process()
	if(world.time < resting_period)
		return
	resting_period = world.time + 5 SECONDS
	seaweed_grow++
	if(contents.len)
		dirty++
		if(dirty >= 255)
			dirty = 255
		clean--
		if(clean <= 0)
			clean = 0
	if(current_food > 0)
		dirty++
	var/obj/item/fishy/fish1 = null
	var/obj/item/fishy/fish2 = null
	for(var/obj/item/fishy/fish in contents)
		if(!fish1)
			fish1 = fish
		else
			fish2 = fish
		if(current_food >= 2)
			current_food -= 2
			fish.hunger += 2
	if(istype(fish1, fish2.type))
		if(fish1.sex != fish2.sex)
			if(fish1.breedable && fish2.breedable)
				if(prob(10))
					new fish1.spawned_egg(get_turf(src))
	update_icon()
