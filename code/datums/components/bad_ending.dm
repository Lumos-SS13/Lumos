/datum/component/bad_ending
	var/mob/living/dreamer

/datum/component/bad_ending/Destroy(force, silent)
	. = ..()
	STOP_PROCESSING(SSobj, src)

/datum/component/bad_ending/Initialize()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	dreamer = parent
	START_PROCESSING(SSstatus_effects, src)
	agony()

/datum/component/bad_ending/proc/agony()
	var/sound/im_sick = sound('sound/ambience/dreamt.ogg', TRUE, FALSE, CHANNEL_HIGHEST_AVAILABLE, 100)
	dreamer.playsound_local(turf_source = get_turf(dreamer), S = im_sick, vol = 100, vary = 0)
	dreamer.overlay_fullscreen("dream", /obj/screen/fullscreen/bad_ending, 1)
	dreamer.overlay_fullscreen("wakeup", /obj/screen/fullscreen/bad_ending/waking_up, 1)

/datum/component/bad_ending/process()
	if(world.time % 20)
		return
	INVOKE_ASYNC(src, .proc/screenshake)
	fucky_floor()

/datum/component/bad_ending/proc/fucky_floor()
	if(!dreamer.client)
		return
	var/list/turf/open/floor/floorlist = list()
	for(var/turf/open/floor/fucky in range(dreamer))
		if(prob(15))
			INVOKE_ASYNC(src, .proc/handle_this_fucky_floor, fucky)

/datum/component/bad_ending/proc/screenshake()
	if(!dreamer.client)
		return
	var/client/loser = dreamer.client
	var/shakeit = 0
	while(shakeit < 10)
		shakeit++
		var/intensity = 1
		animate(loser, pixel_y = (loser.pixel_y + intensity), time = intensity/2)
		sleep(intensity/2)
		animate(loser, pixel_y = (loser.pixel_y - intensity), time = intensity/2)
		sleep(intensity/2)

/datum/component/bad_ending/proc/handle_this_fucky_floor(turf/open/floor/fucky)
	if(!fucky || !dreamer.client)
		return
	var/image/I = image('icons/turf/floors.dmi', fucky, pick("rcircuitanim", "gcircuitanim"), fucky.layer+0.1)
	dreamer.client.images += I
	var/offset = pick(-1, 1)
	var/disappearfirst = 30
	animate(I, pixel_y = (I.pixel_y + offset), time = disappearfirst)
	sleep(disappearfirst)
	var/disappearsecond = 30
	animate(I, pixel_y = (I.pixel_y - offset), time = disappearsecond)
	sleep(disappearsecond)
	dreamer.client?.images -= I
	qdel(I)

/obj/screen/fullscreen/bad_ending
	icon = 'modular_lumos/icons/hud/fullscreen_wakeup.dmi'
	icon_state = "dream"

/obj/screen/fullscreen/bad_ending/waking_up
	icon_state = "wake_up"
