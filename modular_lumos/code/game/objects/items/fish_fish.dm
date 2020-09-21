#define YOUNG_FISH 	0
#define MIDDLE_FISH 1
#define OLD_FISH 	2

#define MALE_FISH	0
#define FEMALE_FISH	1

/obj/item/fishy
	name = "fish"
	desc = "parent fish, do not use"
	icon = 'modular_lumos/icons/obj/fish_items.dmi'

	///Sex: either male or female
	//Im sorry, but only male and female fish can breed together
	var/sex = MALE_FISH

	///Age: how old the fish is.
	//Fish get older. They can't breed when young, and can't breed when old.
	//as they get older, their max health goes down, until 0
	//young age is a 1/4, middle age is 2/4s, and old age is a 1/4
	var/age = 0

	var/ageStatus = YOUNG_FISH

	///In-tank: if the fish is in the tank, it doesn't get hurt.
	var/in_tank = FALSE

	///Health: maxhealth is the max health, health is the current health
	//if a fish hits 0, it dies and cannot breed.
	//if it is not hungry and inside a tank, it will gain health back
	var/maxHealth = 100
	var/health = 100

	///Hunger: maxhunger is the max hunger, hunger is the current hunger
	//if a fish hits 0, it starts losing health
	//while starving, a fish will not produce. they will also age much faster
	var/hunger = 100
	var/maxHunger = 100

	///Dead: the status if its dead.
	//if dead, the tank will start to get dirty faster, and the other fish will start to lose health as well
	var/dead = FALSE

	///Breedable: the status if it can breed
	//breedable only at the middle age. 
	var/breedable = FALSE

	//this is for the process to do every 5 seconds
	var/timed_aging

	///Spawned-Egg: what egg is spawned when there is a male and female that are ready to breed
	var/obj/item/fishy_egg/spawned_egg

	var/meat

/obj/item/fishy/Initialize()
	. = ..()
	if(prob(50))
		sex = MALE_FISH
	else
		sex = FEMALE_FISH
	START_PROCESSING(SSobj, src)

/obj/item/fishy/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/fishy/process()
	if(!in_tank)
		health--

	if(dead)
		return

	if(world.time < timed_aging)
		return

	timed_aging = world.time + 5 SECONDS

	age++
	if(prob(age / 5))
		switch(ageStatus)
			if(YOUNG_FISH)
				ageStatus = MIDDLE_FISH
				breedable = TRUE
			if(MIDDLE_FISH)
				ageStatus = OLD_FISH
				breedable = FALSE
			if(OLD_FISH)
				maxHealth--
		age = 0

	if(health > maxHealth)
		health = maxHealth
	if(health <= 0)
		health = 0
		dead = TRUE
		return
	
	hunger--
	if(hunger <= 0)
		hunger = 0
		health--
	else
		health++

/obj/item/fishy/attackby(obj/item/I, mob/living/user, params)
	if(I.get_sharpness())
		to_chat(user, "<span class='notice'>You begin to butcher [I]...</span>")
		playsound(I.loc, 'modular_skyrat/sound/effects/butcher.ogg', 50, TRUE, -1)
		if(!do_after(user, 4 SECONDS, FALSE, src))
			return
		for(var/spawned_meat in meat)
			new spawned_meat(get_turf(src))
		new /obj/effect/gibspawner/generic(get_turf(src))
		qdel(src)
		return
	else if(istype(I, /obj/item/fish_tool/analyzer))
		var/age_string = null
		switch(fish.ageStatus)
			if(0)
				age_string = "YOUNG"
			if(1)
				age_string = "MIDDLE"
			if(2)
				age_string = "OLD"
		playsound(src.loc, 'sound/machines/chime.ogg', 50, TRUE, -1)
		to_chat(user, "<span class='notice'>---</span>")
		to_chat(user, "<span class='notice'>[name]:</span>")
		to_chat(user, "<span class='notice'>Sex: [sex ? "FEMALE" : "MALE"]</span>")
		to_chat(user, "<span class='notice'>Age: [age_string]</span>")
		to_chat(user, "<span class='notice'>Breedable: [breedable ? "TRUE" : "FALSE"]</span>")
		to_chat(user, "<span class='notice'>Health: [health]/[maxHealth]</span>")
		to_chat(user, "<span class='notice'>Hunger: [hunger]/[maxHunger]</span>")
		to_chat(user, "<span class='notice'>---</span>")
		return
	else
		return ..()

/obj/item/fishy/salmon
	name = "salmon"
	spawned_egg = /obj/item/fishy_egg/salmon
	icon_state = "salmon"
	meat = list(/obj/item/reagent_containers/food/snacks/salmon_raw)

/obj/item/fishy/shrimp
	name = "shrimp"
	spawned_egg = /obj/item/fishy_egg/shrimp
	icon_state = "shrimp"
	meat = list(/obj/item/reagent_containers/food/snacks/shrimp_raw)

/obj/item/fishy/lobster
	name = "lobster"
	spawned_egg = /obj/item/fishy_egg/lobster
	icon_state = "lobster"
	meat = list(/obj/item/reagent_containers/food/snacks/lobster_raw, /obj/item/reagent_containers/food/snacks/lobster_raw_tail)

/obj/item/fishy/catfish
	name = "lobster"
	spawned_egg = /obj/item/fishy_egg/catfish
	icon_state = "catfish"
	meat = list(/obj/item/reagent_containers/food/snacks/catfish_raw)

/obj/item/fishy_egg
	name = "fish egg"
	desc = "A fertilized fish egg waiting to hatch."
	icon = 'modular_lumos/icons/obj/fish_items.dmi'

	var/killed = FALSE

	var/obj/item/fishy/fish_parent

/obj/item/fishy_egg/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/fish_tool/egg_killer))
		visible_message("<span class='notice'>The egg stops shaking, the life fading from it.</span>")
		new /obj/item/reagent_containers/food/snacks/fish_eggs(get_turf(src))
		qdel(src)
	else
		return ..()

/obj/item/fishy_egg/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/hatch_egg), 2 MINUTES)

/obj/item/fishy_egg/proc/hatch_egg()
	if(!fish_parent)
		return
	new fish_parent(get_turf(src))
	qdel(src)

/obj/item/fishy_egg/salmon
	fish_parent = /obj/item/fishy/salmon
	icon_state = "salmon_eggs"

/obj/item/fishy_egg/shrimp
	fish_parent = /obj/item/fishy/shrimp
	icon_state = "shrimp_eggs"

/obj/item/fishy_egg/lobster
	fish_parent = /obj/item/fishy/lobster
	icon_state = "salmon_eggs"

/obj/item/fishy_egg/catfish
	fish_parent = /obj/item/fishy/catfish
	icon_state = "catfish_eggs"
