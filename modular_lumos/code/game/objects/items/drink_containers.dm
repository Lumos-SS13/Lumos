/obj/item/reagent_containers/glass/pitcher
	name = "glass pitcher"
	desc = "A large glass container for communal drink dispensing or hardcore alcoholism."
	icon_state = "glass_empty"
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(5,10,15,20,25,30,50,70)
	volume = 75
	spillable = TRUE
	resistance_flags = ACID_PROOF
	obj_flags = UNIQUE_RENAME
	custom_materials = list(/datum/material/glass=1000)
	custom_price = PRICE_CHEAP

/obj/item/reagent_containers/glass/canteen
	name = "Canteen"
	desc = "A robust metal canteen for long treks or jaded veterans."
	icon_state = "glass_empty"
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = list(5,10,15,20,25)
	volume = 50
	custom_materials = list(/datum/material/iron = 500)
	max_integrity = 20
	spillable = FALSE
	resistance_flags = ACID_PROOF, FIRE_PROOF, LAVA_PROOF
	obj_flags = UNIQUE_RENAME
	custom_price = PRICE_REALLY_CHEAP
