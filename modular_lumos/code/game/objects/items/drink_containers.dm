/obj/item/reagent_containers/glass/pitcher
	icon = 'modular_lumos/icons/obj/drink_containers.dmi'
	icon_state = "pitcher_empty"
	name = "glass pitcher"
	desc = "A large glass container for communal drink dispensing or hardcore alcoholism."
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(5,10,15,20,25,30,50,70,75)
	volume = 75
	spillable = TRUE
	resistance_flags = ACID_PROOF
	obj_flags = UNIQUE_RENAME
	custom_materials = list(/datum/material/glass=1000)
	custom_price = PRICE_CHEAP

/obj/item/reagent_containers/glass/canteen
	icon = 'modular_lumos/icons/obj/drink_containers.dmi'
	icon_state = "canteen"
	name = "mining canteen"
	desc = "A robust metal canteen for long treks, jaded veterans, or booze hounds."
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5,10,15,20,25)
	volume = 50
	custom_materials = list(/datum/material/iron = 800)
	max_integrity = 20
	spillable = FALSE
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	obj_flags = UNIQUE_RENAME
	custom_price = PRICE_CHEAP
