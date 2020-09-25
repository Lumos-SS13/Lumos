/*

SUPERMATTER CHARGED PLASMAMAN

The supermatter-charged plasmaman was an ancient crewmember who became stranded on what is now know as lavaland.

Difficulty: Very Hard

*/

/mob/living/simple_animal/hostile/megafauna/smchargedplasma
	name = "supermatter-charged plasmaman"
	desc = "An abomination that wishes to end your world."
	threat = 40
	health = 3000
	maxHealth = 3000
	attack_verb_continuous = "radiates"
	attack_verb_simple = "radiates"
	attack_sound = 'sound/magic/clockwork/ratvar_attack.ogg'
	icon_state = "sm_skeleton"
	icon_living = "sm_skeleton"
	icon_dead = "dragon_dead"
	friendly_verb_continuous = "pulses sporadically"
	friendly_verb_simple = "pulses sporadically"
	icon = 'modular_lumos/icons/mob/human.dmi'
	speak_emote = list("roars")
	armour_penetration = 40
	melee_damage_lower = 20
	melee_damage_upper = 20
	speed = 0
	move_to_delay = 10
	ranged = 1
	del_on_death = 1
	crusher_loot = list(/obj/structure/closet/crate/necropolis/colossus/crusher)
	loot = list(/obj/structure/closet/crate/necropolis/colossus)
	butcher_results = list(/obj/item/stack/ore/diamond = 5, /obj/item/stack/sheet/sinew = 5, /obj/item/stack/sheet/animalhide/ashdrake = 10, /obj/item/stack/sheet/bone = 30)
	deathmessage = "disintegrates, leaving a glowing core in its wake."
	death_sound = 'sound/magic/demon_dies.ogg'

	var/anom_list = list(/obj/effect/anomaly/flux, /obj/effect/anomaly/pyro)

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/devour(mob/living/L)
	visible_message("<span class='colossus'>[src] disintegrates [L]!</span>")
	L.dust()

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/OpenFire()
	anger_modifier = clamp(((maxHealth - health)/50),0,20)
	ranged_cooldown = world.time + 1 SECONDS

	for(var/mob/living/carbon/human/H in range(14, src))
		step_towards(H, src)
	for(var/mob/living/silicon/robot/R in range(14, src))
		step_towards(R, src)
	emp_rad_wave()
	switch(health)
		if(2000 to INFINITY)
			ranged_cooldown = world.time + 5 SECONDS
			if(prob(25))
				rad_wheel()
			else
				blast_shot()
		if(1000 to 1999)
			ranged_cooldown = world.time + 3 SECONDS
			if(prob(25))
				rad_wheel(double = TRUE)
			else
				blast_shot(double = TRUE)
		if(-INFINITY to 999)
			ranged_cooldown = world.time + 1 SECONDS
			if(prob(25))
				rad_wheel(double = TRUE, delay = FALSE)
			else
				blast_shot(double = TRUE, delay = FALSE)

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/Initialize()
	. = ..()
	internal = new/obj/item/gps/internal/smcharged_plasma(src)

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/proc/rad_wheel(double = FALSE, delay = TRUE)
	for(var/i in 1 to 36)
		fire_nuclear_particle_simple(i * 10)
		if(double)
			fire_nuclear_particle_simple((i * 10) + 180)
		if(delay)
			sleep(1)

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/proc/blast_shot(double = FALSE, delay = TRUE)
	var/list/around_tar = list(-20,-10,0,10,20)
	var/tar_angle = Get_Angle(src, target)
	for(var/i in around_tar)
		fire_nuclear_particle_simple(tar_angle + i)
		if(delay)
			sleep(1)
	if(double)
		sleep(1)
		tar_angle = Get_Angle(src, target)
		for(var/i in around_tar)
			fire_nuclear_particle_simple(tar_angle + i)
			if(delay)
				sleep(1)

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/proc/emp_rad_wave()
	radiation_pulse(src, 1000, 20)
	empulse(get_turf(src), 10, 20)

/obj/item/gps/internal/smcharged_plasma
	icon_state = null
	gpstag = "Cascading Signal"
	desc = "A faint buzzing can be heard."
	invisibility = 100

//Nuclear particle projectile - a deadly side effect of fusion
/obj/item/projectile/energy/nuclear_particle_simple
	name = "nuclear particle"
	icon_state = "nuclear_particle"
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	flag = "rad"
	irradiate = 5000
	damage = 10
	pixels_per_second = TILES_TO_PIXELS(10)
	hitsound = 'sound/weapons/emitter2.ogg'
	impact_type = /obj/effect/projectile/impact/xray
	var/static/list/particle_colors = list(
		"red" = "#FF0000",
		"yellow" = "#FFFF00",
		"orange" = "#ff7b00"
	)
	wound_bonus = 10

/obj/item/projectile/energy/nuclear_particle_simple/Initialize()
	. = ..()
	//Random color time!
	var/our_color = pick(particle_colors)
	add_atom_colour(particle_colors[our_color], FIXED_COLOUR_PRIORITY)
	set_light(4, 3, particle_colors[our_color]) //Range of 4, brightness of 3 - Same range as a flashlight

/atom/proc/fire_nuclear_particle_simple(angle = rand(0,360)) //used by fusion to fire random nuclear particles. Fires one particle in a random direction.
	var/obj/item/projectile/energy/nuclear_particle_simple/P = new /obj/item/projectile/energy/nuclear_particle_simple(src)
	P.fire(angle)
