#define NONE_TIER		0
#define BDM_TIER		1
#define DFM_TIER		2
#define DRAKE_TIER		3
#define HIERO_TIER		4
#define GLAD_TIER		5
#define COLOSS_TIER		6
#define BUBBLE_TIER		7
#define ROGUE_TIER		8
#define GOAT_TIER		9
#define SIF_TIER		10
#define WENDIG_TIER		11
#define LEGION_TIER		12

/obj/structure/closet/crate/necropolis/tendril/broodmother
/obj/structure/closet/crate/necropolis/tendril/broodmother/PopulateContents()
	. = ..()
	new /obj/item/crusher_trophy/broodmother_tongue(src)

/obj/structure/closet/crate/necropolis/tendril/legionnaire
/obj/structure/closet/crate/necropolis/tendril/legionnaire/PopulateContents()
	. = ..()
	new /obj/item/crusher_trophy/legionnaire_spine(src)

/obj/structure/closet/crate/necropolis/tendril/candy
/obj/structure/closet/crate/necropolis/tendril/candy/PopulateContents()
	. = ..()
	new /obj/item/bloodcrawlbottle(src)

/obj/structure/closet/crate/necropolis/tendril/pandora
/obj/structure/closet/crate/necropolis/tendril/pandora/PopulateContents()
	. = ..()
	new /obj/item/clothing/accessory/pandora_hope(src)

/obj/structure/closet/crate/necropolis/tendril/priest
/obj/structure/closet/crate/necropolis/tendril/priest/PopulateContents()
	. = ..()
	new /obj/item/melee/diamondaxe(src)

/obj/structure/closet/crate/necropolis/tendril/herald
/obj/structure/closet/crate/necropolis/tendril/herald/PopulateContents()
	. = ..()
	new /obj/item/clothing/neck/cloak/herald_cloak(src)

/obj/structure/closet/crate/necropolis/tendril/drakeling
/obj/structure/closet/crate/necropolis/tendril/drakeling/PopulateContents()
	. = ..()
	new /obj/item/borg/upgrade/modkit/fire(src)

/area/summoning_altar
	name = "Mysterious Ruin"
	requires_power = FALSE
	has_gravity = TRUE
	noteleport = TRUE
	blob_allowed = FALSE

/obj/structure/summoning_altar
	name = "mysterious rune"
	desc = "A rune that looks active... how long has it been since it's creation?"
	icon = 'modular_lumos/icons/obj/summoning_altar.dmi'
	icon_state = "rune"
	anchored = TRUE
	density = FALSE
	opacity = FALSE

	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/summoned_reward
	var/list/the_prey = list()
	var/list/the_hunters = list()

	var/area/summoned_area

	var/tier = BDM_TIER
	var/summoned_tier = NONE_TIER

/obj/structure/summoning_altar/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	summoned_area = get_area(src)

/obj/structure/summoning_altar/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/summoning_altar/process()
	remove_dead_prey()
	summon_reward()
	check_prey_location()

/obj/structure/summoning_altar/proc/remove_dead_prey()
	if(the_prey.len > 0)
		for(var/mob/living/L in	the_prey)
			if(L?.stat == DEAD)
				the_prey -= L
	if(the_hunters.len > 0 && the_prey.len == 0)
		summoned_reward = null
		for(var/mob/living/simple_animal/hostile/H in the_hunters)
			the_hunters -= H
			qdel(H)

/obj/structure/summoning_altar/proc/summon_reward()
	if(the_hunters.len != 0)
		return
	if(summoned_reward)
		new summoned_reward(get_turf(src))
		summoned_reward = null
		the_prey = list()
	if(tier == summoned_tier)
		tier++

/obj/structure/summoning_altar/proc/check_prey_location()
	if(the_hunters.len <= 0 && the_prey.len <= 0)
		return
	for(var/mob/living/L in	the_prey)
		var/area/L_area = get_area(L)
		if(L_area == summoned_area)
			continue
		L.forceMove(get_turf(src))

/obj/structure/summoning_altar/attack_hand(mob/user)
	if(the_hunters.len > 0)
		to_chat(user, "<span class='warning'>There are already summoned creatures, defeat them before using this again.</span>")
		return
	var/choice = input(user, "Which class would you like?") as null|anything in list("Normal", "Elite", "Megafauna")
	if(!choice)
		return
	switch(choice)
		if("Normal")
			var/choice1 = input(user, "What mob would you like?") as null|anything in list("Goliath", "Watcher", "Legion", "Shambling", "Imp", "Whelp", "Ice Demon")
			if(!choice1)
				return
			switch(choice1)
				if("Goliath")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/goliath/beast, reward_chest = /obj/structure/closet/crate/necropolis/tendril, spawn_amount = 4)
				if("Watcher")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/basilisk/watcher, special = TRUE, reward_chest = /obj/structure/closet/crate/necropolis/tendril, spawn_amount = 4)
				if("Legion")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/hivelord/legion, special = TRUE, reward_chest = /obj/structure/closet/crate/necropolis/tendril, spawn_amount = 4)
				if("Shambling")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/miner, reward_chest = /obj/structure/closet/crate/necropolis/tendril, spawn_amount = 4)
				if("Imp")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/imp, reward_chest = /obj/structure/closet/crate/necropolis/tendril, spawn_amount = 3)
				if("Whelp")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/ice_whelp, reward_chest = /obj/structure/closet/crate/necropolis/tendril, spawn_amount = 3)
				if("Ice Demon")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/ice_demon, reward_chest = /obj/structure/closet/crate/necropolis/tendril, spawn_amount = 3)
		if("Elite")
			var/choice2 = input(user, "What mob would you like?") as null|anything in list("Broodmother", "Herald", "Legionnaire", "Pandora", "Candy", "Drakeling", "Priest")
			if(!choice2)
				return
			switch(choice2)
				if("Broodmother")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/elite/broodmother, reward_chest = /obj/structure/closet/crate/necropolis/tendril/broodmother)
				if("Herald")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/elite/herald, reward_chest = /obj/structure/closet/crate/necropolis/tendril/herald)
				if("Legionnaire")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/elite/legionnaire, reward_chest = /obj/structure/closet/crate/necropolis/tendril/legionnaire)
				if("Pandora")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/elite/pandora, reward_chest = /obj/structure/closet/crate/necropolis/tendril/pandora)
				if("Candy")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/elite/candy, reward_chest = /obj/structure/closet/crate/necropolis/tendril/candy)
				if("Drakeling")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/elite/drakeling, reward_chest = /obj/structure/closet/crate/necropolis/tendril/drakeling)
				if("Priest")
					summon_mob_type(/mob/living/simple_animal/hostile/asteroid/elite/minerpriest, reward_chest = /obj/structure/closet/crate/necropolis/tendril/priest)
		if("Megafauna")
			var/list/megafauna_choosing = list(
				"Blood Drunk Miner",
				"Demonic Frost Miner",
				"Drake",
				"Hierophant",
				"Gladiator",
				"Colossus",
				"Bubblegum",
				"Rogue Process",
				"Goat King",
				"Sif",
				"Wendigo",
				"Legion"
			)
			var/choice3 = input(user, "What mob would you like?") as null|anything in megafauna_choosing
			if(!choice3)
				return
			switch(choice3)
				if("Blood Drunk Miner")
					if(!correct_tiering(1))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/blood_drunk_miner)
				if("Demonic Frost Miner")
					if(!correct_tiering(2))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/demonic_frost_miner)
				if("Drake")
					if(!correct_tiering(3))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/dragon)
				if("Hierophant")
					if(!correct_tiering(4))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/hierophant)
				if("Gladiator")
					if(!correct_tiering(5))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/gladiator)
				if("Colossus")
					if(!correct_tiering(6))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/colossus)
				if("Bubblegum")
					if(!correct_tiering(7))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/bubblegum)
				if("Rogue Process")
					if(!correct_tiering(8))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/rogueprocess)
				if("Goat King")
					if(!correct_tiering(9))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/king)
				if("Sif")
					if(!correct_tiering(10))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/sif)
				if("Wendigo")
					if(!correct_tiering(11))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/wendigo)
				if("Legion")
					if(!correct_tiering(12))
						return
					summon_mob_type(/mob/living/simple_animal/hostile/megafauna/legion)

/obj/structure/summoning_altar/proc/correct_tiering(num = null)
	if(num)
		if(num <= tier)
			summoned_tier = num
			return TRUE
	return FALSE

mob/living/simple_animal/hostile
	var/obj/structure/summoning_altar/summon_altar

mob/living/simple_animal/hostile/death()
	. = ..()
	if(summon_altar)
		summon_altar.the_hunters -= src

mob/living/simple_animal/hostile/Destroy()
	. = ..()
	if(summon_altar)
		summon_altar.the_hunters -= src

mob/living/simple_animal/hostile/proc/check_altar()
	if(summon_altar)
		summon_altar.the_hunters += src

/obj/structure/summoning_altar/proc/summon_mob_type(mob/living/simple_animal/hostile/choice, special = FALSE, obj/reward_chest, spawn_amount = 1)
	if(!choice)
		return
	for(var/mob/living/L in range(10, src))
		the_prey += L
	for(var/i in 1 to spawn_amount)
		var/mob/living/simple_animal/hostile/spawning_choice = new choice(get_turf(src))
		spawning_choice.summon_altar = src
		spawning_choice.check_altar()
	if(reward_chest)
		summoned_reward = reward_chest
	if(special)
		if(istype(choice, /mob/living/simple_animal/hostile/asteroid/basilisk/watcher))
			if(prob(25))
				new /mob/living/simple_animal/hostile/asteroid/basilisk/watcher/magmawing(get_turf(src))
			else if(prob(25))
				new /mob/living/simple_animal/hostile/asteroid/basilisk/watcher/icewing(get_turf(src))
		if(istype(choice, /mob/living/simple_animal/hostile/asteroid/hivelord/legion))
			if(prob(25))
				new /mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf(get_turf(src))
			else if(prob(25))
				new /mob/living/simple_animal/hostile/asteroid/hivelord/legion/beegion(get_turf(src))

#undef NONE_TIER
#undef BDM_TIER		
#undef DFM_TIER		
#undef DRAKE_TIER		
#undef HIERO_TIER		
#undef GLAD_TIER		
#undef COLOSS_TIER		
#undef BUBBLE_TIER		
#undef ROGUE_TIER		
#undef GOAT_TIER		
#undef SIF_TIER		
#undef WENDIG_TIER		
#undef LEGION_TIER		
