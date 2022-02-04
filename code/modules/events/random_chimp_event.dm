/datum/round_event_control/random_chimp_event
	name = "Random Chimp Event"
	typepath = /datum/round_event/random_chimp_event
	weight = 10

/datum/round_event/random_chimp_event
	startWhen = 5
	endWhen = 6
	announceWhen = 1

/datum/round_event/random_chimp_event/announce(fake)
	priority_announce("High levels of chicago citizens have been detected in the station. Random chimp event has begun.", "Random Chimp Event", "attention")
	var/sound/chimp_sound = sound('sound/ambience/random_chimp_event.ogg', volume = 80)
	for(var/mob/M in GLOB.player_list)
		SEND_SOUND(M, chimp_sound)
			
/datum/round_event/random_chimp_event/start()
	var/chimp_amount = rand(3, 15)
	var/static/list/cool_areas = list(/area/medical/medbay, /area/crew_quarters/bar, /area/security/brig)
	for(var/area_type as anything in cool_areas)
		var/area/area = GLOB.areas_by_type[area_type]
		if(!istype(area))	
			continue
		var/list/turfs = list()
		for(var/turf/open/open in area)
			turfs |= open
		if(!LAZYLEN(turfs))
			continue
		for(var/monky in 1 to min(turfs, LAZYLEN(turfs)))
			var/turf/turf_chosen = pick_n_take(turfs)
			new /mob/living/carbon/angry(turf_chosen)
