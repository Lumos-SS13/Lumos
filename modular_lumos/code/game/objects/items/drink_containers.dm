/obj/item/reagent_containers/glass/pitcher
	icon = 'modular_lumos/icons/obj/drink_containers.dmi'
	icon_state = "pitcher_empty"
	name = "glass pitcher"
	desc = "A large glass container for communal drink dispensing or hardcore alcoholism. Or easy bulk mixing. That too."
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(5,10,15,20,25,30,50,70,75)
	volume = 75
	spillable = TRUE
	resistance_flags = ACID_PROOF
	obj_flags = UNIQUE_RENAME
	custom_materials = list(/datum/material/glass=1000)
	custom_price = PRICE_CHEAP
