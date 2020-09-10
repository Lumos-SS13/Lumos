/obj/item/clothing/head/helmet/space/commando
	name = "fishbowl"
	desc = "Congrats on tiding, enjoy the fishbowl"
	icon = 'modular_lumos/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_lumos/icons/mob/clothing/head.dmi'
	icon_state = "fishbowl"
	item_state = "fishbowl"
	mutantrace_variation = NONE // Don't ruin the fishbowl

/obj/item/clothing/suit
	var/lumos_hoof_tauric	= FALSE
	var/lumos_snek_tauric	= FALSE
	var/lumos_paw_tauric	= FALSE

/obj/item/clothing/suit/space/commando
	name = "spacesuit"
	desc = "A suit that reminds you of a specific weather..."
	icon = 'modular_lumos/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_lumos/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_lumos/icons/mob/clothing/suit_digi.dmi'
	icon_state = "new_EVA"
	item_state = "new_EVA"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_SNEK_TAURIC|STYLE_PAW_TAURIC

	lumos_snek_tauric	= TRUE
	lumos_paw_tauric	= TRUE
