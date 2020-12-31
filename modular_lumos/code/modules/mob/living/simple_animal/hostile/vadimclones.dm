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
	speak_chance = 5
	turns_per_move = 5
	response_help_continuous = "pushes"
	response_help_simple = "push"
	threat = 3
	speed = 0
	maxHealth = 115
	health = 115
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 5
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	vision_range = 4
	aggro_vision_range = 7
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	speak_emote = list("blubbers")
	del_on_death = 0
	loot = list(/obj/effect/decal/cleanable/blood)
	faction = list("hostile")
	environment_smash = ENVIRONMENT_SMASH_NONE
	robust_searching = 1
	wander = TRUE

	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/vadimclone/melee
	name = "Crazed Vadim Kozlov"
	desc = "He definitely doesn't look stable."
	icon_state = "crazybroom"
	icon_living = "crazybroom"
	icon_dead = "crazed_dead"
	melee_damage_lower = 8
	melee_damage_upper = 17
	attack_verb_continuous = "bludgeons"
	attack_verb_simple = "bludgeon"
	attack_sound = 'sound/weapons/genhit1.ogg'
	loot = list(/obj/effect/decal/cleanable/blood, /obj/item/broom = 1)
	speak_chance = 10
	speak = list("B-Blyat!","BLYAT!","N-NYET!")

/mob/living/simple_animal/hostile/vadimclone/demon
	name = "Venom Goat"
	desc = "I'm already a Miner, Koz. Centcomm isn't my kinda place anyway."
	icon_state = "demon_vadim"
	icon_living = "demon_vadim"
	icon_dead = "demon_dead"
	melee_damage_lower = 5
	melee_damage_upper = 8
	attack_verb_continuous = "eliminates"
	attack_verb_simple = "eliminate"
	attack_sound = 'sound/weapons/cqchit1.ogg'
	speak_chance = 5
	speak = list("Take him out!","Kept you waiting, huh?")

/mob/living/simple_animal/hostile/vadimclone/bigpp
	name = "Vadim Kozlov"
	desc = "It's rude to stare..."
	icon_state = "phatpeepee"
	icon_living = "phatpeepee"
	icon_dead = "pp_dead"
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_continuous = "bludgeons with his cock"
	attack_verb_simple = "bludgeon with his cock"
	attack_sound = 'sound/weapons/klonk.ogg'
	speak_chance = 5
	speak = list("Like it, da?")

/mob/living/simple_animal/hostile/vadimclone/jabroni
	name = "Vadim Kozlov"
	desc = "He's got the wrong airlock... Leather Station 13 is two sectors down."
	icon_state = "jabroni"
	icon_living = "jabroni"
	icon_dead = "jabroni_dead"
	melee_damage_lower = 0
	melee_damage_upper = 0
	attack_verb_continuous = "wrestles"
	attack_verb_simple = "wrestle"
	attack_sound = 'sound/weapons/thudswoosh.ogg'
	speak_chance = 2
	speak = list("Blyat you!","Oh, Vadim's shoulder!","Lube it up!")

/mob/living/simple_animal/hostile/vadimclone/instakill
	name = "Vadim Kozlov"
	desc = "The hell... ?"
	icon_state = "underwear"
	icon_living = "underwear"
	icon_dead = "underwear_dead"
	melee_damage_lower = 500
	melee_damage_upper = 500
	maxHealth = 500
	health = 500
	attack_verb_continuous = "wrestles"
	attack_verb_simple = "wrestle"
	attack_sound = 'modular_lumos/sound/voice/vadimask.ogg'
	speak = list("Is crazy, but Vadim is not remember ask.")

/mob/living/simple_animal/hostile/vadimclone/toolbox
	name = "Vadim Kozlov"
	desc = "He's got a toolbox, and it ain't for tools!"
	icon_state = "toolbox"
	icon_living = "toolbox"
	icon_dead = "toolbox_dead"
	melee_damage_lower = 12
	melee_damage_upper = 15
	attack_verb_continuous = "robusts"
	attack_verb_simple = "robust"
	attack_sound = 'sound/weapons/smash.ogg'
	loot = list(/obj/effect/decal/cleanable/blood, /obj/item/storage/toolbox/mechanical = 1)

/mob/living/simple_animal/hostile/vadimclone/prisoner
	name = "Vadim Kozlov"
	desc = "A prisoner jumpsuit-clad Vadim, he's not very happy to see you!"
	icon_state = "prisoner_suit"
	icon_living = "prisoner_suit"
	icon_dead = "prisoner_dead"
	melee_damage_lower = 5
	melee_damage_upper = 5
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"

/mob/living/simple_animal/hostile/vadimclone/prisoner/alt
	name = "Vadim Kozlov"
	icon_state = "prisoner_less"
	icon_living = "prisoner_less"
	icon_dead = "less_dead"

/mob/living/simple_animal/hostile/vadimclone/undies
	name = "Vadim Kozlov"
	desc = "He has underwear!"
	icon_state = "underwear"
	icon_living = "underwear"
	icon_dead = "underwear_dead"
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
