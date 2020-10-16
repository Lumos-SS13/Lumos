//Generic parent object.

/obj/item/gun/ballistic/automatic/pistol/tgmc
	name = "TGMC Pistol Test"
	icon = 'modular_lumos/icons/obj/tgmc/gun.dmi'
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/pistol.ogg'

//-------------------------------------------------------
//TP-14 PISTOL

/obj/item/gun/ballistic/automatic/pistol/tgmc/standard_pistol
	name = "\improper TP-14 pistol"
	desc = "The TP-14, produced by Terran Armories. A reliable sidearm that loads 9x19mm Parabellum Auto munitions. Capable of mounting a limited amount of attachments, and firing at a respectable rate of fire, often as fast as you can pull the trigger. Takes 14-round 9mm magazines."
	icon_state = "tp14"
	item_state = "tp14"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/tp14.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/standard_pistol

//M4A3 PISTOL

/obj/item/gun/ballistic/automatic/pistol/tgmc/m4a3
	name = "\improper M4A3 service pistol"
	desc = "An M4A3 Colt Service Pistol, it was standard issue sidearm of the TerraGov Marine Corps, until the sidearm role was replaced by Terran Armories's TP-14 pistol."
	icon_state = "m4a3"
	item_state = "m4a3"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/pistol_service.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol

/obj/item/gun/ballistic/automatic/pistol/tgmc/m4a3/custom
	name = "\improper M4A3 custom pistol"
	desc = "An M4A3 Colt Service Pistol. This one has an ivory-colored grip and has a slide carefully polished yearly by a team of orphan children. Looks like it belongs to a low-ranking officer."
	icon_state = "m4a3c"
	item_state = "m4a3c"

// TP-23 service pistol

/obj/item/gun/ballistic/automatic/pistol/tgmc/standard_heavypistol
	name = "\improper TP-23 service pistol"
	desc = "A standard TP-23 chambered in .45 ACP. Has a smaller magazine capacity, but packs a better punch. Has an irremovable laser sight. Uses .45 magazines."
	icon_state = "tp23"
	item_state = "tp23"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/tp23.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/standard_heavypistol

//M1911

/obj/item/gun/ballistic/automatic/pistol/tgmc/m1911
	name = "\improper M1911 service pistol"
	desc = "A M1911 chambered in .45 ACP. An archaic weapon, yet its popular and extremely reliable mechanism provided a template for many semi-automatic pistols to come."
	icon_state = "m1911"
	item_state = "m1911"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/colt.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/m1911

/obj/item/gun/ballistic/automatic/pistol/tgmc/m1911/custom
	name = "\improper M1911A1 custom pistol"
	desc = "A 20th century military firearm that received several modifications. It seems to have been lovingly taken care of and passed down the family. Lacks an auto magazine eject feature."
	icon_state = "m1911c"

//Beretta 92FS

/obj/item/gun/ballistic/automatic/pistol/tgmc/b92fs
	name = "\improper Beretta 92FS pistol"
	desc = "A popular police firearm in the 20th century, often employed by hardboiled cops while confronting terrorists. A classic of its time, chambered in 9x19mm."
	icon_state = "b92fs"
	item_state = "b92fs"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/beretta.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/b92fs

/obj/item/gun/ballistic/automatic/pistol/tgmc/b92fs/raffica
	name = "\improper Beretta 93R pistol"
	desc = "A variant of a classic pistol, modified to allow for bursts. It is fitted with a vertical foregrip at the front end of the trigger guard to provide better stability when firing."
	icon_state = "b93r"
	item_state = "b93r"
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/b93r
	burst_size = 3

/obj/item/gun/ballistic/automatic/pistol/tgmc/b92fs/M9
	name = "\improper M9 Custom pistol"
	desc = "A 20th century military firearm customized for special forces use, fires tranq darts to take down enemies nonlethally. It does not seem to accept any other attachments."
	icon_state = "m9"
	item_state = "m9"
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/b92fstranq

//DEAGLE

/obj/item/gun/ballistic/automatic/pistol/tgmc/heavy
	name = "\improper Desert Eagle pistol"
	desc = "A magnum chambered in .50AE that comes with a serious kick. This one is engraved, <i>\"Peace through superior firepower\"</i>."
	icon_state = "deagle"
	item_state = "deagle"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/deagle.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/heavy

/obj/item/gun/ballistic/automatic/pistol/tgmc/heavy/gold
	icon_state = "g_deagle"
	item_state = "g_deagle"

//MAUSER MERC PISTOL

/obj/item/gun/ballistic/automatic/pistol/tgmc/c99
	name = "\improper Korovin PK-9 pistol"
	desc = "An updated variant of an old eastern design, dating back to from the 20th century. Features an integrated silencer, and chambered in the razor small .22 rounds. This one is loaded with the more common .22 hollowpoint rounds and appears to be a mercenary version."
	icon_state = "pk9"
	item_state = "pk9"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/c99.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/c99

/obj/item/gun/ballistic/automatic/pistol/tgmc/c99/russian
	icon_state = "pk9r"
	item_state = "pk9r"

/obj/item/gun/ballistic/automatic/pistol/tgmc/c99/upp
	desc = "An updated variant of an old eastern design, dating back to from the 20th century. Features an integrated silencer, and chambered in the razor small .22 rounds. This one is loaded with the more common .22 hollowpoint rounds and appears to be a USL model."
	icon_state = "pk9u"
	item_state = "pk9u"

/obj/item/gun/ballistic/automatic/pistol/tgmc/c99/upp/tranq
	desc = "An updated variant of an old eastern design, dating back to from the 20th century. Features an integrated silencer, and chambered in the razor small .22 rounds. This one is usually loaded with special low-recoil .22 dart rounds, which act as a dangerous tranquilizer."
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/c99t

//KT-42

/obj/item/gun/ballistic/automatic/pistol/tgmc/kt42
	name = "\improper KT-42 automag"
	desc = "The KT-42 Automag is an archaic but reliable design, going back many decades. There have been many versions and variations, but the 42 model is by far the most common. You can't go wrong with this handcannon."
	icon_state = "kt42"
	item_state = "kt42"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/kt42.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/automatic

//Holdout pistol

/obj/item/gun/ballistic/automatic/pistol/tgmc/holdout
	name = "holdout pistol"
	desc = "A tiny pistol meant for hiding in hard-to-reach areas. Best not ask where it came from."
	icon_state = "holdout"
	item_state = "holdout"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/pistol_holdout.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/holdout

//TP-17 Pocket pistol.

/obj/item/gun/ballistic/automatic/pistol/tgmc/standard_pocketpistol
	name = "\improper TP-17 pocket pistol"
	desc = "A tiny pistol used by the TGMC as an emergency handgun meant to be stored about anywhere. Fits in boots. Uses .380 ACP stored in an eight round magazine."
	icon_state = "tp17"
	item_state = "tp17"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/pistol_holdout.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/standard_pocketpistol

//.45 MARSHALS PISTOL

/obj/item/gun/ballistic/automatic/pistol/tgmc/highpower
	name = "\improper Highpower automag"
	desc = "A Colonial Marshals issued, powerful semi-automatic pistol chambered in armor piercing 9mm caliber rounds. Used for centuries by law enforcement and criminals alike, recently recreated with this new model."
	icon_state = "highpower"
	item_state = "highpower"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/hp.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/highpower

//VP70

/obj/item/gun/ballistic/automatic/pistol/tgmc/vp70
	name = "\improper 88 Mod 4 combat pistol"
	desc = "A powerful sidearm issued mainly to Nanotrasen private contractors, but issued to TGMC in very small numbers, based on the original VP70 more than a century ago. Fires 9mm armor piercing rounds and is capable of 3-round burst or automatic fire."
	icon_state = "88m4"
	item_state = "88m4"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/vp70.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/vp70

//VP78

/obj/item/gun/ballistic/automatic/pistol/tgmc/vp78
	name = "\improper VP78 combat pistol"
	desc = "A massive, formidable automatic handgun chambered in 9mm squash-head rounds. Commonly seen in the hands of wealthy Nanotrasen members."
	icon_state = "vp78"
	item_state = "vp78"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/pistol_large.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/vp78

//Auto 9

/obj/item/gun/ballistic/automatic/pistol/tgmc/auto9
	name = "\improper Auto-9 pistol"
	desc = "An advanced, select-fire machine pistol capable of three round burst. Last seen cleaning up the mean streets of Detroit."
	icon_state = "auto9"
	item_state = "auto9"
	fire_sound = 'modular_lumos/sound/weapons/guns/fire/tgmc/auto9.ogg'
	mag_type = /obj/item/ammo_box/magazine/tgmc/pistol/auto9
	burst_size = 3
