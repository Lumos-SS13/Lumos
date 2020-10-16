//Base magazine for inheritance/

/obj/item/ammo_box/magazine/tgmc
	name = "TGMC Magazine Test"
	icon = 'modular_lumos/icons/obj/tgmc/ammo.dmi'

//-------------------------------------------------------
//M4A3 PISTOL

/obj/item/ammo_box/magazine/tgmc/standard_pistol
	name = "\improper TP-14 magazine (9mm)"
	desc = "A pistol magazine."
	caliber = "9mm"
	icon_state = "tp14"
	max_ammo = 14
	w_class = WEIGHT_CLASS_SMALL
	ammo_type = /obj/item/ammo_casing/c9mm

//M4A3 PISTOL

/obj/item/ammo_box/magazine/tgmc/pistol
	name = "\improper M4A3 magazine (9mm)"
	desc = "A pistol magazine."
	caliber = "9mm"
	icon_state = "m4a3"
	max_ammo = 14
	w_class = WEIGHT_CLASS_SMALL
	ammo_type = /obj/item/ammo_casing/c9mm

/obj/item/ammo_box/magazine/tgmc/pistol/hp
	name = "\improper M4A3 hollowpoint magazine (9mm)"
	icon_state = "m4a3_hp"
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/tgmc/pistol/ap
	name = "\improper M4A3 AP magazine (9mm)"
	icon_state = "m4a3_ap"
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/tgmc/pistol/incendiary
	name = "\improper M4A3 incendiary magazine (9mm)"
	icon_state = "m4a3_incendiary"
	ammo_type = /obj/item/ammo_casing/c9mm/inc

/obj/item/ammo_box/magazine/tgmc/pistol/extended
	name = "\improper M4A3 extended magazine (9mm)"
	max_ammo = 24
	icon_state = "m4a3_ext"

//M1911

/obj/item/ammo_box/magazine/tgmc/pistol/m1911
	name = "\improper M1911 magazine (.45)"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	icon_state = ".45"
	max_ammo = 10

/obj/item/ammo_box/magazine/tgmc/acp
	name = "box of .45 ACP"
	icon_state = "box45" //With thanks to Eris
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 50

//TP-23

/obj/item/ammo_box/magazine/tgmc/pistol/standard_heavypistol
	name = "\improper TP-23 magazine (.45)"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	icon_state = ".45"
	max_ammo = 11

//Beretta 92FS

/obj/item/ammo_box/magazine/tgmc/pistol/b92fs
	name = "\improper Beretta 92FS magazine (9mm)"
	caliber = "9mm"
	icon_state = "beretta"
	max_ammo = 15
	ammo_type = /obj/item/ammo_casing/c9mm

/obj/item/ammo_box/magazine/tgmc/pistol/b93r
	name = "\improper Beretta 93R magazine (9mm)"
	caliber = "9mm"
	icon_state = "beretta"
	max_ammo = 20
	ammo_type = /obj/item/ammo_casing/c9mm

/obj/item/ammo_box/magazine/tgmc/pistol/b92fstranq
	name = "\improper M9 tranq magazine (9mm)"
	caliber = "9mm"
	icon_state = "beretta"
	max_ammo = 12
	ammo_type = /obj/item/ammo_casing/c9mm/tranq

//DEAGLE

/obj/item/ammo_box/magazine/tgmc/pistol/heavy
	name = "\improper Desert Eagle magazine (.50)"
	ammo_type = /obj/item/ammo_casing/a50AE
	caliber = ".50AE"
	icon_state = "50ae"
	max_ammo = 7

//MAUSER MERC PISTOL

/obj/item/ammo_box/magazine/tgmc/pistol/c99t
	name = "\improper PK-9 tranq magazine (.22)"
	ammo_type = /obj/item/ammo_casing/c22lr/tranq
	caliber = ".22 LR"
	icon_state = "pk-9_tranq"
	max_ammo = 8

/obj/item/ammo_box/magazine/tgmc/pistol/c99
	name = "\improper PK-9 hollowpoint magazine (.22)"
	ammo_type = /obj/item/ammo_casing/c22lr
	caliber = ".22 LR"
	icon_state = "pk-9"
	max_ammo = 12


//KT-42

/obj/item/ammo_box/magazine/tgmc/pistol/automatic
	name = "\improper KT-42 magazine (.44)"
	ammo_type = /obj/item/ammo_casing/c44
	caliber = ".44"
	icon_state = "kt42"
	max_ammo = 7


//Holdout pistol

/obj/item/ammo_box/magazine/tgmc/pistol/holdout
	name = "tiny pistol magazine (.22)"
	desc = "A surprisingly small magazine, holding .22 bullets. No Kolibri, but it's getting there."
	ammo_type = /obj/item/ammo_casing/c22lr
	caliber = ".22 LR"
	icon_state = ".22"
	max_ammo = 5
	w_class = WEIGHT_CLASS_TINY

//TP-17.

/obj/item/ammo_box/magazine/tgmc/pistol/standard_pocketpistol
	name = "\improper TP-17 pocket pistol AP magazine (.380)"
	desc = "A surprisingly small magazine used by the TP-17 pistol holding .380 ACP bullets."
	ammo_type = /obj/item/ammo_casing/c380
	caliber = ".380 ACP"
	icon_state = "tp17"
	max_ammo = 8
	w_class = WEIGHT_CLASS_TINY

//.45

/obj/item/ammo_box/magazine/tgmc/pistol/highpower
	name = "\improper Highpower magazine (9mm)"
	ammo_type = /obj/item/ammo_casing/c9mm/ap
	caliber = "9mm"
	icon_state = "m4a3" //PLACEHOLDER
	max_ammo = 13

//VP70

/obj/item/ammo_box/magazine/tgmc/pistol/vp70
	name = "\improper 88M4 AP magazine (9mm)"
	ammo_type = /obj/item/ammo_casing/c9mm/ap
	caliber = "9mm"
	icon_state = "88m4"
	max_ammo = 18

//VP78

/obj/item/ammo_box/magazine/tgmc/pistol/vp78
	name = "\improper VP78 magazine (9mm)"
	ammo_type = /obj/item/ammo_casing/c9mm/ap
	caliber = "9mm"
	icon_state = "50ae"
	max_ammo = 18

//Auto 9

/obj/item/ammo_box/magazine/tgmc/pistol/auto9
	name = "\improper Auto-9 magazine (9mm)"
	ammo_type = /obj/item/ammo_casing/c9mm/ap
	caliber = "9mm"
	icon_state = "beretta"
	max_ammo = 50
