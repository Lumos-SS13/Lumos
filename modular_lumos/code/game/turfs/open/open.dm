/turf/open/floor/Entered(atom/obj, atom/oldloc)
	. = ..()
	Dirtify(obj, oldloc)

/turf/open/floor/proc/Dirtify(atom/obj, atom/oldloc)
	var/cleanprob = 50
	var/cleanamount = 0.1
	if(!ishuman(obj))
		return
	if(prob(cleanprob))
		if(has_gravity(src))
			var/dirtamount
			var/obj/effect/decal/cleanable/dirt/dirt = locate(/obj/effect/decal/cleanable/dirt, src)
			if(!dirt)
				dirt = new/obj/effect/decal/cleanable/dirt(src)
				dirt.alpha = 0
				dirtamount = 0
			dirtamount = dirt.alpha + 1
			if(oldloc && istype(oldloc, /turf/open/floor))
				var/obj/effect/decal/cleanable/dirt/spreadindirt = locate(/obj/effect/decal/cleanable/dirt, oldloc)
				if(spreadindirt && spreadindirt.alpha)
					dirtamount += round(spreadindirt.alpha * cleanamount)
			dirt.alpha = min(dirtamount,255)
	return TRUE
