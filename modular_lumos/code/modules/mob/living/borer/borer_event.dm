/datum/round_event_control/borer
	name = "Borer"
	typepath = /datum/round_event/borer
	weight = 20
	max_occurrences = 1
	min_players = 15
	earliest_start = 12000

/datum/round_event/borer
	announceWhen = 3000 //Borers get 5 minutes till the crew tries to murder them.
	var/successSpawn = 0

	var/spawncount = 2

/datum/round_event/borer/setup()
	spawncount = rand(2, 4)

/datum/round_event/borer/announce()
	if(successSpawn)
		priority_announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert") //Borers seem like normal xenomorphs.


/datum/round_event/borer/start()

	var/list/vents = list()
	for(var/obj/machinery/atmospherics/components/unary/vent_pump/temp_vent in GLOB.machines)
		if(!temp_vent)
			continue
		if(is_station_level(temp_vent.loc.z) && !temp_vent.welded)
			vents += temp_vent

	if(!vents.len)
		message_admins("An event attempted to spawn a borer but no suitable vents were found. Shutting down.")
		return kill()

	var/total_humans = 0
	for(var/mob/living/carbon/human/H in GLOB.mob_living_list)
		if(H.stat != DEAD)
			total_humans++

	total_borer_hosts_needed = round(6 + total_humans/7)

	while(spawncount >= 1  && vents.len)
		var/obj/vent = pick_n_take(vents)
		new /mob/living/simple_animal/borer(vent.loc)
		successSpawn = TRUE
		spawncount--
