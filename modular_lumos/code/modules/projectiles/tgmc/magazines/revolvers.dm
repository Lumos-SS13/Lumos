//Generic parent object.
//---------------------------------------------------

//external magazines

/obj/item/ammo_box/tgmc/revolver
	name = "\improper M44 magnum speed loader (.44)"
	desc = "A revolver speed loader."
	icon = 'modular_lumos/icons/obj/tgmc/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/c44
	caliber = ".44"
	icon_state = "m44"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 7

/obj/item/ammo_box/tgmc/revolver/update_icon()
	..()
	icon_state = "[initial(icon_state)][stored_ammo.len != 0 ? "" : "-e"]"

/obj/item/ammo_box/tgmc/revolver/marksman
	name = "\improper M44 marksman speed loader (.44)"
	ammo_type = /obj/item/ammo_casing/c44
	caliber = ".44"
	icon_state = "m_m44"

/obj/item/ammo_box/tgmc/revolver/heavy
	name = "\improper M44 PW-MX speed loader (.44)"
	ammo_type = /obj/item/ammo_casing/c44
	caliber = ".44"
	icon_state = "h_m44"

/obj/item/ammo_box/tgmc/revolver/standard_revolver
	name = "\improper TP-44 magnum speed loader (.44)"
	desc = "A revolver speed loader."
	ammo_type = /obj/item/ammo_casing/c44
	caliber = ".44"
	icon_state = "tp44"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 7

/obj/item/ammo_box/tgmc/revolver/upp
	name = "\improper N-Y speed loader (7.62x38mmR)"
	ammo_type = /obj/item/ammo_casing/n762
	caliber = "n762"
	icon_state = "ny762"


/obj/item/ammo_box/tgmc/revolver/small
	name = "\improper S&W speed loader (.357)"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = ".357"
	icon_state = "sw357"
	max_ammo = 6


/obj/item/ammo_box/tgmc/revolver/mateba
	name = "\improper Mateba speed loader (.454)"
	ammo_type = /obj/item/ammo_casing/c454
	caliber = ".454"
	icon_state = "mateba"
	max_ammo = 6


/obj/item/ammo_box/tgmc/revolver/cmb
	name = "\improper CMB revolver speed loader (.357)"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = ".357"
	icon_state = "cmb"
	max_ammo = 6

//a very literal box of ammunition.
/obj/item/ammo_box/tgmc/magnum
	name = "box of .44 magnum"
	icon_state = "box45" //Maybe change this
	ammo_type = /obj/item/ammo_casing/c44
	caliber = ".44"
	max_ammo = 50

//INTERNAL MAGAZINES

//---------------------------------------------------

/obj/item/ammo_box/magazine/internal/tgmc/revolver
	name = "revolver cylinder"
	ammo_type = /obj/item/ammo_casing/c44
	max_ammo = 6

//-------------------------------------------------------

//TP-44 COMBAT REVOLVER //

/obj/item/ammo_box/magazine/internal/tgmc/revolver/standard_revolver
	caliber = ".44"
	ammo_type = /obj/item/ammo_casing/c44
	max_ammo = 7

//-------------------------------------------------------
//M44 MAGNUM REVOLVER //

/obj/item/ammo_box/magazine/internal/tgmc/revolver/m44
	caliber = ".44"
	max_ammo = 7

//-------------------------------------------------------
//RUSSIAN REVOLVER //

/obj/item/ammo_box/magazine/internal/tgmc/revolver/upp
	ammo_type = /obj/item/ammo_casing/n762
	caliber = "n762"
	max_ammo = 7

//-------------------------------------------------------
//357 REVOLVER //

/obj/item/ammo_box/magazine/internal/tgmc/revolver/small
	ammo_type = /obj/item/ammo_casing/a357
	caliber = ".357"

//-------------------------------------------------------
//BURST REVOLVER //
/obj/item/ammo_box/magazine/internal/tgmc/revolver/mateba
	ammo_type = /obj/item/ammo_casing/c454
	caliber = ".454"

//-------------------------------------------------------
//MARSHALS REVOLVER //

/obj/item/ammo_box/magazine/internal/tgmc/revolver/cmb
	ammo_type = /obj/item/ammo_casing/a357
	caliber = ".357"

