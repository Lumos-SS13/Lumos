/obj/item/clothing/mask/gas/halfmask
	name = "gas mask"
	desc = "A mask which covers the bottom half of the face, this can be connected to an air supply. Although it can barely conceal your identity, it is stronger when it comes to preventing diseases." //More accurate
	icon = 'modular_lumos/icons/obj/clothing/masks.dmi'
	icon_state = "halfmask"
	mob_overlay_icon = 'modular_lumos/icons/mob/clothing/mask.dmi'
	item_state = "halfmask"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDESNOUT
	w_class = WEIGHT_CLASS_NORMAL
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	resistance_flags = NONE
	mutantrace_variation = NONE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 0)