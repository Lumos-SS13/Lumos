/obj/machinery/light/floor/fakeday
	name = "sunlight"
	desc = "Where the sun is hitting the planet. You shouldn't see this!"
	icon = 'modular_lumos/icons/obj/fakeoutdoorlight.dmi'
	base_state = "floor"		// base description and icon_state
	icon_state = "floor"
	brightness = 5
	nightshift_brightness = 1
	layer = 2.5
	light_type = /obj/item/light/bulb
	fitting = "bulb"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	invisibility = INVISIBILITY_MAXIMUM
