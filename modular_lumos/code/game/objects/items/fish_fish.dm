#define YOUNG_FISH 	2
#define MIDDLE_FISH 0
#define OLD_FISH 	7

#define MALE_FISH	0
#define FEMALE_FISH	1

/obj/item/fish_box
	name = "fish box"
	icon = 'modular_lumos/icons/obj/fish_items.dmi'
	icon_state = "box"
	desc = "A box that is storing a fish. Just open it up and get your two fishes. Random sexes!"

	var/obj/item/fishy/inside_fish

/obj/item/fish_box/salmon
	name = "salmon box"
	inside_fish = /obj/item/fishy/salmon

/obj/item/fish_box/shrimp
	name = "shrimp box"
	inside_fish = /obj/item/fishy/shrimp

/obj/item/fish_box/lobster
	name = "lobster box"
	inside_fish = /obj/item/fishy/lobster

/obj/item/fish_box/catfish
	name = "catfish box"
	inside_fish = /obj/item/fishy/catfish

/obj/item/fish_box/attack_self(mob/user)
	if(inside_fish)
		for(var/i in 1 to 2)
			new inside_fish(get_turf(user))
		qdel(src)

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
	if(dead)
		return

	if(world.time < timed_aging)
		return

	timed_aging = world.time + 5 SECONDS

	age++
	if(prob(age / 10))
		switch(ageStatus)
			if(YOUNG_FISH)
				ageStatus = MIDDLE_FISH
			if(MIDDLE_FISH)
				ageStatus = OLD_FISH
			if(OLD_FISH)
				maxHealth--
		age = 0

	hunger--
	if(hunger <= 0)
		hunger = 0
		health--
	else if(hunger > 0)
		health++

	if(!in_tank)
		health -= 2

	if(health > maxHealth)
		health = maxHealth
	if(health <= 0)
		health = 0
		dead = TRUE
		return
	

/obj/item/fishy/attackby(obj/item/I, mob/living/user, params)
	if(I.get_sharpness())
		to_chat(user, "<span class='notice'>You begin to butcher [I]...</span>")
		playsound(I.loc, 'modular_skyrat/sound/effects/butcher.ogg', 50, TRUE, -1)
		if(!do_after(user, 4 SECONDS, FALSE, src))
			return
		for(var/spawned_meat in meat)
			for(var/i in 1 to rand(1,3))
				new spawned_meat(get_turf(src))
		new /obj/effect/gibspawner/generic(get_turf(src))
		qdel(src)
		return
	else if(istype(I, /obj/item/fish_tool/analyzer))
		interact(user)
		return
	else
		return ..()

/obj/item/fishy/interact(mob/user)
	var/age_string = null
	switch(ageStatus)
		if(2)
			age_string = "YOUNG"
		if(0)
			age_string = "MIDDLE"
		if(7)
			age_string = "OLD"
	var/dat = {"
		<center>
			<div class='statusDisplay'>
				Fish One: [name]<br>
				<br>
				Sex: [sex ? "FEMALE" : "MALE"]<br>
				Age: [age_string]<br>
				Health: [health]/[maxHealth]<br>
				Hunger: [hunger]/[maxHunger]
			</div>
		</center>
		"}

	var/datum/browser/popup = new(user, "fish_analyzer", name, 225, 225)
	popup.set_content(dat)
	popup.open()
	
/obj/item/fishy/salmon
	name = "salmon"
	desc = "A salmon... fish that love to swim back to home."
	spawned_egg = /obj/item/fishy_egg/salmon
	icon_state = "salmon"
	meat = list(/obj/item/reagent_containers/food/snacks/salmon_raw)

/obj/item/fishy/shrimp
	name = "shrimp"
	desc = "A shrimp... look at it's beady little eyes!"
	spawned_egg = /obj/item/fishy_egg/shrimp
	icon_state = "shrimp_raw"
	meat = list(/obj/item/reagent_containers/food/snacks/shrimp_raw)

/obj/item/fishy/lobster
	name = "lobster"
	desc = "A lobster... look at it's beady little eyes!"
	spawned_egg = /obj/item/fishy_egg/lobster
	icon_state = "lobster"
	meat = list(/obj/item/reagent_containers/food/snacks/lobster_raw, /obj/item/reagent_containers/food/snacks/lobster_raw_tail)

/obj/item/fishy/catfish
	name = "catfish"
	desc = "A catfish... careful, it can hurt you."
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
