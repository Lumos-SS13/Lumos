/obj/item/storage/belt/hoskatana
	name = "ZR-0 sheath"
	desc = "An ornate sheath designed to hold an officer's blade."
	icon = 'modular_lumos/icons/obj/clothing/belts.dmi'
	icon_state = "hossheath"
	mob_overlay_icon = 'modular_lumos/icons/mob/clothing/belt.dmi'
	item_state = "hoskatana"
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE
	onmob_overlays = TRUE
	var/list/fitting_swords = list(/obj/item/hoskatana)
	var/starting_sword = /obj/item/hoskatana

/obj/item/storage/belt/hoskatana/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.rustle_sound = FALSE
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.can_hold = typecacheof(fitting_swords)
	STR.quickdraw = TRUE

/obj/item/storage/belt/hoskatana/examine(mob/user)
	. = ..()
	if(length(contents))
		. += "<span class='notice'>Alt-click it to quickly draw the blade.</span>"

/obj/item/storage/belt/hoskatana/PopulateContents()
	new starting_sword(src)
