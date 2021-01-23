
/// SPECIAL SEAFOOD ///

/obj/item/reagent_containers/food/snacks/fish_bones
	name = "fish bones"
	desc = "Fish bones, aren't you glad these are out here?"
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "bone"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("fish" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/fish_eggs
	name = "fish eggs"
	desc = "A sticky little clump of roe."
	icon = 'modular_lumos/icons/obj/fish_items.dmi'
	icon_state = "eggs"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("fish" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/toxic_spines
	name = "toxic spines"
	desc = "The flexible spines of an Asteroid Worm, still filled with poison."
	icon = 'modular_lumos/icons/obj/fish_items.dmi'
	icon_state = "toxicspine"
	list_reagents = list(/datum/reagent/toxin/cyanide = 0.15, /datum/reagent/toxin/staminatoxin = 0.2, /datum/reagent/consumable/nutriment = 0.3)
	tastes = list("bitter" = 15, "muck" = 3)
	foodtype = GROSS | TOXIC

/// RAW MEAT (Lesser Carp use real carp meat) ///

/obj/item/reagent_containers/food/snacks/shrimp_raw
	name = "raw shrimp"
	desc = "A raw shrimp, not recommended for consumption."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "shrimp_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/shrimp
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shrimp" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/catfish_raw
	name = "raw catfish"
	desc = "Raw catfish, not recommended for consumption."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "catfishfillet"
	cooked_type = /obj/item/reagent_containers/food/snacks/catfish
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("catfish" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/salmon_raw
	name = "raw salmon"
	desc = "Raw salmon, not recommended for consumption."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "salmonfishfillet"
	cooked_type = /obj/item/reagent_containers/food/snacks/salmon
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("salmon" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/lobster_raw
	name = "raw lobster"
	desc = "Raw lobster, not recommended for consumption."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "raw_lobster_meat"
	cooked_type = /obj/item/reagent_containers/food/snacks/basic_lobster
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("lobster" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/lobster_raw_tail
	name = "raw lobster tail"
	desc = "Raw lobster tail, not recommended for consumption."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "raw_lobster_tail"
	cooked_type = /obj/item/reagent_containers/food/snacks/baked_lobster_tail
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("lobster" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/seadevil_raw
	name = "raw sea devil meat"
	desc = "Raw sea devil, even in death it taunts you."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "devilfillet"
	cooked_type = /obj/item/reagent_containers/food/snacks/seadevil
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("annoyance" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/shark_raw // Don't eat shark IRL, it's bad for the environment
	name = "raw shark meat"
	desc = "Raw shark meat, not recommended for consumption."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "fishfillet"
	cooked_type = /obj/item/reagent_containers/food/snacks/baked_lobster_tail
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shark" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/shark_raw_fin
	name = "raw shark fin"
	desc = "Raw shark fin, not recommended for consumption."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "shark_fin"
	cooked_type = /obj/item/reagent_containers/food/snacks/baked_lobster_tail
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shark" = 5, "salt" = 1)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/asteroid_worm_raw
	name = "despined asteroid slug"
	desc = "Raw asteroid slug is actually considered a delicacy to Vox. If the smell already didn't put you off, imagine hundreds of these at a Vox banquet."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "worm_dead"
	cooked_type = /obj/item/reagent_containers/food/snacks/asteroid_worm
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("sickly-sweet" = 15, "dirt" = 3)
	foodtype = MEAT | RAW

/// COOKED SEAFOOD (NON-SUSHI) ///

/obj/item/reagent_containers/food/snacks/shrimp
	name = "cooked shrimp"
	desc = "A small shrimp, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "shrimp_cooked"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shrimp" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/shrimpskewer
	name = "shrimp skewer"
	desc = "Four Shrimp stuck on a rod. Peak dining."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "shrimpskewer"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 10, /datum/reagent/consumable/nutriment = 20, /datum/reagent/consumable/nutriment/vitamin = 8)
	tastes = list("shrimp" = 30, "salt" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/catfish
	name = "cooked catfish"
	desc = "Catfish meat, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "friedcatfish"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("catfish" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/salmon
	name = "cooked salmon"
	desc = "Salmon meat, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "smokedsalmon"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("salmon" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/seadevil
	name = "cooked sea devil"
	desc = "Little fucker deserved it."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "cooked_devil"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("relief" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/devilburger
	name = "Sea Devil Burger"
	desc = "Not as tasty as you'd think."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "devilburger"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("relief" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/basic_lobster
	name = "steamed lobster"
	desc = "Uniformly steamed lobster."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "lobster_steamed_simple"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("lobster" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/deluxe_lobster
	name = "deluxe steamed lobster"
	desc = "Lobster boiled to perfection and garnished with lemon juice and greens. A proper meal for a king."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "lobster_steamed_deluxe"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 5)
	tastes = list("lobster" = 15, "salt" = 3, "lemon" = 3, "greens" = 3)
	foodtype = MEAT | FRUIT | VEGETABLES

/obj/item/reagent_containers/food/snacks/baked_lobster_tail
	name = "baked lobster tail"
	desc = "Lobster tail baked to a satisfying crispness."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "lobster_tail_baked"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("lobster" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/shark
	name = "pan-seared shark meat"
	desc = "Cooked shark meat. Ecologist are crying."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "sharkfillet"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shark" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/shark_fin
	name = "dried shark fin"
	desc = "Dried shark fin, for soups and grinding into gelatin."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "shark_fin_dry"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shark" = 5, "salt" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/asteroid_worm
	name = "baked asteroid worm"
	desc = "Baked evenly and throughout. Still smells abit off, and it doesn't look much better."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "cooked_worm"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("berries" = 5, "dirt" = 1)
	foodtype = MEAT

/// SUSHI ///

/obj/item/reagent_containers/food/snacks/lobster_sushi
	name = "lobster sushi"
	desc = "An inexpensive and fairly common form of sushi, often favored for its mild sweetness."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "lobster_sushi"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("lobster" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/masago_sushi
	name = "masago sushi"
	desc = "A clump of roe sat in a roll of seaweed. A staple of sushi."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Masago"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("roe" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/ikura_sushi
	name = "ikura sushi"
	desc = "A clump of usually salmon roe in a roll of seaweed. A very common type of sushi."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Ikura"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("roe" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/ebi_sushi
	name = "ebi sushi"
	desc = "A simple shrimp set on a bed of rice. A staple of sushi."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Ebi"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shrimp" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/tamago_sushi
	name = "tamago sushi"
	desc = "A small rolled omelette set on a bed of rice. A staple of sushi."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Tamago"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("egg" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/sake_sushi
	name = "sake sushi"
	desc = "A delicate filet of salmon set on a bed of rice. A staple of sushi."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Sake"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("salmon" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/cooked_salmon_sushi
	name = "cooked salmon sushi"
	desc = "Cooked salmon set on a bed or rice with a seaweed wrap. A common form of sushi."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_SmokedSalmon"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("salmon" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/devilsashimi
	name = "sea devil sashimi"
	desc = "A very colorful plate of sea devil sashimi, with a dipping cup of soy sauce."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "devilsashimi"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("relief" = 10, "annoyance" = 10, "salt" = 3)
	foodtype = MEAT
