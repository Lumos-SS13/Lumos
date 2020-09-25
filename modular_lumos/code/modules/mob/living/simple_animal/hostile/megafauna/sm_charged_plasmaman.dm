/*

SUPERMATTER CHARGED PLASMAMAN

The supermatter-charged plasmaman was an ancient crewmember who became stranded on what is now know as lavaland.

Difficulty: TOUHOU

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
	armour_penetration = 80
	melee_damage_lower = 40
	melee_damage_upper = 40
	speed = 0
	move_to_delay = 5
	ranged = 1
	del_on_death = 1
	loot = list(/obj/structure/closet/crate/necropolis/smchargedplasma)
	butcher_results = list(/obj/item/stack/ore/diamond = 5, /obj/item/stack/sheet/sinew = 5, /obj/item/stack/sheet/animalhide/ashdrake = 10, /obj/item/stack/sheet/bone = 30)
	deathmessage = "disintegrates, leaving a glowing core in its wake."
	death_sound = 'sound/magic/demon_dies.ogg'

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
	var/for_or_back = pick(list(-1,1))
	switch(health)
		if(2000 to INFINITY)
			ranged_cooldown = world.time + 3 SECONDS
			if(prob(25))
				rad_wheel(backwards = for_or_back)
			else
				blast_shot()
		if(1000 to 1999)
			ranged_cooldown = world.time + 2 SECONDS
			if(prob(35))
				rad_wheel(double = TRUE, backwards = for_or_back)
			else
				blast_shot(double = TRUE)
		if(-INFINITY to 999)
			ranged_cooldown = world.time + 1 SECONDS
			if(prob(35))
				rad_wheel(double = TRUE, delay = FALSE, amount = 3, backwards = for_or_back, opening = TRUE)
			else
				blast_shot(double = TRUE, delay = FALSE)
			for(var/mob/living/carbon/human/H in range(14, src))
				step_towards(H, src)

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/Initialize()
	. = ..()
	internal = new/obj/item/gps/internal/smcharged_plasma(src)

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/proc/rad_wheel(double = FALSE, delay = TRUE, amount = 1, backwards = 1, opening = FALSE)
	for(var/i1 in 1 to amount)
		for(var/i in 1 to 36)
			if(opening && prob(15))
				continue
			fire_nuclear_particle_simple(i * (10 * backwards))
			if(double)
				fire_nuclear_particle_simple((i * (10 * backwards)) + 180)
			if(delay)
				sleep(1)
		sleep(10)

/mob/living/simple_animal/hostile/megafauna/smchargedplasma/proc/blast_shot(double = FALSE, delay = TRUE)
	var/list/around_tar = list(-20,-15,-10,-5,0,5,10,15,20)
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
	damage = 50
	pixels_per_second = TILES_TO_PIXELS(6)
	hitsound = 'sound/weapons/emitter2.ogg'
	impact_type = /obj/effect/projectile/impact/xray
	var/static/list/particle_colors = list(
		"red" = "#FF0000",
		"yellow" = "#FFFF00",
		"orange" = "#ff7b00"
	)
	wound_bonus = 25

/obj/item/projectile/energy/nuclear_particle_simple/Initialize()
	. = ..()
	//Random color time!
	var/our_color = pick(particle_colors)
	add_atom_colour(particle_colors[our_color], FIXED_COLOUR_PRIORITY)
	set_light(4, 3, particle_colors[our_color]) //Range of 4, brightness of 3 - Same range as a flashlight

/atom/proc/fire_nuclear_particle_simple(angle = rand(0,360)) //used by fusion to fire random nuclear particles. Fires one particle in a random direction.
	var/obj/item/projectile/energy/nuclear_particle_simple/P = new /obj/item/projectile/energy/nuclear_particle_simple(src)
	P.fire(angle)

/obj/item/gravity_pull
	name = "gravity staff"
	desc = "Pull everyone around you, just like the monster did."
	icon = 'modular_lumos/icons/obj/wizard.dmi'
	icon_state = "grav_staff"

	var/on_cooldown = FALSE

/obj/item/gravity_pull/attack_self(mob/user)
	if(on_cooldown)
		to_chat(user, "<span class='warning'>Still on cooldown, wait!</span>")
		return
	on_cooldown = TRUE
	addtimer(CALLBACK(src, .proc/off_cooldown), 10 SECONDS)
	for(var/mob/living/L in viewers(user))
		step_towards(L, user)
		step_towards(L, user)
		step_towards(L, user)
		step_towards(L, user)
		step_towards(L, user)

/obj/item/gravity_pull/proc/off_cooldown()
	on_cooldown = FALSE

/obj/structure/closet/crate/necropolis/smchargedplasma
	name = "super charged chest"

/obj/structure/closet/crate/necropolis/smchargedplasma/PopulateContents()
	new /obj/item/gravity_pull(src)
	