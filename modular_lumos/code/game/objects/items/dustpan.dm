/obj/item/dustpan
	name = "dustpan"
	desc = "A tool that is used to clean up dirt. Click to claim sandstone bricks and Alt-click to upgrade the dustpan."
	icon = 'modular_lumos/icons/obj/items_and_weapons.dmi'
	icon_state = "dustpan"

	var/stored_dirt = 0

	var/successful_cleaning = 0

	var/range_upgrade = FALSE
	var/reach_upgrade = FALSE
	var/speed_upgrade = FALSE

/obj/item/dustpan/examine(mob/user)
	. = ..()
	. += "[src] has [successful_cleaning] points."
	. += "[src] has [stored_dirt] stored dirt."

/obj/item/dustpan/update_icon()
	. = ..()
	cut_overlays()
	if(range_upgrade)
		add_overlay(image(icon,"dp_range"))
	if(reach_upgrade)
		add_overlay(image(icon,"dp_reach"))
	if(speed_upgrade)
		add_overlay(image(icon,"dp_speed"))

/obj/item/dustpan/AltClick(mob/user)
	. = ..()
	var/list/remaining_choices = list()
	if(!range_upgrade)
		remaining_choices += "range"
	if(!reach_upgrade)
		remaining_choices += "reach"
	if(!speed_upgrade)
		remaining_choices += "speed"
	if(successful_cleaning >= 200)
		var/choice = input(user, "Which upgrade would you like?", "Upgrade Selection:") as null|anything in remaining_choices
		if(!choice)
			return
		switch(choice)
			if("range")
				range_upgrade = TRUE
				successful_cleaning -= 200
			if("reach")
				reach_upgrade = TRUE
				successful_cleaning -= 200
			if("speed")
				speed_upgrade = TRUE
				successful_cleaning -= 200
	update_icon()

/obj/item/dustpan/attack_self(mob/user)
	. = ..()
	for(var/i in 1 to 5)
		if(stored_dirt >= 500)
			new /obj/item/stack/sheet/mineral/sandstone(get_turf(src))
			stored_dirt -= 500

/obj/item/dustpan/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!reach_upgrade)
		if(!proximity_flag)
			return
	if(isfloorturf(target))
		var/turf/turf = target
		var/clean_time = 2 SECONDS
		if(speed_upgrade)
			clean_time = 5
		if(!do_after(user, clean_time, target = target))
			return
		for(var/obj/effect/decal/cleanable/dirt/dirt in turf.contents)
			stored_dirt += dirt.alpha
			for(var/i in 1 to 5)
				if(dirt.alpha >= 50)
					successful_cleaning++
					dirt.alpha -= 50
			qdel(dirt)
		if(range_upgrade)
			for(var/obj/effect/decal/cleanable/dirt/dirt in range(target, 1))
				stored_dirt += dirt.alpha
				for(var/i in 1 to 5)
					if(dirt.alpha >= 50)
						successful_cleaning++
						dirt.alpha -= 50
				qdel(dirt)
		return
	else
		return ..()

/datum/design/dustpan
	name = "Dustpan"
	desc = "A miracle tool that cleans up dirt."
	id = "dustpan"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600)
	build_path = /obj/item/dustpan
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
