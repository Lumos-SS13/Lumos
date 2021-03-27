	//Emergency Response Team suits
/obj/item/clothing/head/helmet/space/hardsuit/ert
	name = "emergency response unit helmet"
	desc = "Standard issue command helmet for the ERT."
	icon_state = "hardsuit0-ert_commander"
	item_state = "hardsuit0-ert_commander"
	hardsuit_type = "ert_commander"
	armor = list("melee" = 65, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 80, "wound" = 25)
	strip_delay = 130
	brightness_on = 7
	resistance_flags = ACID_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/ert/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, LOCKED_HELMET_TRAIT)

/obj/item/clothing/suit/space/hardsuit/ert
	name = "emergency response team suit"
	desc = "Standard issue command suit for the ERT."
	icon_state = "ert_command"
	item_state = "ert_command"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	armor = list("melee" = 65, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 80, "wound" = 25)
	slowdown = 0
	strip_delay = 130
	resistance_flags = ACID_PROOF

	//ERT Security
/obj/item/clothing/head/helmet/space/hardsuit/ert/sec
	desc = "Standard issue security helmet for the ERT."
	icon_state = "hardsuit0-ert_security"
	item_state = "hardsuit0-ert_security"
	hardsuit_type = "ert_security"

/obj/item/clothing/suit/space/hardsuit/ert/sec
	desc = "Standard issue security suit for the ERT."
	icon_state = "ert_security"
	item_state = "ert_security"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/sec

	//ERT Engineering
/obj/item/clothing/head/helmet/space/hardsuit/ert/engi
	desc = "Standard issue engineer helmet for the ERT."
	icon_state = "hardsuit0-ert_engineer"
	item_state = "hardsuit0-ert_engineer"
	hardsuit_type = "ert_engineer"

/obj/item/clothing/suit/space/hardsuit/ert/engi
	desc = "Standard issue engineer suit for the ERT."
	icon_state = "ert_engineer"
	item_state = "ert_engineer"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/engi

	//ERT Medical
/obj/item/clothing/head/helmet/space/hardsuit/ert/med
	desc = "Standard issue medical helmet for the ERT."
	icon_state = "hardsuit0-ert_medical"
	item_state = "hardsuit0-ert_medical"
	hardsuit_type = "ert_medical"

/obj/item/clothing/suit/space/hardsuit/ert/med
	desc = "Standard issue medical suit for the ERT."
	icon_state = "ert_medical"
	item_state = "ert_medical"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/med
	species_exception = list(/datum/species/angel)

	//Red alert ERT

/obj/item/clothing/head/helmet/space/hardsuit/ert/alert
	name = "emergency response unit helmet"
	desc = "Red alert command helmet for the ERT. This one is more armored than its standard version."
	icon_state = "hardsuit0-ert_commander-alert"
	item_state = "hardsuit0-ert_commander-alert"
	hardsuit_type = "ert_commander-alert"
	armor = list("melee" = 70, "bullet" = 55, "laser" = 50, "energy" = 50, "bomb" = 65, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100, "wound" = 27)
	brightness_on = 8
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/ert/alert
	name = "emergency response team suit"
	desc = "Red alert command suit for the ERT. This one is more armored than its standard version."
	icon_state = "ert_command-alert"
	item_state = "ert_command-alert"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert
	armor = list("melee" = 70, "bullet" = 55, "laser" = 50, "energy" = 50, "bomb" = 65, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100, "wound" = 27)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_SNEK_TAURIC

	//ERT Security
/obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sec
	desc = "Red alert security helmet for the ERT. This one is more armored than its standard version."
	icon_state = "hardsuit0-ert_security-alert"
	item_state = "hardsuit0-ert_security-alert"
	hardsuit_type = "ert_security-alert"

/obj/item/clothing/suit/space/hardsuit/ert/alert/sec
	desc = "Red alert security suit for the ERT. This one is more armored than its standard version."
	icon_state = "ert_security-alert"
	item_state = "ert_security-alert"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/sec

	//ERT Engineering
/obj/item/clothing/head/helmet/space/hardsuit/ert/alert/engi
	desc = "Red alert engineer helmet for the ERT. This one is more armored than its standard version."
	icon_state = "hardsuit0-ert_engineer-alert"
	item_state = "hardsuit0-ert_engineer-alert"
	hardsuit_type = "ert_engineer-alert"

/obj/item/clothing/suit/space/hardsuit/ert/alert/engi
	desc = "Red alert engineer suit for the ERT. This one is more armored than its standard version."
	icon_state = "ert_engineer-alert"
	item_state = "ert_engineer-alert"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/engi

	//ERT Medical
/obj/item/clothing/head/helmet/space/hardsuit/ert/alert/med
	desc = "Red alert medical helmet for the ERT. This one is more armored than its standard version."
	icon_state = "hardsuit0-ert_medical-alert"
	item_state = "hardsuit0-ert_medical-alert"
	hardsuit_type = "ert_medical-alert"

/obj/item/clothing/suit/space/hardsuit/ert/alert/med
	desc = "Red alert medical suit for the ERT. This one is more armored than its standard version."
	icon_state = "ert_medical-alert"
	item_state = "ert_medical-alert"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/alert/med
	species_exception = list(/datum/species/angel)

// Paranormal ERT Hardsuits //

/obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal
	name = "paranormal response unit helmet"
	desc = "A helmet worn by those who deal with paranormal threats for a living."
	icon_state = "hardsuit0-prt"
	item_state = "hardsuit0-prt"
	hardsuit_type = "knight_grey"
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	actions_types = list()
	resistance_flags = FIRE_PROOF
	mutantrace_variation = NONE
	var/charges = INFINITY

/obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, FALSE, FALSE, TRUE, ITEM_SLOT_HEAD, charges, TRUE, null, CALLBACK(src, .proc/anti_magic_gone))

/obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/proc/anti_magic_gone()
	var/mob/M = loc
	if(!istype(M))
		return
	do_sparks(2, TRUE, M)
	M.show_message("<span class='warning'>\The [src] sparks and fizzles as its psychic wards wane away at last...</span>", MSG_VISUAL)

/obj/item/clothing/suit/space/hardsuit/ert/paranormal
	name = "paranormal response team suit"
	desc = "Powerful wards are built into this hardsuit, protecting the user from all manner of paranormal threats."
	icon_state = "knight_grey"
	item_state = "knight_grey"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF
	var/charges = INFINITY

/obj/item/clothing/suit/space/hardsuit/ert/paranormal/Initialize()
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, TRUE, FALSE, ITEM_SLOT_OCLOTHING, charges, TRUE, null, CALLBACK(src, .proc/anti_magic_gone))

/obj/item/clothing/suit/space/hardsuit/ert/paranormal/proc/anti_magic_gone()
	var/mob/M = loc
	if(!istype(M))
		return
	do_sparks(2, TRUE, M)
	M.show_message("<span class='warning'>\The [src] sparks and fizzles as its anti magic wards wane away at last...</span>", MSG_VISUAL)

/obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor
	name = "inquisitor's hardsuit"
	icon_state = "hardsuit-inq"
	item_state = "hardsuit-inq"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/inquisitor

/obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/inquisitor
	name = "inquisitor's helmet"
	icon_state = "hardsuit0-inq"
	item_state = "hardsuit0-inq"

/obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor/old
	desc = "Powerful wards are built into this hardsuit, protecting the user from all manner of paranormal threats. Alas, this one looks pretty worn out and rusted."
	armor = list("melee" = 55, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 40, "bio" = 80, "rad" = 80, "fire" = 60, "acid" = 60, "wound" = 15)
	slowdown = 0.8
	obj_flags = IMMUTABLE_SLOW //rest in peace rusty joints.
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/inquisitor/old
	charges = 12

/obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/inquisitor/old
	desc = "A helmet worn by those who deal with paranormal threats for a living. Alas, this one looks pretty worn out and rusted."
	armor = list("melee" = 55, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 40, "bio" = 80, "rad" = 80, "fire" = 60, "acid" = 60, "wound" = 15)
	charges = 12

/obj/item/clothing/suit/space/hardsuit/ert/paranormal/beserker
	name = "champion's hardsuit"
	desc = "Voices echo from the hardsuit, driving the user insane."
	icon_state = "hardsuit-beserker"
	item_state = "hardsuit-beserker"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/beserker

/obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/beserker
	name = "champion's helmet"
	desc = "Peering into the eyes of the helmet is enough to seal damnation."
	icon_state = "hardsuit0-beserker"
	item_state = "hardsuit0-beserker"

/obj/item/clothing/suit/space/hardsuit/ert/paranormal/beserker/old
	desc = "Voices echo from the hardsuit, driving the user insane. This one is pretty battle-worn, but still fearsome."
	armor = list("melee" = 55, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 40, "bio" = 80, "rad" = 80, "fire" = 60, "acid" = 60, "wound" = 15)
	slowdown = 0.8
	obj_flags = IMMUTABLE_SLOW // Skyrat Modular
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/beserker/old
	charges = 6

/obj/item/clothing/head/helmet/space/hardsuit/ert/paranormal/beserker/old
	desc = "Peering into the eyes of the helmet is enough to seal damnation. This one is pretty battle-worn, but still fearsome."
	armor = list("melee" = 55, "bullet" = 40, "laser" = 40, "energy" = 40, "bomb" = 40, "bio" = 80, "rad" = 80, "fire" = 60, "acid" = 60, "wound" = 15)
	charges = 6
