/*
 *
 *
 *  Things've changed, Boss. We pull in dosh, assistants, just to combat Syndicate... Rubbing our mops in bloody station dirt, all for revenge.
 *  NT calls for Janiwork, and we answer. No greater good, no just cause.
 *
 *  Syndies sent us to Lavaland... But we're going deeper.
 *
 *  I know, I'm already a Miner... Centcomms not my kinda place anyway.
 *
 *  Dogs of Service for nine whole years... That ends today. Now you're not cryo'd, and we're not maintenance hounds.
 *	We're Disinfecting Dogs.
 *
 *   We can crush the Syndicate, Boss. And you can build the army that can do it.
 *
 * Just one thing, Kaz... This isn't about the past. We're cleaning for the future.
 */

/mob/living/simple_animal/hostile/vadimclone
	name = "Vadim Kozlov"
	desc = "He doesn't look very stable."
	icon = 'modular_lumos/icons/mob/simplemobs/vadims.dmi'
	icon_state = "vadimclone"
	icon_living = "vadimclone"
	icon_dead = "vadimclone_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	response_help_continuous = "pushes"
	response_help_simple = "push"
	threat = 3
	speed = 0
	maxHealth = 115
	health = 115
	spacewalk = TRUE
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	speak_emote = list("blubbers")
	del_on_death = 1
	faction = list("hostile")
	robust_searching = 1
	wander = TRUE

	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/vadimclone/melee
	name = "Crazed Vadim Kozlov"
	desc = "He definitely doesn't look stable."
	icon_state = "vadimclonecrazed"
	icon_living = "vadimclonecrazed"
	icon_dead = "vadimclonecrazed_dead"
	melee_damage_lower = 30
	melee_damage_upper = 30
	armour_penetration = 35
	attack_verb_continuous = "bludgeons"
	attack_verb_simple = "bludgeon"
	attack_sound = 'sound/weapons/genhit1.ogg'
	loot = list(/obj/item/broom)
	speak_chance = 2
	speak = list("B-Blyat!","BLYAT!","N-NYET!")

	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/vadimclone/demon
	name = "Venom Goat"
	desc = "I'm already a Miner, Koz. Centcomm isn't my kinda place anyway."
	icon_state = "vadimclonedemon"
	icon_living = "vadimclonedemon"
	icon_dead = "vadimclonedemon_dead"
	melee_damage_lower = 10
	melee_damage_upper = 15
	armour_penetration = 25
	attack_verb_continuous = "bludgeons"
	attack_verb_simple = "bludgeon"
	attack_sound = 'sound/weapons/cqchit1.ogg'
	speak_chance = 2
	speak = list("Take him out!","Kept you waiting, huh?")

	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/vadimclone/bigpp
	name = "Vadim Kozlov"
	desc = "It's rude to stare..."
	icon_state = "vadimclonepp"
	icon_living = "vadimclonepp"
	icon_dead = "vadimclonepp_dead"
	melee_damage_lower = 10
	melee_damage_upper = 10
	armour_penetration = 5
	attack_verb_continuous = "bludgeons"
	attack_verb_simple = "bludgeon"
	attack_sound = 'sound/weapons/klonk.ogg'
	speak_chance = 2
	speak = list("Like it, da?")

	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/vadimclone/jabroni
	name = "Vadim Kozlov"
	desc = "He's got the wrong airlock... Leather Station 13 is two sectors down."
	icon_state = "vadimclonegachi"
	icon_living = "vadimclonegachi"
	icon_dead = "vadimclonegachi_dead"
	melee_damage_lower = 2
	melee_damage_upper = 2
	armour_penetration = 5
	attack_verb_continuous = "wrestles"
	attack_verb_simple = "wrestle"
	attack_sound = 'sound/weapons/thudswoosh.ogg'
	speak_chance = 2
	speak = list("Blyat you!","Oh, Vadim's shoulder!","Lube it up!")

	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/vadimclone/undies
	name = "Vadim Kozlov"
	desc = "The hell... ?"
	icon_state = "vadimcloneundies"
	icon_living = "vadimcloneundies"
	icon_dead = "vadimcloneundies_dead"
	melee_damage_lower = 1
	melee_damage_upper = 1
	armour_penetration = 5
	attack_verb_continuous = "wrestles"
	attack_verb_simple = "wrestle"
	attack_sound = 'modular_lumos/sound/voice/vadimask.ogg'

	footstep_type = FOOTSTEP_MOB_SHOE
