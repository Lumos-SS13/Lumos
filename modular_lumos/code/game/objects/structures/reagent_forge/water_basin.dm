/obj/structure/water_basin
	name = "water basin"
	desc = "Something that is used to cool off recently forged items."
	icon = 'modular_lumos/icons/obj/blacksmithing.dmi'
	icon_state = "water_basin"
	density = TRUE
	anchored = TRUE

/obj/structure/water_basin/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/forging/tongs))
		var/obj/item/forging/tongs/used_tong = I
		if(used_tong.contents.len > 0)
			for(var/obj/OB in used_tong.contents)
				if(istype(OB, /obj/item/forging/construct))
					var/obj/item/forging/construct/in_construct = OB
					if(in_construct.on_fire)
						in_construct.brittle = TRUE
						in_construct.mistakes -= 1
					if(in_construct.hammered >= in_construct.required_hammered)
						var/obj/item/forging/unfinished/spawning_unfinished = in_construct.finished_product
						if(!spawning_unfinished)
							return
						var/obj/item/forging/unfinished/spawned_unfinished = new spawning_unfinished(get_turf(src))
						spawned_unfinished.create_force(in_construct.mistakes)
						qdel(in_construct)
						used_tong.update_icon()
					playsound(src, 'modular_lumos/sound/effects/hot_hiss.ogg', 50, TRUE, -1)
	if(default_unfasten_wrench(user, I))
		return
	else
		return ..()
