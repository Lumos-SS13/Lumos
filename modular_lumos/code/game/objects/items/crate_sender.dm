GLOBAL_LIST_EMPTY(crate_receiver_pads)

/obj/structure/closet/crate/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/crate_sender))
		var/obj/item/crate_sender/CS = W 
		if(!CS.online)
			return ..()
		if(CS.charges <= 0)
			to_chat(user, "<span class='warning'>There are not enough charges...</span>")
			return
		to_chat(user, "<span class='warning'>Stand still, the crate sender is warming up...</span>")
		var/choice = input(user, "Choose the pad you wish to send the crate to:") as null|anything in GLOB.crate_receiver_pads
		if(!choice)
			to_chat(user, "<span class='warning'>No choice commited...</span>")
			return
		if(!do_after(user, 5 SECONDS, target = src))
			to_chat(user, "<span class='warning'>You moved, disrupting the sequence...</span>")
			return
		CS.charges--
		CS.desc = "[initial(CS.desc)] There are [CS.charges] charge(s) left!"
		playsound(get_turf(src), 'sound/magic/Repulse.ogg', 50, 1)
		new /obj/effect/particle_effect/sparks(get_turf(src))
		forceMove(get_turf(choice))
		playsound(get_turf(src), 'sound/magic/Disable_Tech.ogg', 50, 1)
		new /obj/effect/particle_effect/sparks(get_turf(choice))
		visible_message("<span class='warning'>The crate vanishes, leaving nothing behind...</span>")
	else
		return ..()

/obj/effect/decal/crate_receiver_pad
	name = "crate receiver pad"
	desc = "A painting that marks the spot where the crate sender will send its cargo to. Can be cleaned"
	icon = 'modular_lumos/icons/obj/items_and_weapons.dmi'
	icon_state = "crate_pad"
	var/obj/item/crate_sender/linked_crate_sender

/obj/effect/decal/crate_receiver_pad/attack_hand(mob/living/user)
	if(user.a_intent == INTENT_HARM)
		to_chat(user, "<span class='warning'>You destroy [src].</span>")
		playsound(loc, 'sound/weapons/egloves.ogg', 80, 1)
		qdel(src)

/obj/effect/decal/crate_receiver_pad/Initialize()
	. = ..()
	var/area/src_area = get_area(src)
	name = "[src_area.name] crate receiver pad ([rand(100000,999999)])"
	GLOB.crate_receiver_pads += src

/obj/effect/decal/crate_receiver_pad/Destroy(force)
	GLOB.crate_receiver_pads -= src
	. = ..()

/obj/effect/decal/crate_receiver_pad/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/crate_sender))
		var/obj/item/crate_sender/CS = W
		if(linked_crate_sender == CS)
			to_chat(user, "<span class='warning'>You destroy [src].</span>")
			playsound(loc, 'sound/weapons/egloves.ogg', 80, 1)
			CS.linked_receiver_pad = null
			CS.name = "[initial(name)]"
			qdel(src)
			return
	else
		return ..()

/obj/item/crate_sender
	name = "crate sender"
	desc = "A tool that allows people to send crates through... something? Click to turn it on. Alt-click to place the receiver pad. Ctrl-click to remove the receiver pad."
	icon = 'modular_lumos/icons/obj/items_and_weapons.dmi'
	icon_state = "crate_sender_off"
	var/online = FALSE
	var/charges = 0
	var/obj/effect/decal/crate_receiver_pad/linked_receiver_pad
	var/timer = 0

/obj/item/crate_sender/attack_self(mob/user)
	. = ..()
	online = !online
	to_chat(user, "<span class='warning'>You turn [online ? "on" : "off"] [src].</span>")
	icon_state = "crate_sender_[online ? "on" : "off"]"
	update_icon()

/obj/item/crate_sender/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/crate_sender/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/crate_sender/process()
	if(world.time < timer)
		return
	timer = world.time + 1 MINUTES

	if(charges <= 4)
		charges++
		playsound(loc, 'sound/machines/chime.ogg', 50, 1)
		visible_message("<span class='warning'>[src] increases in charge by one...</span>")
	
	desc = "[initial(desc)] There are [charges] charge(s) left!"

/obj/item/crate_sender/AltClick(mob/user)
	. = ..()
	if(linked_receiver_pad)
		to_chat(user, "<span class='warning'>There is already a receiver pad...</span>")
		playsound(loc, 'sound/machines/DeniedBeep.ogg', 50, 1)
		return
	var/area/src_area = get_area(src)
	if(!is_station_level(src_area.z))
		to_chat(user, "<span class='warning'>Reciever pad's can only be deployed on station...</span>")
		playsound(loc, 'sound/machines/DeniedBeep.ogg', 50, 1)
		return
	to_chat(user, "<span class='warning'>You create a new receiver pad.</span>")
	playsound(loc, 'sound/machines/chime.ogg', 50, 1)
	name = "[src_area.name] crate sender"
	var/obj/effect/decal/crate_receiver_pad/CP = new /obj/effect/decal/crate_receiver_pad(get_turf(src))
	linked_receiver_pad = CP
	CP.linked_crate_sender = src
	
/obj/item/crate_sender/CtrlClick(mob/user)
	. = ..()
	to_chat(user, "<span class='warning'>You destroy the linked receiver pad.</span>")
	playsound(loc, 'sound/machines/DeniedBeep.ogg', 50, 1)
	QDEL_NULL(linked_receiver_pad)

/datum/supply_pack/service/crate_senders
	name = "Crate Sender Box Crate"
	desc = "Get your very own crate sender, capable of sending crates to locations that get marked!"
	cost = 3000
	contains = list(/obj/item/crate_sender,
					/obj/item/crate_sender)
	crate_name = "crate sender box crate"
