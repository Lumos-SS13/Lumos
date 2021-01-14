/obj/item/fish_tool
	name = "fish tool"
	desc = "parent fish tool, do not use"
	icon = 'modular_lumos/icons/obj/fish_items.dmi'
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron = 200)

/obj/item/fish_tool/brush
	name = "brush"
	desc = "A scrubber for removing algae from fish tank siding."
	icon_state = "brush"

/obj/item/fish_tool/clippers
	name = "clippers"
	desc = "A pair of sheers for trimming tank-grown seaweed."
	icon_state = "clipper"
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED
	tool_behaviour = TOOL_SCALPEL
	toolspeed = 2

/obj/item/fish_tool/egg_killer
	name = "egg neutralizer"
	desc = "A specialized tool designed to euthanize fertilized fish eggs."
	icon_state = "egg_scoop"

/obj/item/fish_tool/analyzer
	name = "fish analyzer"
	desc = "A little gadget designed to catalog statistics of fish in a tank."
	icon_state = "fish_analy"

/obj/item/fish_tool/fish_food
	name = "fish food"
	desc = "A little canister of flakes made from god knows what. Gives your fish the nutriment they need."
	icon_state = "fish_food"
	var/food_left = 100

/obj/item/fish_tool/fish_food/huge
	name = "huge fish food"
	desc = "Sometimes, you just need alittle more fish food."
	icon_state = "fish_food_huge"
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/datum/material/iron = 400)
	food_left = 300
	
/obj/item/fish_tool/fishing_rod
	name = "fishing rod"
	desc = "They call me a master baiter."
	icon_state = "norm_rod"

	var/fishing_chance = 60

	var/in_use = FALSE

/obj/item/fish_tool/fishing_rod/primal
	name = "primal fishing rod"
	desc = "A primitive fishing rod. Sturdy and effective, and that's all that counts."
	icon_state = "prim_rod"

	fishing_chance = 50

/obj/item/fish_tool/fishing_rod/advanced
	name = "advanced fishing rod"
	desc = "Women want me, fish fear me."
	icon_state = "adv_rod"

	fishing_chance = 80

/obj/item/fish_tool/fishing_rod/makeshift
	name = "makeshift fishing rod"
	desc = "A haphazardly constructed fishing rod, not very effective but easy to create."
	icon_state = "wire_rod"

	fishing_chance = 30

/obj/item/fish_tool/fishing_rod/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(in_use)
		to_chat(user, "<span class='warning'>You are already fishing!</span>")
		return
	in_use = TRUE
	if(istype(target, /turf/open/water) || istype(target, /turf/open/floor/plating/beach/water))
		if(!do_after(user, 5 SECONDS, target = target))
			in_use = FALSE
			return
		if(!prob(fishing_chance))
			in_use = FALSE
			return
		var/chosen_fish = pick(list(/obj/item/fishy/catfish, /obj/item/fishy/lobster, /obj/item/fishy/shrimp, /obj/item/fishy/salmon))
		new chosen_fish(get_turf(target))
		in_use = FALSE
		return
	in_use = FALSE

/obj/item/paper/fluff/stations/chef/fishing
	name = "fishing manual"
	info = {"
		<center>
			<b><i>FISHING MANUAL</i></b><br>
			--------------------<br>
			Hello new fishers, and welcome to the manual to help you understand how to farm fish.<br>
			The first step is to start building the tank. Take ten metal and build a fish tank frame.<br>
			After you have built the frame, take five glass and add it to the frame, and voila, you have a fish tank!<br>
			--------------------<br>
			In this crate, there should be some salmon fish boxes. Open them up to get two of each salmon.<br>
			Be careful, as only males and females can breed, and you MIGHT get two males or two females from a box!<br>
			Place the male and female in the tank and let them do their thing.<br>
			Over time, they will age and produce less and less eggs until they die.<br>
			<br>
			But how do you check their age...<br>
			--------------------<br>
			Go to your service protolathe.<br>
			Once science researches basic tools, you should have access to printing your four basic tools:<br>
			1) Fish Brush - Used to clean the fish tank. Dirty tanks hurt the fish!<br>
			2) Fish Clipper - Used to cut the seaweed growing in the tanks... use that seaweed for some food.<br>
			3) Fish Egg Neutralizer - Used to kill fish eggs so you can use them for food.<br>
			4) Fish Analyzer - Used on the tanks or the fish to analyze their health, hunger, age, etc.<br>
			<br>
			So that is the tools you can get, but I never explained the eggs, did I?<br>
			--------------------<br>
			So fish eggs... if they are not euthanized, they will spawn their adult forms after two minutes.<br>
			At birth is the sex designated for the fishes. Currently, they will not change their sex, so pray.<br>
			Fish eggs also taste pretty good.<br>
			<br>
			with much love,<br>
			<i>Kobe Ivanov</i>
			"}

/obj/structure/closet/crate/wooden/fish_learning
	name = "aquaculture crate"
	desc = "A crate that contains a manual and some materials for aquaculture."

/obj/structure/closet/crate/wooden/fish_learning/PopulateContents()
	. = ..()
	new /obj/item/fish_tool/fish_food(src)
	for(var/i in 1 to 2)
		new /obj/item/fish_box/salmon(src)
	var/obj/item/stack/sheet/metal/metal = new /obj/item/stack/sheet/metal(src)
	metal.amount = 20
	var/obj/item/stack/sheet/glass/glass = new /obj/item/stack/sheet/glass(src)
	glass.amount = 10
	new /obj/item/paper/fluff/stations/chef/fishing(src)
