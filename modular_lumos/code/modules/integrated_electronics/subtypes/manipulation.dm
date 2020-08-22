/obj/item/integrated_circuit/manipulation/miner
	name = "miner circuit"
	desc = "This allows a machine to mine rocks."
	extended_desc = "Takes a direction and if there is a mineral wall in that direction, will mine it."
	cooldown_per_use = 20
	complexity = 25
	inputs = list("turf" = IC_PINTYPE_REF)
	activators = list("mine towards direction" = IC_PINTYPE_PULSE_IN,"on mine"=IC_PINTYPE_PULSE_OUT,"failed"=IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 100

/obj/item/integrated_circuit/manipulation/miner/do_work()
	..()
	var/turf/ref_turf = get_pin_data_as_type(IC_INPUT, 1, /turf)
	if(istype(ref_turf, /turf/closed/mineral))
		var/turf/closed/mineral/mineral_turf = ref_turf
		mineral_turf.gets_drilled()
		activate_pin(2)
		return
	else
		activate_pin(3)
	return FALSE

//okay, probably not the best place to put it, but I have ideas for later on in this file.
//I think it would be fantastic to include some xenoarch circuits, scanner, hammer, and brusher. 
//also, a scanner that creates a list of all the turfs around the circuit would be good for the miner as well. 
	