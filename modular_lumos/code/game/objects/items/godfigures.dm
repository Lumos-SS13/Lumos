/obj/item/godfig
	name = "religious icon"
	desc = "A painted holy figure of a plain looking human man in a robe."
	//description_info = "Right click to select a new sprite to fit your needs."
	icon = 'modular_lumos/icons/obj/godfigures.dmi'
	icon_state = "mrobe"
	force = 0
	throw_speed = 1
	throw_range = 4
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL

/obj/item/godfig/frobe
	name = "Painted - Robed Human Female"
	desc = "A painted holy figure of a plain looking human woman in a robe."
	icon_state = "frobe"

/obj/item/godfig/mrobe
	name = "Painted - Robed Human Male (Pale)"
	desc = "A painted holy figure of a plain looking human man in a robe."
	icon_state = "mrobe"

/obj/item/godfig/mrobedark
	name = "Painted - Robed Human Male (Dark)"
	desc = "A painted holy figure of a plain looking human man in a robe."
	icon_state = "mrobedark"

// /obj/item/choice_beacon/godfig
// 	name = "religious icon"
// 	desc = "A painted holy figure of a plain looking human man in a robe."
// 	icon = 'modular_lumos/icons/obj/godfigures.dmi'
// 	icon_state = "mrobe"

/obj/item/choice_beacon/box/godfig
	name = "choice box (religious icons)"
	desc = "Think really hard about what you want, and then rip it open!"
	icon = 'icons/obj/storage.dmi'
	icon_state = "deliverypackage3"
	item_state = "deliverypackage3"

// yoinked from plushie box code
/obj/item/choice_beacon/box/godfig/generate_display_names()
	var/list/fig_list = list()
	var/list/fig_set = subtypesof(/obj/item/godfig)
	for(var/V in fig_set)
		var/atom/A = V
		fig_list[initial(A.name)] = A
	return fig_list

/obj/item/choice_beacon/box/godfig/spawn_option(choice,mob/living/M)
	M.temporarilyRemoveItemFromInventory(src, TRUE)
	M.put_in_hands(new choice)
	qdel(src)

/*
/obj/item/godfig/verb/resprite_figure()
	set name = "Customize Figure"
	set category = "Object"
	set desc = "Click to choose an appearance for your icon."

	var/mob/M = usr
	var/list/options = list()
	options["Painted - Robed Human Female"] = "frobe"
	options["Painted - Robed Human Male (Pale)"] = "mrobe"
	options["Painted - Robed Human Male (Dark)"] = "mrobedark"
	options["Painted - Robed Human Male (Janitor)"] = "mrobejani"
	options["Painted - Bearded Human"] = "mpose"
	options["Painted - Human Male Warrior"] = "mwarrior"
	options["Painted - Human Female Warrior"] = "fwarrior"
	options["Painted - Human Male Hammer"] = "hammer"
	options["Painted - Horned God"] = "horned"
	options["Obsidian - Human Male"] = "onyxking"
	options["Obsidian - Human Female"] = "onyxqueen"
	options["Obsidian - Animal Headed Male"] = "onyxanimalm"
	options["Obsidian - Animal Headed Female"] = "onyxanimalf"
	options["Obsidian - Bird Headed Figure"] = "onyxbird"
	options["Stone - Seated Figure"] = "stoneseat"
	options["Stone - Head"] = "stonehead"
	options["Stone - Dwarf"] = "stonedwarf"
	options["Stone - Animal"] = "stoneanimal"
	options["Stone - Fertility"] = "stonevenus"
	options["Stone - Snake"] = "stonesnake"
	options["Bronze - Elephantine"] = "elephant"
	options["Bronze - Many-armed"] = "bronzearms"
	options["Robot"] = "robot"
	options["Singularity"] = "singularity"
	options["Meteor"] = "meteor"
	options["Gemstone Eye"] = "gemeye"
	options["Golden Skull"] = "skull"
	options["Goatman"] = "devil"
	options["Lightbulb"] = "lumos"
	options["Sun Gem"] = "sun"
	options["Moon Gem"] = "moon"
	options["Racial - Uthani Figure"] = "lizrobe"
	options["Racial - Plasmaman Figure"] = "plasmeme"
	options["Racial - Dwarf Figure"] = "dorf"
	options["Racial - IPC Figure"] = "robobitch"
	options["Racial - Mothman Figure"] = "retardbug"

	var/choice = input(M,"Choose your icon!","Customize Figure") in options
	if(src && choice && !M.stat && in_range(M,src))
		icon_state = options[choice]
		if(options[choice] == "frobe")
			desc = "A painted holy figure of a plain looking human woman in a robe."
		else if(options[choice] == "mrobe")
			desc = "A painted holy figure of a plain looking human man in a robe."
		else if(options[choice] == "mrobedark")
			desc = "A painted holy figure of a plain looking human man in a robe."
		else if(options[choice] == "mrobejani")
			desc = "A painted holy figure of a plain looking human man in a robe."
		else if(options[choice] == "mpose")
			desc = "A painted holy figure of a rather grandiose bearded human."
		else if(options[choice] == "mwarrior")
			desc = "A painted holy figure of a powerful human male warrior."
		else if(options[choice] == "fwarrior")
			desc = "A painted holy figure of a powerful human female warrior."
		else if(options[choice] == "hammer")
			desc = "A painted holy figure of a human holding a hammer aloft."
		else if(options[choice] == "horned")
			desc = "A painted holy figure of a human man crowned with antlers."
		else if(options[choice] == "onyxking")
			desc = "An obsidian holy figure of a human man wearing a grand hat."
		else if(options[choice] == "onyxqueen")
			desc = "An obsidian holy figure of a human woman wearing a grand hat."
		else if(options[choice] == "onyxanimalm")
			desc = "An obsidian holy figure of a human man with the head of an animal."
		else if(options[choice] == "onyxanimalf")
			desc = "An obsidian holy figure of a human woman with the head of an animal."
		else if(options[choice] == "onyxbird")
			desc = "An obsidian holy figure of a human with the head of a bird."
		else if(options[choice] == "stoneseat")
			desc = "A stone holy figure of a cross-legged human."
		else if(options[choice] == "stonehead")
			desc = "A stone holy figure of an imposing crowned head."
		else if(options[choice] == "stonedwarf")
			desc = "A stone holy figure of a somewhat ugly dwarf."
		else if(options[choice] == "stoneanimal")
			desc = "A stone holy figure of a four-legged animal of some sort."
		else if(options[choice] == "stonevenus")
			desc = "A stone holy figure of a lovingly rendered pregnant woman."
		else if(options[choice] == "stonesnake")
			desc = "A stone holy figure of a coiled snake ready to strike."
		else if(options[choice] == "elephant")
			desc = "A bronze holy figure of a dancing human with the head of an elephant."
		else if(options[choice] == "bronzearms")
			desc = "A bronze holy figure of a human.with four arms."
		else if(options[choice] == "robot")
			desc = "A titanium holy figure of a synthetic humanoid."
		else if(options[choice] == "singularity")
			desc = "A holy figure of some kind of energy formation."
		else if(options[choice] == "meteor")
			desc = "A holy figure of an ominous meteor."
		else if(options[choice] == "gemeye")
			desc = "A gemstone holy figure of a sparkling eye."
		else if(options[choice] == "skull")
			desc = "A golden holy figure of a humanoid skull."
		else if(options[choice] == "devil")
			desc = "A painted holy figure of a seated humanoid goat with wings."
		else if(options[choice] == "lumos")
			desc = "A holy figure of a lightbulb."
		else if(options[choice] == "sun")
			desc = "A holy figure of a star."
		else if(options[choice] == "moon")
			desc = "A holy figure of a small planetoid."
		else if(options[choice] == "lizrobe")
			desc = "A painted holy figure of a plain looking Uthani in a robe."
		else if(options[choice] == "plasmeme")
			desc = "A painted holy figure of a plain looking Plasma Skeleton."
		else if(options[choice] == "dorf")
			desc = "A painted holy figure of a Dwarf brandishing a gilded hammer."
		else if(options[choice] == "robobitch")
			desc = "A painted holy figure of a plain looking IPC."
		else if(options[choice] == "retardbug")
			desc = "A painted holy figure of a plain looking Moth brandishing a torch."

		to_chat(M, "The religious icon is now a [choice]. Praise be!")
		return 1
*/
