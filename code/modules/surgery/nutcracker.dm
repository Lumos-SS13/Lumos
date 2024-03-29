/obj/item/nutcracker
	name = "Nutcracker"
	desc = "It seems quite oversized. You could probably even crush a watermelon with it."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "nutcracker"
	force = 10
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("smashed", "beaten", "crushed")
	var/list/accepted_limbs = list(BODY_ZONE_PRECISE_GROIN, BODY_ZONE_HEAD)

/obj/item/nutcracker/attack_obj(obj/O, mob/living/user)
	. = ..()
	if(istype(O, /obj/item/bodypart) || istype(O, /obj/item/organ))
		O.visible_message("<span class='danger'>\The [O] gets completely crushed by \the [src]!</span>")
		new /obj/effect/temp_visual/dir_setting/bloodsplatter(get_turf(O), get_dir(user, O))
		new /obj/effect/decal/cleanable/blood/gibs(get_turf(O))
		qdel(O)

//It's a bit of a clusterfuck, but if someone wants, it can be easily repurposed to work on other limbs too.
/obj/item/nutcracker/attack(mob/living/carbon/M, mob/living/carbon/user)
	. = ..()
	var/target_zone = "head"
	var/obj/item/bodypart/target_limb = M.get_bodypart(target_zone)

	if(!get_turf(M))
		return
	if(!istype(M))
		return
	if(M == user) //just use the suicide verb instead
		return
	if(!(user.zone_selected in accepted_limbs))
		return
	if(!target_limb)
		to_chat(user, "<span class='notice'>[M] has no [parse_zone(target_zone)]!</span>")
		return
	if(!get_location_accessible(M, target_zone))
		to_chat(user, "<span class='notice'>Expose [M]\s head before trying to crush it!</span>")
		return

	M.visible_message("<span class='warning'>[user] is trying to crush [M]\s [target_limb.name] with \the [src]!</span>")

	var/crush_time = max(0, 400 - user.mind.action_skill_mod(/datum/skill/numerical/surgery, min(10, target_limb.brute_dam * 2), THRESHOLD_UNTRAINED, FALSE)) //skyrat edit
	if(do_mob(user, M, crush_time))
		if(get_location_accessible(M, target_zone)) //Yes, two checks, before and after the timer. What if someone puts a helmet on the guy while you're crushing his head?
			if(target_limb)//If he still has the head. In case you queue up a lot of these up at once or the guy loses the head while you're removing it.
				M.visible_message("<span class='warning'>[M]\s [target_limb.name] cracks loudly, spilling everything inside, as it becomes an unrecognizable mess!</span>")
				if(target_limb.body_zone == BODY_ZONE_HEAD)
					gib_head(M)
				else if(target_limb.body_zone == BODY_ZONE_PRECISE_GROIN)
					gib_nuts(M)
				else if(target_limb.body_zone == BODY_ZONE_CHEST)
					target_limb.disembowel(BRUTE)
					target_limb.receive_damage(target_limb.max_damage)
				else
					target_limb.dismember(BRUTE, FALSE, TRUE)
		else
			to_chat(user, "<span class='notice'>Expose [M]\s [target_limb.name] before trying to crush it!</span>")

/obj/item/nutcracker/suicide_act(mob/living/carbon/user)
	var/obj/item/bodypart/target_limb = user.get_bodypart(BODY_ZONE_PRECISE_GROIN)
	if(target_limb)
		user.visible_message("<span class='suicide'>[user] is crushing [user.p_their()] own balls with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		if(do_after(user, 30))
			gib_nuts(user)
	else
		return
	return (BRUTELOSS)

/obj/item/nutcracker/proc/gib_nuts(mob/living/carbon/M)
	var/obj/item/bodypart/groin/groin = M.get_bodypart(BODY_ZONE_PRECISE_GROIN)
	var/obj/item/organ/genital/testicles/nuts = M.getorganslot(ORGAN_SLOT_TESTICLES)
	if(!groin)
		return
	M.emote("scream")
	if(nuts)
		nuts.Remove()
		qdel(nuts)
	new M.gib_type(get_turf(M),1,M.get_static_viruses())
	M.add_splatter_floor(get_turf(M))
	if(groin)
		groin.receive_damage(groin.max_damage)
	playsound(M, 'sound/effects/splat.ogg', 50, 1)

/obj/item/nutcracker/proc/gib_head(mob/living/carbon/M)
	var/obj/item/bodypart/head = M.get_bodypart(BODY_ZONE_HEAD)
	if(!head)
		return

	var/turf/T = get_turf(M)
	var/list/organs = M.getorganszone(BODY_ZONE_HEAD) + M.getorganszone(BODY_ZONE_PRECISE_EYES) + M.getorganszone(BODY_ZONE_PRECISE_MOUTH)
	for(var/internal_organ in organs)
		var/obj/item/organ/I = internal_organ
		I.Remove()
		I.forceMove(T)
	head.drop_limb()
	qdel(head)
	new M.gib_type(T,1,M.get_static_viruses())
	M.add_splatter_floor(T)
	playsound(M, 'sound/effects/splat.ogg', 50, 1)
