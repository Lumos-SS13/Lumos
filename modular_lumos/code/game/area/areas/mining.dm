/**********************Asteroid Areas**************************/

/area/mining_asteroid
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	flora_allowed = FALSE
	ambientsounds = ASTEROID

/area/mining_asteroid/no_caves
	name = "Asteroid"
	icon_state = "explored"
	music = null
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE

/area/mining_asteroid/caves
	name = "Asteroid Caves"
	icon_state = "unexplored"
	music = null
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE

/area/mining_asteroid/caves/unexplored //monsters and ruins spawn here
	icon_state = "unexplored"
	tunnel_allowed = TRUE
	mob_spawn_allowed = TRUE

/area/mining_asteroid/no_caves/gulag
	name = "Asteroid Labor Camp"
	flora_allowed = FALSE
