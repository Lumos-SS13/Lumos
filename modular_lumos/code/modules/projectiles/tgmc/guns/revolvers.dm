//Generic parent object.
/obj/item/gun/ballistic/revolver/tgmc/revolver
	name = "TGMC Revolver Test"
	icon = 'modular_lumos/icons/obj/tgmc/gun.dmi'
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/44mag.ogg'

//-------------------------------------------------------
//TP-44 COMBAT REVOLVER

/obj/item/gun/ballistic/revolver/tgmc/revolver/standard_revolver
	name = "\improper TP-44 combat revolver"
	desc = "The TP-44, Produced by Terran Armories. A sturdy and hard hitting firearm that loads .44 Magnum rounds. Holds 7 rounds in the cylinder. Due to the nature of the weapon, its rate of fire doesn’t quite match the output of other guns, but does hit much harder."
	icon_state = "tp44"
	item_state = "tp44"
	mag_type = /obj/item/ammo_box/magazine/internal/tgmc/revolver/standard_revolver
	force = 8

//M44 MAGNUM REVOLVER

/obj/item/gun/ballistic/revolver/tgmc/revolver/m44
	name = "\improper M44 combat revolver"
	desc = "A bulky revolver, occasionally carried by civilian law enforcement. Uses .44 Magnum rounds."
	icon_state = "m44"
	item_state = "m44"
	mag_type = /obj/item/ammo_box/magazine/internal/tgmc/revolver/m44
	force = 8

//RUSSIAN REVOLVER

/obj/item/gun/ballistic/revolver/tgmc/revolver/upp
	name = "\improper N-Y 7.62mm revolver"
	desc = "The Nagant-Yamasaki 7.62 is an effective killing machine designed by a consortion of shady Not-Americans. It is frequently found in the hands of criminals or mercenaries."
	icon_state = "ny762"
	item_state = "ny762"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/ny.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/tgmc/revolver/upp
	force = 8

//357 REVOLVER

/obj/item/gun/ballistic/revolver/tgmc/revolver/small
	name = "\improper S&W .357 revolver"
	desc = "A lean .357 made by Smith & Wesson. A timeless classic, from antiquity to the future."
	icon_state = "sw357"
	item_state = "sw357"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/revolver.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/tgmc/revolver/small
	force = 6

//Mateba

/obj/item/gun/ballistic/revolver/tgmc/revolver/mateba
	name = "\improper TL-24 autorevolver"
	desc = "The TL-24 is the rather rare autorevolver used by the TGMC issued in rather small numbers to backline personnel and officers it uses recoil to spin the cylinder. Uses heavy .454 rounds."
	icon_state = "mateba"
	item_state = "mateba"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/mateba.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/tgmc/revolver/mateba
	force = 15

/obj/item/gun/ballistic/revolver/tgmc/revolver/mateba/notmarine
	name = "\improper Mateba autorevolver"
	desc = "The Mateba is a powerful, fast-firing revolver that uses its own recoil to rotate the cylinders. Uses .454 rounds."


/obj/item/gun/ballistic/revolver/tgmc/revolver/mateba/captain
	name = "\improper TL-24 autorevolver special"
	desc = "The Mateba is a powerful, fast-firing revolver that uses its own recoil to rotate the cylinders. This one appears to have had more love and care put into it. Uses .454 rounds."
	icon_state = "mateba"
	item_state = "mateba"

//MARSHALS REVOLVER

/obj/item/gun/ballistic/revolver/tgmc/revolver/cmb
	name = "\improper CMB autorevolver"
	desc = "An automatic revolver chambered in .357 magnum. Commonly issued to Nanotrasen security. It has a burst mode. Currently in trial with other revolvers across Terra and other colonies."
	icon_state = "cmb"
	item_state = "cmb"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/revolver_small.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/tgmc/revolver/cmb
	force = 12
