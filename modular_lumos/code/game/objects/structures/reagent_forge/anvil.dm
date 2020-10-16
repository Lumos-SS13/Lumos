/obj/structure/forging_anvil
	name = "anvil"
	desc = "A hunk of metal that is used as a base to beat other metal senselessly."

/obj/structure/forging_anvil/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/forging/tongs))
		var/obj/item/forging/tongs/used_tongs = I
		if(contents.len)
			if(!used_tongs.contents.len)
				for(var/obj/moving_obj in contents)
					moving_obj.forceMove(used_tongs)
			return
		if(used_tongs.contents.len > 0)
			for(var/obj/tong_obj in used_tongs.contents)
				tong_obj.forceMove(src)
			return
	if(istype(I, /obj/item/forging/hammer))
		if(!contents.len)
			return
		if(istype(contents[1], /obj/item/forging/construct))
			var/obj/item/forging/construct/c_construct = contents[1]
			if(!do_after(user, 10 SECONDS, target = src))
				c_construct.mistakes++
				return
			c_construct.hammered++
			var/brittle_chance = (c_construct.hammered / 2) + c_construct.mistakes
			if(prob(brittle_chance) && !c_construct.brittle)
				c_construct.brittle = TRUE
			var/unmistake_chance = max((c_construct.hammered - 10) * 2, 0) 
			if(prob(unmistake_chance) && c_construct.mistakes > -4)
				c_construct.mistakes--
