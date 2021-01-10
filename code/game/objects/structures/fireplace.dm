#define LOG_BURN_TIMER 150
#define PAPER_BURN_TIMER 5
#define MAXIMUM_BURN_TIMER 6000

/obj/structure/fireplace
	name = "fireplace"
	desc = "A large fireplace."
	icon = 'icons/obj/fireplace.dmi'
	icon_state = "fireplace"
	density = FALSE
	anchored = TRUE
	max_integrity = 70
	pixel_x = -16
	resistance_flags = FIRE_PROOF
	var/lit = FALSE

	var/fuel_added = 0
	var/flame_expiry_timer

/obj/structure/fireplace/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/structure/fireplace/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/fireplace/proc/try_light(obj/item/O, mob/user)
	if(lit)
		to_chat(user, "<span class='warning'>It's already lit!</span>")
		return FALSE
	if(!fuel_added)
		to_chat(user, "<span class='warning'>[src] needs some fuel to burn!</span>")
		return FALSE
	var/msg = O.ignition_effect(src, user)
	if(msg)
		visible_message(msg)
		ignite()
		return TRUE

/obj/structure/fireplace/attackby(obj/item/T, mob/user)
	if (istype(T,/obj/item/screwdriver))
		if(!T.tool_start_check(user, amount=0))
			user.visible_message("[user] is taking apart the [name].", "<span class='notice'>You are disassembling the [name]...</span>")
			return FALSE
		if(T.use_tool(src, user, 40, volume=50))
			user.visible_message("[user] takes apart the [name].", "<span class='notice'>You disassemble the [name].</span>")
			deconstruct(TRUE)
		return
	else if (istype(T, /obj/item/stack/sheet/mineral/wood))
		var/obj/item/stack/sheet/mineral/wood/wood = T
		var/space_remaining = MAXIMUM_BURN_TIMER - burn_time_remaining()
		var/space_for_logs = round(space_remaining / LOG_BURN_TIMER)
		if(space_for_logs < 1)
			to_chat(user, "<span class='warning'>You can't fit any more of [T] in [src]!</span>")
			return
		var/logs_used = min(space_for_logs, wood.amount)
		wood.use(logs_used)
		adjust_fuel_timer(LOG_BURN_TIMER * logs_used)
		user.visible_message("<span class='notice'>[user] tosses some \
			wood into [src].</span>", "<span class='notice'>You add \
			some fuel to [src].</span>")
	else if(istype(T, /obj/item/paper_bin))
		var/obj/item/paper_bin/paper_bin = T
		user.visible_message("<span class='notice'>[user] throws [T] into \
			[src].</span>", "<span class='notice'>You add [T] to [src].\
			</span>")
		adjust_fuel_timer(PAPER_BURN_TIMER * paper_bin.total_paper)
		qdel(paper_bin)
	else if(istype(T, /obj/item/paper))
		user.visible_message("<span class='notice'>[user] throws [T] into \
			[src].</span>", "<span class='notice'>You throw [T] into [src].\
			</span>")
		adjust_fuel_timer(PAPER_BURN_TIMER)
		qdel(T)
	else if(try_light(T,user))
		return
	else
		. = ..()

/obj/structure/fireplace/update_overlays()
	. = ..()
	if(!lit)
		return
	switch(burn_time_remaining())
		if(0 to 1500)
			. += "fireplace_fire0"
		if(1500 to 2500)
			. += "fireplace_fire1"
		if(2500 to 3500)
			. += "fireplace_fire2"
		if(3500 to 4000)
			. += "fireplace_fire3"
		if(4000 to MAXIMUM_BURN_TIMER)
			. += "fireplace_fire4"
	. += "fireplace_glow"

/obj/structure/fireplace/proc/adjust_light()
	if(!lit)
		set_light(0)
		return

	switch(burn_time_remaining())
		if(0 to 1500)
			set_light(1)
		if(1500 to 2500)
			set_light(2)
		if(2500 to 3500)
			set_light(3)
		if(3500 to 4000)
			set_light(4)
		if(4000 to MAXIMUM_BURN_TIMER)
			set_light(6)

/obj/structure/fireplace/process()
	if(!lit)
		return
	if(world.time > flame_expiry_timer)
		put_out()
		return

	playsound(src, 'sound/effects/comfyfire.ogg',50,0, 0, 1)
	var/turf/T = get_turf(src)
	T.hotspot_expose(500, 5)
	update_icon()
	adjust_light()

/obj/structure/fireplace/extinguish()
	if(lit)
		var/fuel = burn_time_remaining()
		flame_expiry_timer = 0
		put_out()
		adjust_fuel_timer(fuel)
	. = ..()

/obj/structure/fireplace/proc/adjust_fuel_timer(amount)
	if(lit)
		flame_expiry_timer += amount
		if(burn_time_remaining() < MAXIMUM_BURN_TIMER)
			flame_expiry_timer = world.time + MAXIMUM_BURN_TIMER
	else
		fuel_added = clamp(fuel_added + amount, 0, MAXIMUM_BURN_TIMER)

/obj/structure/fireplace/proc/burn_time_remaining()
	if(lit)
		return max(0, flame_expiry_timer - world.time)
	else
		return max(0, fuel_added)

/obj/structure/fireplace/proc/ignite()
	lit = TRUE
	desc = "A large fireplace, warm and cozy."
	flame_expiry_timer = world.time + fuel_added
	fuel_added = 0
	update_icon()
	adjust_light()

/obj/structure/fireplace/proc/put_out()
	lit = FALSE
	update_icon()
	adjust_light()
	desc = initial(desc)

/obj/structure/fireplace/fireplace_metal
	icon = 'icons/obj/fireplace.dmi'
	icon_state = "fireplace_metal"
	name = "metal fireplace"
	desc = "A large fireplace."
