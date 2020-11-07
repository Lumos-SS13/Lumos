/mob/living/simple_animal/hostile/faithless/forgotten
	name = "The Forgotten"
	desc = "Cast from the world of light, rejected by the dark."
	icon = 'modular_lumos/icons/mob/simplemobs/forgotten.dmi'
	icon_state = "forgotten"
	icon_living = "forgotten"
	icon_dead = "forgotten_dead"
	threat = 1
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	gender = MALE
	speak_chance = 1
	speak = list("Raaagh...","Light...","Burning...")
	turns_per_move = 5
	see_in_dark = 6
	response_help_continuous = "passes through"
	response_help_simple = "pass through"
	response_disarm_continuous = "shoves"
	response_disarm_simple = "shove"
	response_harm_continuous = "hits"
	response_harm_simple = "hit"
	emote_taunt = list("mutters")
	taunt_chance = 25
	speed = 0
	maxHealth = 80
	health = 80
	spacewalk = TRUE
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	blood_volume = 0
	wander = TRUE


	harm_intent_damage = 10
	obj_damage = 50
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_continuous = "grips"
	attack_verb_simple = "grip"
	attack_sound = 'sound/effects/bamf.ogg'
	speak_emote = list("growls")

	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

	faction = list("faithless")
	gold_core_spawnable = HOSTILE_SPAWN

	footstep_type = FOOTSTEP_MOB_SHOE
