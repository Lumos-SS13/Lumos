/obj/structure/forging_anvil
	name = "anvil"
	desc = "A hunk of metal that is used as a base to beat other metal senselessly."
	icon = 'modular_lumos/icons/obj/blacksmithing.dmi'
	icon_state = "anvil"
	density = TRUE
	anchored = TRUE
	var/onesec_cooldown = FALSE

/obj/structure/forging_anvil/update_icon()
	. = ..()
	cut_overlays()
	if(contents.len)
		add_overlay(image(icon, "item_overlay"))

/obj/structure/forging_anvil/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/forging/tongs))
		var/obj/item/forging/tongs/used_tongs = I
		if(contents.len)
			if(!used_tongs.contents.len)
				for(var/obj/moving_obj in contents)
					moving_obj.forceMove(drop_location(src))
					moving_obj.forceMove(used_tongs)
			update_icon()
			used_tongs.update_icon()
			return
		if(used_tongs.contents.len > 0)
			for(var/obj/tong_obj in used_tongs.contents)
				tong_obj.forceMove(src)
			update_icon()
			used_tongs.update_icon()
			return
	if(istype(I, /obj/item/forging/hammer))
		if(!contents.len)
			return
		if(istype(contents[1], /obj/item/forging/construct))
			var/obj/item/forging/construct/c_construct = contents[1]
			if(!c_construct.on_fire)
				return
			if(onesec_cooldown)
				if(prob(50))
					c_construct.mistakes++
				c_construct.hammered++
				brittle_unmistake_chance(c_construct)
				return
			c_construct.hammered++
			brittle_unmistake_chance(c_construct)
			addtimer(CALLBACK(src, .proc/come_off_cooldown), 1 SECONDS)
		return
	else
		return ..()

/obj/structure/forging_anvil/proc/come_off_cooldown()
	onesec_cooldown = FALSE

/obj/structure/forging_anvil/proc/brittle_unmistake_chance(var/obj/item/forging/construct/C)
	var/brittle_chance = (C.hammered / 2) + C.mistakes
	if(prob(brittle_chance) && !C.brittle)
		C.brittle = TRUE
	var/unmistake_chance = max((C.hammered - 10) * 2, 0) 
	if(prob(unmistake_chance) && C.mistakes >= -4)
		C.mistakes--
