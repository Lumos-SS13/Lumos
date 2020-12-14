/*
* Another Baycode I stole. All dmis are their making, thanks guys!
* Armalis (renamed Varyx) are sentient bird-people. They're a ruin mob.
* Should attack with basic attack til horizontal, fairly dangerous.
*/
mob/living/simple_animal/hostile/varyx
	name = "Varyx"
	desc = "A large humanoid avian, it doesn't look very happy to see you."
	icon = 'modular_lumos/icons/mob/simplemobs/armalis.dmi'
	icon_state = "armalis_naked"
	icon_living = "armalis_naked"
	icon_dead = "armalis_naked_dead"
	health = 225
	maxHealth = 225
	speak = list("GOR GOR GOR!", "Squack!", "RASHAFA!")
	speak_emote = list("screeches", "boofs")
	attack_verb_continuous = "scratches"
	attack_verb_simple = "scratch"
	attack_sound = 'sound/effects/bang.ogg'
	melee_damage_lower = 20
	melee_damage_upper = 25
	emote_taunt = list("mutters")
	taunt_chance = 25
	emote_hear = list("chitters.", "grunts.","screeches.")
	emote_see = list("shakes its head.", "shivers.")
	faction = ("mining")
	speed = 2
	wander = TRUE
	
	pixel_x = -5

/mob/living/simple_animal/hostile/varyx/armored
	name = "Varyx Legionary"
	desc = "A trained warrior, his purpose: To end you."
	icon_state = "armalis_armored"
	icon_living = "armalis_armored"
	icon_dead = "armalis_armored_dead"
	faction = ("mining")
	wander = TRUE

	health = 275
	maxHealth = 275
	speed = 3
