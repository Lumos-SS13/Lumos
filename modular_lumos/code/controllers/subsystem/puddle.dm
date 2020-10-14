SUBSYSTEM_DEF(puddle)
	name = "Puddle Controller"
	wait = 5

/datum/controller/subsystem/puddle/fire(resumed = 0)
	for(var/obj/effect/decal/cleanable/puddle/puddle in world)
		puddle.fake_process()
