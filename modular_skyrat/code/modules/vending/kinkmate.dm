/obj/machinery/vending/kink
	name = "KinkMate"
	desc = "A vending machine from Hor-Tec, for all your time-wasting needs. Technically speaking, this is corporate contraband on Nanotrasen installations."
	icon_state = "kink"
	product_slogans = "Kinky!;Sexy!;New from Hor-Tec!"
	vend_reply = "Have fun, you pervert!"

	products = list( //Relatively normal to have, I GUESS
		/obj/item/clothing/under/costume/maid = 2,
		/obj/item/clothing/under/rank/civilian/janitor/maid = 2,
		/obj/item/clothing/under/misc/stripper = 4,
		/obj/item/clothing/under/misc/stripper/green = 4,
		/obj/item/clothing/under/misc/gear_harness = 4,
		/obj/item/clothing/under/shorts/polychromic/pantsu = 4,
		/obj/item/clothing/under/misc/poly_bottomless = 4,
		/obj/item/clothing/under/misc/poly_tanktop = 4,
		/obj/item/clothing/under/misc/poly_tanktop/female = 4,
		/obj/item/clothing/neck/petcollar = 8,
		/obj/item/clothing/neck/petcollar/choker = 4,
		/obj/item/clothing/neck/petcollar/leather = 4,
		/obj/item/restraints/handcuffs/fake/kinky = 8,
		/obj/item/clothing/glasses/sunglasses/blindfold = 4,
		/obj/item/clothing/mask/muzzle = 8,
		/obj/item/clothing/head/kitty = 4,
		/obj/item/clothing/head/rabbitears = 4,
		/obj/item/dildo/custom = 4,
		/obj/item/reagent_containers/pill/crocin = 10,
		/obj/item/reagent_containers/pill/camphor = 10
	)

	contraband = list( //Actually dangerous or exploitable shit.
		/obj/item/clothing/neck/petcollar/locked = 2,
		/obj/item/key/collar = 2,
		/obj/item/clothing/under/misc/stripper/mankini = 4,
		/obj/item/clothing/under/misc/keyholesweater = 2,
		/obj/item/electropack/shockcollar = 4,
		/obj/item/assembly/signaler = 4,
		/obj/item/dildo/flared/huge = 4,
		/obj/item/reagent_containers/pill/hexacrocin = 5
	)

	premium = list(
		/obj/item/clothing/under/costume/jabroni = 2, // Jabroni outfit is 300 credits
		/obj/item/bdsm_whip = 1,
		/obj/item/clothing/under/dress/corset = 4,
		/obj/item/clothing/under/pants/chaps = 4,
		/obj/item/clothing/accessory/skullcodpiece/fake = 4,
		/obj/item/reagent_containers/pill/penis_enlargement = 3,
		/obj/item/reagent_containers/pill/breast_enlargement = 3
	)

	refill_canister = /obj/item/vending_refill/kink

/obj/item/vending_refill/kink
	machine_name 	= "KinkMate"
	icon_state 		= "refill_kink"
