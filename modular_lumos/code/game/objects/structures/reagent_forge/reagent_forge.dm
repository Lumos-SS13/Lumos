/obj/structure/forge
	name = "forge"
	desc = "Technology that is used to craft items."
	icon = 'modular_lumos/icons/obj/blacksmithing.dmi'
	icon_state = "furnace"
	var/hell = FALSE
	density = TRUE
	var/in_use = FALSE
	anchored = TRUE

	light_power = 5
	light_color = LIGHT_COLOR_LAVA
	light_range = 3

	var/cores_used = 0

/obj/structure/forge/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/forging/tongs))
		if(in_use)
			return
		in_use = TRUE
		var/obj/item/forging/tongs/used_tongs = I
		if(used_tongs.has_sheet_metal)
			to_chat(user, "<span class='warning'>You start heating up the metal...</span>")
			if(!do_after(user, 10 SECONDS, target = src))
				in_use = FALSE
				return
			used_tongs.has_sheet_metal = FALSE
			used_tongs.update_icon()
			new /obj/item/forging/hot_metal(get_turf(src))
			in_use = FALSE
			return
		if(used_tongs.contents.len > 0)
			for(var/obj/OB in used_tongs.contents)
				if(istype(OB, /obj/item/forging/construct))
					var/obj/item/forging/construct/in_construct = OB
					if(in_construct.on_fire)
						if(!do_after(user, 10 SECONDS, target = src))
							in_use = FALSE
							return
						to_chat(user, "<span class='warning'>You start heating up the metal...</span>")
						if(prob(25) && in_construct.mistakes >= 5)
							to_chat(user, "<span class='warning'>You see less cracks in the metal...</span>")
							in_construct.mistakes -= 1
						in_use = FALSE
						return
					if(!in_construct.on_fire)
						to_chat(user, "<span class='warning'>You start heating up the metal...</span>")
						if(!do_after(user, 10 SECONDS, target = src))
							in_use = FALSE
							return
						to_chat(user, "<span class='warning'>The metal is fiery with flames coming off the metal...</span>")
						in_construct.on_fire = TRUE
						addtimer(CALLBACK(in_construct, /obj/item/forging/construct.proc/remove_flames), 50 SECONDS)
						if(in_construct.brittle)
							qdel(in_construct)
							to_chat(user, "<span class='warning'>The metal snaps. All your progress is now gone...</span>")
							used_tongs.update_icon()
						in_use = FALSE
						return
				if(istype(OB, /obj/item/forging/finished) && hell)
					var/obj/item/forging/finished/finished = OB
					if(finished.imbued_reagent)
						in_use = FALSE
						to_chat(user, "<span class='warning'>This metal has already been imbued with a reagent...</span>")
						return
					to_chat(user, "<span class='warning'>You start heating up the metal, attempting to imbue the metal with a reagent...</span>")
					if(!do_after(user, 10 SECONDS, target = src))
						in_use = FALSE
						return
					if(finished.reagents)
						for(var/datum/reagent/chosen_reagent in finished.reagents.reagent_list)
							if(chosen_reagent.volume > 50)
								finished.imbued_reagent = chosen_reagent.type
								to_chat(user, "<span class='warning'>You have successfully imbued a chemical into the metal...</span>")
								finished.name = "[chosen_reagent.name] [initial(finished.name)]"
								finished.desc = "[initial(finished.desc)] It is imbued with [chosen_reagent.name]."
								break
					in_use = FALSE
					return
	if(istype(I, /obj/item/organ/regenerative_core))
		var/obj/item/organ/regenerative_core/regen_core = I
		if(!regen_core.inert && !hell)
			cores_used++
			qdel(regen_core)
			to_chat(user, "<span class='warning'>The forge slowly absorbs the core, leaving nothing behind...</span>")
			if(cores_used >= 10)
				playsound(src, 'sound/magic/demon_dies.ogg', 50, TRUE, -1)
				new /obj/structure/forge/hell(get_turf(src))
				to_chat(user, "<span class='warning'>The forge starts glowing with some devilish intent...</span>")
				qdel(src)
		return
	if(default_unfasten_wrench(user, I))
		return
	else
		return ..()

/obj/structure/forge/hell
	name = "hell forge"
	desc = "Technology that is used to craft items, now with the ability to imbue reagents into the items themselves."
	icon_state = "hellfurnace"
	hell = TRUE
