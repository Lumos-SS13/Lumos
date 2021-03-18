// this dm is intended for special non-clothing items for lumos. insert your gay snowflake/donator items here.
/obj/item/screwdriver/vadknife
	name = "vadim's lucky knife"
	desc = "A rusted and outdated military knife. Its tip has snapped off at some point, making it a decent makeshift screwdriver."
	icon = 'modular_lumos/icons/obj/vadimknife.dmi'
	icon_state = "cumknife"
	item_state = "cumknife"
	lefthand_file = 'modular_lumos/icons/mob/lumosinhand/cumknifeleft.dmi'
	righthand_file = 'modular_lumos/icons/mob/lumosinhand/cumkniferight.dmi'
	force = 7
	throwforce = 7
	attack_verb = list("slashed", "sliced", "cut", "chibbed")
	toolspeed = 0.8 // Vadim is screw fast, but not in bed
	resistance_flags = FIRE_PROOF | ACID_PROOF
	random_color = FALSE
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = null
