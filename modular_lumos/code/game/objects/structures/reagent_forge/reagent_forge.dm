/obj/structure/forge
	name = "forge"
	desc = "Technology that is used to craft items."
	var/hell = FALSE

/obj/structure/forge/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(istype(I, /obj/item/forging/tongs))
		var/obj/item/forging/tongs/used_tongs = I
		if(used_tongs.has_sheet_metal)
			if(!do_after(user, 10 SECONDS, target = src))
				return
			used_tongs.has_sheet_metal = FALSE
			new /obj/item/forging/hot_metal(get_turf(src))
			return
		if(used_tongs.contents.len > 0)
			for(var/obj/OB in used_tongs.contents)
				if(istype(OB, /obj/item/forging/construct))
					var/obj/item/forging/construct/in_construct = OB
					if(in_construct.on_fire)
						if(!do_after(user, 10 SECONDS, target = src))
							return
						if(prob(25) && in_construct.mistakes >= 5)
							in_construct.mistakes -= 1
						return
					if(!in_construct.on_fire)
						if(!do_after(user, 10 SECONDS, target = src))
							return
						in_construct.on_fire = TRUE
						addtimer(CALLBACK(in_construct, /obj/item/forging/construct.proc/remove_flames), 50 SECONDS)
						if(in_construct.brittle)
							qdel(in_construct)
						return
				if(istype(OB, /obj/item/forging/finished) && hell)
					var/obj/item/forging/finished/finished = OB
					if(finished.imbued_reagent)
						return
					if(!do_after(user, 10 SECONDS, target = src))
						return
					if(finished.reagents)
						for(var/datum/reagent/chosen_reagent in finished.reagents.reagent_list)
							if(chosen_reagent.volume > 50)
								finished.imbued_reagent = chosen_reagent.type
								break

/obj/structure/forge/hell
	name = "hell forge"
	desc = "Technology that is used to craft items, now with the ability to imbue reagents into the items themselves."
	hell = TRUE
