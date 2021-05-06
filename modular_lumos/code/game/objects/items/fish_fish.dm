#define YOUNG_FISH 	2
#define MIDDLE_FISH 0
#define OLD_FISH 	7

#define MALE_FISH	0
#define FEMALE_FISH	1

/obj/item/fish_box
	name = "fish box"
	icon = 'modular_lumos/icons/obj/fish_items.dmi'
	icon_state = "box"
	desc = "A box that stores fish. It has a breeding pair of Fish/Crustaceans inside to get your aquaculture farm tanks started."

	w_class = WEIGHT_CLASS_SMALL

	var/obj/item/fishy/inside_fish

/obj/item/fish_box/salmon
	name = "salmon box"
	icon_state = "box_salmon"
	inside_fish = /obj/item/fishy/salmon

/obj/item/fish_box/salmon/steelhead
	name = "steelhead box"
	icon_state = "box_steelhead"
	inside_fish = /obj/item/fishy/salmon/steelhead

/obj/item/fish_box/shrimp
	name = "shrimp box"
	icon_state = "box_shrimp"
	inside_fish = /obj/item/fishy/shrimp

/obj/item/fish_box/lobster
	name = "lobster box"
	icon_state = "box_lobster"
	inside_fish = /obj/item/fishy/lobster

/obj/item/fish_box/lobster/rock
	name = "rock lobster box"
	icon_state = "box_lobster_rock"
	inside_fish = /obj/item/fishy/lobster/rock

/obj/item/fish_box/catfish
	name = "catfish box"
	icon_state = "box_catfish"
	inside_fish = /obj/item/fishy/catfish

/obj/item/fish_box/minicarp
	name = "lesser carp box"
	icon_state = "box_carp"
	inside_fish = /obj/item/fishy/minicarp

/obj/item/fish_box/devil
	name = "sea devil box"
	icon_state = "box_devil"
	inside_fish = /obj/item/fishy/seadevil

/obj/item/fish_box/shark
	name = "shark box"
	icon_state = "box_shark"
	inside_fish = /obj/item/fishy/shark

/obj/item/fish_box/asteroid_worm
	name = "asteroid worm box"
	icon_state = "box_asterworm"
	inside_fish = /obj/item/fishy/asteroid_worm

/obj/item/fish_box/attack_self(mob/user)
	if(inside_fish)
		for(var/i in 1 to 2)
			var/obj/item/fishy/f = new inside_fish(get_turf(user))
			if(i == 1) // This is awful and will need to get changed sooner or later, effectively makes the boxes have a set male and female in them.
				f.sex = MALE_FISH
			else
				f.sex = FEMALE_FISH
		qdel(src)

/obj/item/fishy
	name = "fish"
	desc = "parent fish, do not use"
	icon = 'modular_lumos/icons/obj/fish.dmi'
	icon_state = "fish"

	///Sex: either male or female
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

	w_class = WEIGHT_CLASS_SMALL

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
	desc = "More specifically a Sockeye Salmon, cherished for its rich taste by spacefarers and space bears alike."
	spawned_egg = /obj/item/fishy_egg/salmon
	icon_state = "salmon"
	meat = list(/obj/item/reagent_containers/food/snacks/salmon_raw)

/obj/item/fishy/salmon/steelhead
	name = "steelhead salmon"
	desc = "A sub-species of salmon. Their skull is comprised of a organic stone-like substance."
	spawned_egg = /obj/item/fishy_egg/salmon/steelhead
	icon_state = "steelhead"
	meat = list(/obj/item/reagent_containers/food/snacks/salmon_raw, /obj/item/stack/ore/iron)

/obj/item/fishy/lavafish
	name = "lava-hopper"
	desc = "A creature unique to NT8248-B, it has a thick, scaly dermis impregnated with iron throughout. A very tough fish."
	spawned_egg = /obj/item/fishy_egg/lavafish
	icon_state = "lava_fish"
	meat = list(/obj/item/reagent_containers/food/snacks/lavafish_raw, /obj/item/stack/ore/iron)

/obj/item/fishy/shrimp
	name = "shrimp"
	desc = "Technically speaking... This is like the cockroach of the sea."
	spawned_egg = /obj/item/fishy_egg/shrimp
	icon_state = "shrimp_raw"
	meat = list(/obj/item/reagent_containers/food/snacks/shrimp_raw)

/obj/item/fishy/lobster
	name = "lobster"
	desc = "Rest assured, this one won't talk. Usually."
	spawned_egg = /obj/item/fishy_egg/lobster
	icon_state = "lobster"
	meat = list(/obj/item/reagent_containers/food/snacks/lobster_raw, /obj/item/reagent_containers/food/snacks/lobster_raw_tail)

/obj/item/fishy/lobster/rock
	name = "rock lobster"
	desc = "Found under space piers, often to a suprising capacity."
	spawned_egg = /obj/item/fishy_egg/lobster/rock
	icon_state = "lobster_rock"
	meat = list(/obj/item/reagent_containers/food/snacks/lobster_raw = 1, /obj/item/reagent_containers/food/snacks/lobster_raw_tail, /obj/item/stack/ore/iron)

/obj/item/fishy/catfish
	name = "catfish"
	desc = "Real men catch them by hand."
	spawned_egg = /obj/item/fishy_egg/catfish
	icon_state = "catfish"
	meat = list(/obj/item/reagent_containers/food/snacks/catfish_raw)

/obj/item/fishy/minicarp
	name = "lesser space carp"
	desc = "A small sub-species of space carp. Just as toxic, but a lot less likely to take a chunk out of you."
	spawned_egg = /obj/item/fishy_egg/minicarp
	icon_state = "tinycarp"
	meat = list(/obj/item/reagent_containers/food/snacks/carpmeat = 1)

/obj/item/fishy/seadevil
	name = "sea devil"
	desc = "A small vaugely humanoid astroform, supposedly gathered from asteroid ponds. It keeps twitching annoyingly."
	spawned_egg = /obj/item/fishy_egg/devil
	icon_state = "seadevil"
	meat = list(/obj/item/reagent_containers/food/snacks/seadevil_raw)

/obj/item/fishy/shark
	name = "assitant shark"
	desc = "A small species of shark capable of reproducing fast enough for aquaculture. Beware the greytide."
	spawned_egg = /obj/item/fishy_egg/shark
	icon_state = "shark"
	meat = list(/obj/item/reagent_containers/food/snacks/shark_raw = 2, /obj/item/reagent_containers/food/snacks/shark_raw_fin)

/obj/item/fishy/asteroid_worm
	name = "asteroid worm"
	desc = "A repulsive toxic slug found often in aquatic pools of orbital asteroids and occasionally hitching rides on larger astroforms."
	spawned_egg = /obj/item/fishy_egg/devil
	icon_state = "asteroid_worm"
	meat = list(/obj/item/reagent_containers/food/snacks/asteroid_worm = 1, /obj/item/reagent_containers/food/snacks/toxic_spines = 1)

/obj/item/fishy/space_eel
	name = "rock eel"
	desc = "A leathery predatory astroform often found in asteroid pools, mega-astroform's dermis, or up the Head of Security's rear."
	spawned_egg = /obj/item/fishy_egg/space_eel
	icon_state = "space_eel"
	meat = list(/obj/item/reagent_containers/food/snacks/space_eel_raw)

/obj/item/fishy/lavacrab
	name = "stone turner"
	desc = "A small pseudo-crustatcean native to exclusively to the subterranean jungles of NT8248-B. They eat small invertebrates, namely the ones under stones."
	spawned_egg = /obj/item/fishy_egg/lavacrab
	icon_state = "rock_crab"
	meat = list(/obj/item/reagent_containers/food/snacks/lavacrab_raw)

/obj/item/fishy_egg
	name = "fish egg"
	desc = "A fertilized fish egg waiting to hatch."
	icon = 'modular_lumos/icons/obj/fish.dmi'

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

/obj/item/fishy_egg/salmon/steelhead
	fish_parent = /obj/item/fishy/salmon/steelhead

/obj/item/fishy_egg/lavafish
	fish_parent = /obj/item/fishy/lavafish
	icon_state = "lava_eggs"

/obj/item/fishy_egg/shrimp
	fish_parent = /obj/item/fishy/shrimp
	icon_state = "shrimp_eggs"

/obj/item/fishy_egg/lobster
	fish_parent = /obj/item/fishy/lobster
	icon_state = "eggs_lobster"

/obj/item/fishy_egg/lobster/rock
	fish_parent = /obj/item/fishy/lobster/rock
	icon_state = "lava_eggs"

/obj/item/fishy_egg/catfish
	fish_parent = /obj/item/fishy/catfish
	icon_state = "catfish_eggs"

/obj/item/fishy_egg/minicarp
	fish_parent = /obj/item/fishy/minicarp
	icon_state = "eggs_tinycarp"

/obj/item/fishy_egg/devil
	fish_parent = /obj/item/fishy/seadevil
	icon_state = "eggs_devil"

/obj/item/fishy_egg/shark
	fish_parent = /obj/item/fishy/shark
	icon_state = "shark_eggs_new"

/obj/item/fishy_egg/asteroid_worm
	fish_parent = /obj/item/fishy/asteroid_worm
	icon_state = "worm_eggs"

/obj/item/fishy_egg/space_eel
	fish_parent = /obj/item/fishy/space_eel
	icon_state = "space_eel_eggs"

/obj/item/fishy_egg/lavacrab
	fish_parent = /obj/item/fishy/lavacrab
	icon_state = "lava_eggs"
