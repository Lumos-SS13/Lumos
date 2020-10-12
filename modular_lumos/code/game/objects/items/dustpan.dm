/obj/item/dustpan
	name = "dustpan"
	desc = "A tool that is used to clean up dirt. Click to claim sandstone bricks and Alt-click to upgrade the dustpan."
	icon = 'modular_lumos/icons/obj/items_and_weapons.dmi'
	icon_state = "dustpan"

	w_class = WEIGHT_CLASS_SMALL

	var/stored_dirt = 0

	var/successful_cleaning = 0

	var/range_upgrade = FALSE
	var/total_range = 0
	var/reach_upgrade = FALSE
	var/speed_upgrade = FALSE
	var/universal_upgrade = FALSE

	var/efficiency_upgrade = FALSE
	var/dirt_required = 500

/obj/item/dustpan/examine(mob/user)
	. = ..()
	. += "[src] has [successful_cleaning] points."
	. += "200 points are required for upgrades."
	. += "[src] has [stored_dirt] stored dirt."
	. += "[dirt_required] stored dirt is required to produce 1 sandstone"

/obj/item/dustpan/update_icon()
	. = ..()
	cut_overlays()
	if(range_upgrade)
		add_overlay(image(icon,"dp_range"))
	if(reach_upgrade)
		add_overlay(image(icon,"dp_reach"))
	if(speed_upgrade)
		add_overlay(image(icon,"dp_speed"))
	if(universal_upgrade)
		add_overlay(image(icon,"dp_universal"))
	if(efficiency_upgrade)
		add_overlay(image(icon,"dp_efficiency"))

/obj/item/dustpan/AltClick(mob/user)
	. = ..()
	var/list/yes_list = list(FALSE, FALSE, FALSE, FALSE, FALSE)
	yes_list[1] = !range_upgrade
	yes_list[2] = !reach_upgrade
	yes_list[3] = !speed_upgrade
	yes_list[4] = !universal_upgrade
	yes_list[5] = !efficiency_upgrade
	interact(user, yes_list[1], yes_list[2], yes_list[3], yes_list[4], yes_list[5])

/obj/item/dustpan/interact(mob/user, range = FALSE, reach = FALSE, speed = FALSE, universal= FALSE, efficiency = FALSE)
	var/dat = {"
		<center>
			<h1>DUSTPAN UPGRADE PANEL</h1><br>
			<h2>'Come all those who seek to clean the filth!'</h2><br>
			<br>
			200 points are required to aquire any upgrade!<br>
			<br>
			Current Points: [successful_cleaning]<br>
		</center>"}
	if(successful_cleaning < 300)
		dat += {"
			<center>
				<span class='warning'>You currently do not have enough points to upgrade!</span><br>
				<br>
			</center>"}
	if(range)
		dat += {"
			<br><center>
				<a href="?src=[UID()];choose_range=1">Range Upgrade</a><br>
				This upgrade will allow the dustpan to clean in a larger radius.<br>
			</center>"}
	if(reach)
		dat += {"
			<br><center>
				<a href="?src=[UID()];choose_reach=1">Reach Upgrade</a><br>
				This upgrade will allow the dustpan to reach further, rather than just right beside you.<br>
			</center>"}
	if(speed)
		dat += {"
			<br><center>
				<a href="?src=[UID()];choose_speed=1">Speed Upgrade</a><br>
				This upgrade will allow the dustpan to clean much faster.<br>
			</center>"}
	if(universal)
		dat += {"
			<br><center>
				<a href="?src=[UID()];choose_universal=1">Universal Upgrade</a><br>
				This upgrade will allow the dustpan to clean any mess.<br>
			</center>"}
	if(efficiency)
		dat += {"
			<br><center>
				<a href="?src=[UID()];choose_efficiency=1">Efficiency Upgrade</a><br>
				This upgrade will allow the dustpan to produce sandstone bricks at a cheaper cost.<br>
			</center>"}

	var/datum/browser/popup = new(user, "dustpan_ui", name, 450, 700)
	popup.set_content(dat)
	popup.open()

/obj/item/dustpan/Topic(href, href_list)
	if(..())
		return

	if(href_list["choose_range"])
		if(!can_we_upgrade())
			return
		total_range++
		if(total_range >= 5)
			range_upgrade = TRUE
	if(href_list["choose_reach"])
		if(!can_we_upgrade())
			return
		reach_upgrade = TRUE
	if(href_list["choose_speed"])
		if(!can_we_upgrade())
			return
		speed_upgrade = TRUE
	if(href_list["choose_universal"])
		if(!can_we_upgrade())
			return
		universal_upgrade = TRUE
	if(href_list["choose_efficiency"])
		if(!can_we_upgrade())
			return
		dirt_required -= 100
		if(dirt_required <= 100)
			efficiency_upgrade = TRUE

	if(usr)
		AltClick(usr)
	update_icon()

/obj/item/dustpan/proc/can_we_upgrade()
	if(successful_cleaning >= 300)
		successful_cleaning -= 300
		return TRUE
	return FALSE

/obj/item/dustpan/attack_self(mob/user)
	for(var/i in 1 to 5)
		if(stored_dirt < dirt_required)
			break
		new /obj/item/stack/sheet/mineral/sandstone(get_turf(src))
		stored_dirt -= dirt_required

/obj/item/dustpan/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!reach_upgrade)
		if(!proximity_flag)
			return
	if(isfloorturf(target))
		var/clean_time = 2 SECONDS
		if(speed_upgrade)
			clean_time = 5
		if(!do_after(user, clean_time, target = target))
			return
		if(universal_upgrade)
			for(var/obj/effect/decal/cleanable/cleanable in range(target, total_range))
				if(istype(cleanable, /obj/effect/decal/cleanable/dirt))
					stored_dirt += cleanable.alpha
				for(var/i in 1 to 5)
					if(cleanable.alpha >= 50)
						successful_cleaning++
						cleanable.alpha -= 50
				qdel(cleanable)
			return
		for(var/obj/effect/decal/cleanable/dirt/dirt in range(target, total_range))
			stored_dirt += dirt.alpha
			for(var/i in 1 to 5)
				if(dirt.alpha >= 50)
					successful_cleaning++
					dirt.alpha -= 50
			qdel(dirt)
		return
	else
		return ..()

/datum/design/dustpan
	name = "Dustpan"
	desc = "A miracle tool that cleans up dirt."
	id = "dustpan"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600)
	build_path = /obj/item/dustpan
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
