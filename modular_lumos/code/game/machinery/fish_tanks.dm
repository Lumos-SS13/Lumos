/obj/structure/fish_tank_base
	name = "unfinished fish tank"
	desc = "A tank that requires some glass"
	icon = 'modular_lumos/icons/obj/fish_items.dmi'
	icon_state = "tanki1"

	density = TRUE

/obj/structure/fish_tank_base/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/stack/sheet/glass))
		var/obj/item/stack/sheet/glass/glass = I
		if(glass.amount < 5)
			return
		if(!do_after(user, 2 SECONDS, FALSE, src))
			return
		glass.use(5)
		new /obj/structure/fish_tank(get_turf(src))
		qdel(src)
		return
	else if(istype(I, /obj/item/screwdriver))
		I.play_tool_sound(src, 50)
		if(!do_after(user, 2 SECONDS, FALSE, src))
			return
		I.play_tool_sound(src, 50)
		var/obj/item/stack/sheet/metal/metal = new /obj/item/stack/sheet/metal(get_turf(src))
		metal.amount = 20
		qdel(src)
		return
	else
		return ..()

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
	update_icon()

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
		if(seaweed_grow >= 50)
			seaweed_grow -= 50
			new /obj/item/reagent_containers/food/snacks/sea_weed(get_turf(src))
		update_icon()
		return
	else if(istype(I, /obj/item/wrench))
		I.play_tool_sound(src, 50)
		if(!do_after(user, 2 SECONDS, FALSE, src))
			return
		I.play_tool_sound(src, 50)
		anchored = !anchored
		return
	else if(istype(I, /obj/item/crowbar))
		I.play_tool_sound(src, 50)
		if(!do_after(user, 2 SECONDS, FALSE, src))
			return
		I.play_tool_sound(src, 50)
		new /obj/structure/fish_tank_base(get_turf(src))
		var/obj/item/stack/sheet/glass/glass = new /obj/item/stack/sheet/glass(get_turf(src))
		glass.amount = 5
		qdel(src)
		return
	else if(istype(I, /obj/item/fish_tool/fish_food))
		var/obj/item/fish_tool/fish_food/food = I
		if(food.food_left >= 5)
			food.food_left -= 5
			current_food += 5
			food.desc = "[initial(food.desc)] Food Remaining: [food.food_left]"
			playsound(src.loc, 'sound/machines/chime.ogg', 50, TRUE, -1)
		return
	else if(istype(I, /obj/item/fish_tool/analyzer))
		playsound(src.loc, 'sound/machines/chime.ogg', 50, TRUE, -1)
		interact(user)
		return
	else
		return ..()

/obj/structure/fish_tank/interact(mob/user)
	var/dat = {"
		<center>
			<div class='statusDisplay'>
				Fish Analyzer
			</div>
			<div class='statusDisplay'>
				Dirty: [dirty] / 255<br>
				Seaweed: [seaweed_grow]<br>
				Food: [current_food]<br>
			</div>
		</center>"}
	for(var/obj/item/fishy/fish in contents)
		var/age_string = null
		switch(fish.ageStatus)
			if(2)
				age_string = "YOUNG"
			if(0)
				age_string = "MIDDLE"
			if(7)
				age_string = "OLD"
		dat += {"
			<center>
				<div class='statusDisplay'>
					Fish One: [fish.name]<br>
					<br>
					Sex: [fish.sex ? "FEMALE" : "MALE"]<br>
					Age: [age_string]<br>
					Health: [fish.health]/[fish.maxHealth]<br>
					Hunger: [fish.hunger]/[fish.maxHunger]<br>
				</div>
			</center>"}
	
	var/datum/browser/popup = new(user, "fish_analyzer", name, 225, 500)
	popup.set_content(dat)
	popup.open()

/obj/structure/fish_tank/attack_hand(mob/living/user)
	if(contents.len > 0)
		var/atom/A = contents[contents.len] //Get the most recent hidden thing
		if(istype(A, /obj/item/fishy))
			var/obj/item/fishy/fish = A
			fish.in_tank = FALSE
			fish.forceMove(src.loc)
			user.put_in_active_hand(fish)
			update_icon()

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
	if(contents.len > 0)
		add_overlay("feesh1")
	if(contents.len > 1)
		add_overlay("feesh2")
	add_overlay("seaweed2_[seaweed_level]")
	var/image/dirt_level = image(icon_state = "over_tank_full_dirty")
	dirt_level.alpha = dirty
	var/image/clean_level = image(icon_state = "over_tank_full_clean")
	clean_level.alpha = clean
	add_overlay(clean_level)
	add_overlay(dirt_level)

/obj/structure/fish_tank/process()
	update_icon()
	if(world.time < resting_period)
		return
	resting_period = world.time + 5 SECONDS
	seaweed_grow++
	if(contents.len > 0)
		dirty++
		if(dirty >= 255)
			dirty = 255
		clean--
		if(clean <= 0)
			clean = 0
	if(current_food > 0)
		dirty++
		seaweed_grow++
	var/obj/item/fishy/fish1 = null
	var/obj/item/fishy/fish2 = null
	var/age_dividor = 1
	for(var/obj/item/fishy/fish in contents)
		if(!fish1)
			fish1 = fish
		else
			fish2 = fish
		if(current_food >= 2 && fish.hunger <= 98)
			current_food -= 2
			fish.hunger += 2
		if(dirty >= 100)
			fish.health--
		age_dividor += fish.ageStatus
	if(istype(fish1, fish2.type))
		if(fish1.sex != fish2.sex)
			if(prob(15 / age_dividor))
				new fish1.spawned_egg(get_turf(src))
