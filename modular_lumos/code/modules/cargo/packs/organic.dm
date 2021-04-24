
/datum/supply_pack/organic/beer_run
	name = "Beer Run Crate"
	desc = "Get three six packs of Space Beer, for all your on-the-go alcoholism!"
	cost = 1150
	contains = list(/obj/item/storage/fancy/sixpack/beer,
					/obj/item/storage/fancy/sixpack/beer,
					/obj/item/storage/fancy/sixpack/beer)
	crate_name = "beer carrier crate"

/datum/supply_pack/organic/cola_run
	name = "Space Cola Crate"
	desc = "Get three six packs of Space Cola, in neat collector's glass bottles!"
	cost = 950
	contains = list(/obj/item/storage/fancy/sixpack/cola,
					/obj/item/storage/fancy/sixpack/cola,
					/obj/item/storage/fancy/sixpack/cola)
	crate_name = "space cola carrier crate"

/datum/supply_pack/organic/soda_variety
	name = "Soda Variety Pack"
	desc = "Get three 12-packs of the three most popular soda flavors!"
	cost = 960
	contains = list(/obj/item/storage/box/spacecola_twelvepack,
					/obj/item/storage/box/spacecola_twelvepack/starkist,
					/obj/item/storage/box/spacecola_twelvepack/space_up)
	crate_name = "soda variety crate"
