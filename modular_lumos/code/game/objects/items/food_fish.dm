/obj/item/reagent_containers/food/snacks/fish_bones
	name = "fish bones"
	desc = "Fish bones, aren't you glad these are out here?"
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "bone"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("fish" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/fish_eggs
	name = "fish eggs"
	desc = "A small group of fish eggs."
	icon = 'modular_lumos/icons/obj/fish_items.dmi'
	icon_state = "eggs"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("fish" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/shrimp_raw
	name = "raw shrimp"
	desc = "A small shrimp, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "shrimp_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/shrimp
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shrimp" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/shrimp
	name = "cooked shrimp"
	desc = "A small shrimp, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "shrimp_cooked"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shrimp" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/catfish_raw
	name = "raw catfish"
	desc = "Catfish meat, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "fishfillet"
	cooked_type = /obj/item/reagent_containers/food/snacks/catfish
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("catfish" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/catfish
	name = "cooked catfish"
	desc = "Catfish meat, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "friedcatfish"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("catfish" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/salmon_raw
	name = "raw salmon"
	desc = "Salmon meat, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "fishfillet"
	cooked_type = /obj/item/reagent_containers/food/snacks/salmon
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("salmon" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/salmon
	name = "cooked salmon"
	desc = "Salmon meat, ready to be eaten."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "smokedsalmon"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("salmon" = 15, "salt" = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/lobster_raw
	name = "raw lobster"
	desc = "Lobster meat, ready to be eaten."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "raw_lobster_meat"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("lobster" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/lobster_raw_tail
	name = "raw lobster tail"
	desc = "Lobster tail meat, ready to be eaten."
	icon = 'modular_lumos/icons/obj/food.dmi'
	icon_state = "raw_lobster_tail"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("lobster" = 15, "salt" = 3)
	foodtype = MEAT | RAW

/obj/item/reagent_containers/food/snacks/masago_sushi
	name = "masago sushi"
	desc = "Rice with roe... mmm, fish eggs."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Masago"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("roe" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/ikura_sushi
	name = "ikura sushi"
	desc = "Rice with roe... mmm, fish eggs."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Ikura"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("roe" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/ebi_sushi
	name = "ebi sushi"
	desc = "Rice with shrimp... mmm, shrimp."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Ebi"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("shrimp" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/tamago_sushi
	name = "tamago sushi"
	desc = "Rice with egg... mmm, egg."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Tamago"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("egg" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/sake_sushi
	name = "sake sushi"
	desc = "Rice with raw salmon... mmm, fish."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_Sake"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("salmon" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/cooked_salmon_sushi
	name = "cooked salmon sushi"
	desc = "Rice with cooked salmon... mmm, fish."
	icon = 'modular_lumos/icons/obj/seafood.dmi'
	icon_state = "sushi_SmokedSalmon"
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 5, /datum/reagent/mercury = 2, /datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("salmon" = 15, "salt" = 3, "rice" = 3, "seaweed" = 3)
	foodtype = MEAT | GRAIN | VEGETABLES
