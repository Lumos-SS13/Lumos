//Passive mobs

/obj/effect/spawner/mobspawner/spacecat
	name = "50% space cat spawner"
	loot = list(
		/mob/living/simple_animal/pet/cat/space = 50,
		"" = 50)

//Hostile mobs

/obj/effect/spawner/mobspawner/cratemimic
	name = "40% crate mimic spawner"
	loot = list(
		/mob/living/simple_animal/hostile/mimic = 40,
		"" = 60)
