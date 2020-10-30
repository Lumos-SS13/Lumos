/**
  * Shafra is the base, repurposed from Baycode
  * Uses Urksani as new name, intended to be a large, fast, and deadly, but is mildly weaker than a Goliath
  * Intended to rush a player
  * -Fajetti
*/

/mob/living/simple_animal/hostile/shafra
	name = "shafra"
	desc = "A Bogani Hunting Dog"
	icon = 'modular_lumos/icons/mob/simplemobs/shafra.dmi'
	icon_state = "shafra"
	icon_living = "shafra"
	icon_dead = "shafra_dead"
	maxHealth = 100
	health = 100
	speak_emote = list("harks")
	emote_hear = list("growls")
	friendly_verb_continuous = "nuzzles"
	friendly_verb_simple = "nuzzle"
	melee_damage_lower = 25
	melee_damage_upper = 35
	attack_verb_continuous = "flays"
	attack_verb_simple = "flay"
	vision_range = 4
	aggro_vision_range = 7
	minbodytemp = 90
	maxbodytemp = 1000

	speed = 2

/mob/living/simple_animal/hostile/shafra/wild
	name = "urksani"
	desc = "A huge and hostile canine-like creature that hunts alone. Their name means 'Flesh Ripper' in Uthani speak."
	icon = 'modular_lumos/icons/mob/simplemobs/shafra.dmi'
	icon_state = "shafra"
	icon_living = "shafra"
	icon_dead = "shafra_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	maxHealth = 200
	health = 200
	attack_verb_continuous = "pulverizes"
	attack_verb_simple = "pulverize"
	attack_sound = 'modular_lumos/sound/weapons/biteheavy.ogg'
	speak_emote = list("harks")
	emote_hear = list("growls")
	friendly_verb_continuous = "nuzzles"
	friendly_verb_simple = "nuzzle"
	melee_damage_lower = 25
	melee_damage_upper = 35
	attack_verb_continuous = "flays"
	attack_verb_simple = "flay"
	a_intent = INTENT_HARM
	vision_range = 4
	aggro_vision_range = 7
	minbodytemp = 90
	maxbodytemp = 1000
	robust_searching = 1
	wander = TRUE
	faction = list("hostile")


	speed = 2
