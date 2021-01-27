/turf/open/water
	gender = PLURAL
	name = "water"
	desc = "Shallow water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/floor/grass
	slowdown = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

	can_allow_icy = FALSE //lumos edit V V V ALL OF THIS TOO V V V

	var/list/fishing_loot = list(
			/obj/item/fishy/catfish = 25,
			/obj/item/fishy/shrimp = 25,
			/obj/item/fishy/lobster = 25,
			/obj/item/fishy/salmon = 25)

/turf/open/water/lavaland
	name = "jungle water"
	desc = "Water found throughout the subterranean jungle of NT8248-B."
	baseturfs = /turf/open/chasm/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE

	fishing_loot = list(
			/obj/item/fishy/lobster/rock = 30,
			/obj/item/fishy/asteroid_worm = 10,
			/obj/item/fishy/lavacrab = 30,
			/obj/item/fishy/lavafish = 30)

/turf/open/water/asteroid
	name = "asteroid pond"
	desc = "Shallow water found in some asteroids, often used by astroforms and extremophiles."
	baseturfs = /turf/open/floor/plating/asteroid

	fishing_loot = list(
			/obj/item/fishy/space_eel = 25,
			/obj/item/fishy/asteroid_worm = 35,
			/obj/item/fishy/minicarp = 35,
			/obj/item/fishy/seadevil = 5)

/turf/open/water/asteroid/airless
	initial_gas_mix = AIRLESS_ATMOS
	baseturfs = /turf/open/floor/plating/asteroid/airless
