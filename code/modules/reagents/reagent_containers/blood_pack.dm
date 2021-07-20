/obj/item/reagent_containers/blood
	name = "\improper IV bag"
	desc = "An IV bag. Can be attached to a human to slowly transfer it's reagents to their bloodstream. Can also take blood from a human."
	icon = 'icons/obj/bloodpack.dmi'
	icon_state = "bloodpack"
	volume = 200
	reagent_flags = DRAINABLE
	amount_per_transfer_from_this = 0.1
	possible_transfer_amounts = list(0.1, 0.2, 0.5, 1, 2, 5)
	var/blood_type = null
	var/labelled = 0
	var/color_to_apply = "#FFFFFF"
	var/mutable_appearance/fill_overlay
	///Who are we sticking our needle in?
	var/mob/living/carbon/attached
	///Are we injecting or sucking?
	var/injecting = FALSE

/obj/item/reagent_containers/blood/Initialize()
	. = ..()
	if(blood_type != null)
		reagents.add_reagent(/datum/reagent/blood, 200, list("donor"=null,"viruses"=null,"blood_DNA"=null,"bloodcolor"=bloodtype_to_color(blood_type), "blood_type"=blood_type,"resistances"=null,"trace_chem"=null))
		update_icon()

/obj/item/reagent_containers/blood/Destroy()
	if(attached)
		detach_iv()
	return ..()

/obj/item/reagent_containers/blood/on_reagent_change(changetype)
	if(reagents)
		var/datum/reagent/blood/B = reagents.has_reagent(/datum/reagent/blood)
		if(B && B.data && B.data["blood_type"])
			blood_type = B.data["blood_type"]
			color_to_apply = bloodtype_to_color(blood_type)
		else
			blood_type = null
	update_pack_name()
	update_icon()

/obj/item/reagent_containers/blood/proc/update_pack_name()
	if(labelled)
		return
	name = "\improper IV bag[blood_type ? " - [blood_type]" : null]"

/obj/item/reagent_containers/blood/update_overlays()
	. = ..()
	var/v = min(round(reagents.total_volume / volume * 10), 10)
	if(v > 0)
		. += mutable_appearance('icons/obj/reagentfillings.dmi', "bloodpack[v]", color = mix_color_from_reagents(reagents.reagent_list))

/obj/item/reagent_containers/blood/examine()
	. = ..()
	. += "<span class='notice'>Currently in [injecting ? "injection" : "extraction"] mode.</span>"
	if(attached)
		. += "<span class='notice'>Currently [injecting ? "injecting" : "taking blood from"] <b>[attached]</b>.</span>"

/obj/item/reagent_containers/blood/AltClick(mob/user)
	. = ..()
	if(attached)
		to_chat(user, "<span class='notice'>\The IV bag needle is removed from <b>[attached]</b>.</span>")
		detach_iv()

/obj/item/reagent_containers/blood/CtrlClick(mob/user)
	. = ..()
	injecting = !injecting
	to_chat(user, "<span class='notice'>\The [src] will now [injecting ? "inject" : "take blood from"] the attached patient.</span>")

/obj/item/reagent_containers/blood/MouseDrop(atom/over, src_location, over_location, src_control, over_control, params)
	. = ..()
	if(iscarbon(over) && (loc == usr) && isliving(usr) &&  distance_check(over))
		attach_iv(over, usr)

/obj/item/reagent_containers/blood/process()
	if(!attached)
		return PROCESS_KILL

	if(!distance_check(attached))
		attached.visible_message("<span class='danger'>\The IV bag needle is ripped out of <b>[attached]</b>!</span>", \
								"<span class='userdanger'>Ouch! \The IV bag needle is ripped from me!</span>")
		attached.apply_damage(3, BRUTE, pick(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM), sharpness = SHARP_POINTY)

		detach_iv()
		return PROCESS_KILL

	if(reagents)
		// Inject reagents
		if(injecting)
			if(reagents.total_volume)
				reagents.trans_to(attached, amount_per_transfer_from_this) //make reagents reacts, but don't spam messages
				update_icon()
		// Take blood
		else
			var/amount = reagents.maximum_volume - reagents.total_volume
			amount = min(amount, amount_per_transfer_from_this)

			attached.transfer_blood_to(src, amount_per_transfer_from_this)
			update_icon()

/obj/item/reagent_containers/blood/proc/distance_check(mob/living/target)
	. = TRUE
	if(!(get_dist(src, target) <= 1) || !isturf(target.loc) || !isliving(loc))
		return FALSE

/obj/item/reagent_containers/blood/proc/attach_iv(mob/living/target, mob/user)
	if(user)
		user.visible_message("<span class='warning'><b>[user]</b> attaches [src] to [target].</span>", \
						"<span class='notice'>I attach [src] to [target].</span>")
	log_combat(user, target, "attached", src, "containing: ([reagents.log_list()])")
	add_fingerprint(user)
	attached = target
	START_PROCESSING(SSobj, src)

	update_icon()

/obj/item/reagent_containers/blood/proc/detach_iv()
	attached = null
	STOP_PROCESSING(SSobj, src)

	update_icon()

/obj/item/reagent_containers/blood/random
	icon_state = "random_bloodpack"

/obj/item/reagent_containers/blood/random/Initialize()
	icon_state = "bloodpack"
	blood_type = pick("A+", "A-", "B+", "B-", "O+", "O-", "L", "SY", "HF", "GEL", "BUG")
	return ..()

/obj/item/reagent_containers/blood/APlus
	blood_type = "A+"

/obj/item/reagent_containers/blood/AMinus
	blood_type = "A-"

/obj/item/reagent_containers/blood/BPlus
	blood_type = "B+"

/obj/item/reagent_containers/blood/BMinus
	blood_type = "B-"

/obj/item/reagent_containers/blood/OPlus
	blood_type = "O+"

/obj/item/reagent_containers/blood/OMinus
	blood_type = "O-"

/obj/item/reagent_containers/blood/lizard
	blood_type = "L"

/obj/item/reagent_containers/blood/universal
	blood_type = "U"

/obj/item/reagent_containers/blood/synthetics
	blood_type = "SY"

/obj/item/reagent_containers/blood/oilblood
	blood_type = "HF"

/obj/item/reagent_containers/blood/jellyblood
	blood_type = "GEL"

/obj/item/reagent_containers/blood/insect
	blood_type = "BUG"

/obj/item/reagent_containers/blood/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/pen) || istype(I, /obj/item/toy/crayon))
		if(!user.is_literate())
			to_chat(user, "<span class='notice'>You scribble illegibly on the label of [src]!</span>")
			return
		var/t = stripped_input(user, "What would you like to label the blood pack?", name, null, 53)
		if(!user.canUseTopic(src, BE_CLOSE))
			return
		if(user.get_active_held_item() != I)
			return
		if(t)
			labelled = 1
			name = "blood pack - [t]"
		else
			labelled = 0
			update_pack_name()
	else
		return ..()

/obj/item/reagent_containers/blood/attack(mob/living/carbon/C, mob/user, def_zone)
	if(user.a_intent == INTENT_HELP && reagents.total_volume > 0 && iscarbon(C) && user.a_intent == INTENT_HELP)
		if(C.is_mouth_covered())
			to_chat(user, "<span class='notice'>You cant drink from the [src] while your mouth is covered.</span>")
			return
		if(user != C)
			user.visible_message("<span class='danger'>[user] forces [C] to drink from the [src].</span>", \
			"<span class='notice'>You force [C] to drink from the [src]</span>")
			if(!do_mob(user, C, 50))
				return
		else
			if(!do_mob(user, C, 10))
				return

			to_chat(user, "<span class='notice'>You take a sip from the [src].</span>")
			user.visible_message("<span class='notice'>[user] puts the [src] up to their mouth.</span>")
		if(reagents.total_volume <= 0) // Safety: In case you spam clicked the blood bag on yourself, and it is now empty (below will divide by zero)
			return
		var/gulp_size = 3
		var/fraction = min(gulp_size / reagents.total_volume, 1)
		reagents.reaction(C, INGEST, fraction) 	//checkLiked(fraction, M) // Blood isn't food, sorry.
		reagents.trans_to(C, gulp_size)
		reagents.remove_reagent(src, 2) //Inneficency, so hey, IVs are usefull.
		playsound(C.loc,'sound/items/drink.ogg', rand(10, 50), TRUE)
		return
	return ..()

/obj/item/reagent_containers/blood/bluespace
	name = "bluespace IV bag"
	desc = "A bluespace IV bag. This one can inject reagents and extract blood at a distance."
	icon_state = "bsbloodpack"
	volume = 600 //its a blood bath!

/obj/item/reagent_containers/blood/bluespace/attack(mob/living/carbon/C, mob/user, def_zone)
	if(user.a_intent == INTENT_HELP)
		if(user != C)
			to_chat(user, "<span class='notice'>You can't force people to drink from the [src]. Nothing comes out from it.</span>")
			return
		else
			to_chat(user, "<span class='notice'>You try to suck on the [src], but nothing comes out.</span>")
			return
	else
		. = ..()

/obj/item/reagent_containers/blood/bluespace/distance_check(mob/living/target)
	return TRUE

//cholostomy bags
/obj/item/reagent_containers/cholostomy_bag
	name = "\improper cholostomy bag"
	desc = "A cholostomy bag. Can be attached to a human to slowly transfer their bloodstream reagents to the bag."
	icon = 'icons/obj/bloodpack.dmi'
	icon_state = "bloodpack"
	volume = 100
	reagent_flags = DRAINABLE
	amount_per_transfer_from_this = 1
	possible_transfer_amounts = list(0.5, 1, 2, 5)
	var/color_to_apply = "#FFFFFF"
	var/mutable_appearance/fill_overlay
	///Who are we sticking our needle in?
	var/mob/living/carbon/attached

/obj/item/reagent_containers/cholostomy_bag/Destroy()
	if(attached)
		detach_iv()
	return ..()

/obj/item/reagent_containers/cholostomy_bag/update_overlays()
	. = ..()
	var/v = min(round(reagents.total_volume / volume * 10), 10)
	if(v > 0)
		. += mutable_appearance('icons/obj/reagentfillings.dmi', "bloodpack[v]", color = mix_color_from_reagents(reagents.reagent_list))

/obj/item/reagent_containers/cholostomy_bag/examine()
	. = ..()
	if(attached)
		. += "<span class='notice'>Currently taking reagents from <b>[attached]</b>.</span>"

/obj/item/reagent_containers/cholostomy_bag/AltClick(mob/user)
	. = ..()
	if(attached)
		to_chat(user, "<span class='notice'>\The cholostomy bag needle is removed from <b>[attached]</b>.</span>")
		detach_iv()

/obj/item/reagent_containers/cholostomy_bag/MouseDrop(atom/over, src_location, over_location, src_control, over_control, params)
	. = ..()
	if(iscarbon(over) && (loc == usr) && isliving(usr) &&  distance_check(over))
		attach_iv(over, usr)

/obj/item/reagent_containers/cholostomy_bag/process()
	if(!attached)
		return PROCESS_KILL

	if(!distance_check(attached))
		attached.visible_message("<span class='danger'>\The IV bag needle is ripped out of <b>[attached]</b>!</span>", \
								"<span class='userdanger'>Ouch! \The IV bag needle is ripped from me!</span>")
		attached.apply_damage(3, BRUTE, pick(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM), sharpness = SHARP_POINTY)

		detach_iv()
		return PROCESS_KILL

	if(attached.reagents)
		attached.reagents.trans_to(src, amount_per_transfer_from_this)
		update_icon()

/obj/item/reagent_containers/cholostomy_bag/proc/distance_check(mob/living/target)
	. = TRUE
	if(!(get_dist(src, target) <= 1) || !isturf(target.loc))
		return FALSE

/obj/item/reagent_containers/cholostomy_bag/proc/attach_iv(mob/living/target, mob/user)
	if(user)
		user.visible_message("<span class='warning'><b>[user]</b> attaches [src] to [target].</span>", \
						"<span class='notice'>I attach [src] to [target].</span>")
	log_combat(user, target, "attached", src, "containing: ([reagents.log_list()])")
	add_fingerprint(user)
	attached = target
	START_PROCESSING(SSobj, src)

	update_icon()

/obj/item/reagent_containers/cholostomy_bag/proc/detach_iv()
	attached = null
	STOP_PROCESSING(SSobj, src)

	update_icon()
