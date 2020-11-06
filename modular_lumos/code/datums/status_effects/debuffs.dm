//STASIS
/datum/status_effect/grouped/stasis
	id = "stasis"
	duration = -1
	tick_interval = 10
	alert_type = /obj/screen/alert/status_effect/stasis
	var/last_dead_time

/datum/status_effect/grouped/stasis/proc/update_time_of_death()
	if(last_dead_time)
		var/delta = world.time - last_dead_time
		var/new_timeofdeath = owner.timeofdeath + delta
		owner.timeofdeath = new_timeofdeath
		owner.tod = STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)
		last_dead_time = null
	if(owner.stat == DEAD)
		last_dead_time = world.time

/datum/status_effect/grouped/stasis/on_creation(mob/living/new_owner, set_duration, updating_canmove)
	. = ..()
	if(.)
		update_time_of_death()
		owner.reagents?.end_metabolization(owner, FALSE)
		owner.update_mobility()

/datum/status_effect/grouped/stasis/tick()
	update_time_of_death()

/datum/status_effect/grouped/stasis/on_remove()
	owner.update_mobility()
	update_time_of_death()
	return ..()

/obj/screen/alert/status_effect/stasis
	name = "Stasis"
	desc = "Your biological functions have halted. You could live forever this way, but it's pretty boring."
	icon = 'modular_lumos/icons/mob/screen_alert.dmi'
	icon_state = "stasis"
