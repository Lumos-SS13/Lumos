//This is the file that handles donator loadout items.

/datum/gear/pingcoderfailsafe
	name = "IF YOU SEE THIS, PING A CODER RIGHT NOW!"
	category = SLOT_IN_BACKPACK
	path = /obj/item/bikehorn/golden
	ckeywhitelist = list("This entry should never appear with this variable set.") //If it does, then that means somebody fucked up the whitelist system pretty hard

/datum/gear/donortestingbikehorn
	name = "Donor item testing bikehorn"
	category = SLOT_IN_BACKPACK
	path = /obj/item/bikehorn
	geargroupID = list("DONORTEST") //This is a list mainly for the sake of testing, but geargroupID works just fine with ordinary strings

/datum/gear/kevhorn
	name = "Airhorn"
	category = SLOT_IN_BACKPACK
	path = /obj/item/bikehorn/airhorn
	ckeywhitelist = list("kevinz000")

/datum/gear/engravedzippo
	name = "Engraved zippo"
	category = SLOT_HANDS
	path = /obj/item/lighter/gold
	ckeywhitelist = list("dirtyoldharry")

/datum/gear/geisha
	name = "Geisha suit"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/costume/geisha
	ckeywhitelist = list("atiefling")

/datum/gear/santahat
	name = "Santa hat"
	category = SLOT_HEAD
	path = /obj/item/clothing/head/santa/fluff
	ckeywhitelist = list("illotafv")

/datum/gear/reindeerhat
	name = "Reindeer hat"
	category = SLOT_HEAD
	path = /obj/item/clothing/head/hardhat/reindeer/fluff
	ckeywhitelist = list("illotafv")

/datum/gear/treeplushie
	name = "Christmas tree plushie"
	category = SLOT_IN_BACKPACK
	path = /obj/item/toy/plush/tree
	ckeywhitelist = list("illotafv")

/datum/gear/santaoutfit
	name = "Santa costume"
	category = SLOT_WEAR_SUIT
	path = /obj/item/clothing/suit/space/santa/fluff
	ckeywhitelist = list("illotafv")

/datum/gear/carrotplush
	name = "Carrot plushie"
	category = SLOT_IN_BACKPACK
	path = /obj/item/toy/plush/carrot
	ckeywhitelist = list("improvedname")

/datum/gear/mankini
	name = "Mankini"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/misc/stripper/mankini
	ckeywhitelist = list("zigfie")

/datum/gear/AM4B
	name = "Foam Force AM4-B"
	category = SLOT_IN_BACKPACK
	path = /obj/item/gun/ballistic/automatic/AM4B
	ckeywhitelist = list("zeronetalpha")

/datum/gear/torisword
	name = "Rainbow Zweihander"
	category = SLOT_IN_BACKPACK
	path = /obj/item/dualsaber/hypereutactic/toy/rainbow
	ckeywhitelist = list("annoymous35")

/datum/gear/steelflask
	name = "Steel Flask"
	category = SLOT_IN_BACKPACK
	path = /obj/item/reagent_containers/food/drinks/flask/steel
	cost = 2
	ckeywhitelist = list("nik707")

/datum/gear/ssk
	name = "Stun Sword Kit"
	category = SLOT_IN_BACKPACK
	path = 	/obj/item/ssword_kit
	ckeywhitelist = list("phillip458")

/datum/gear/darkarmor
	name = "Dark Armor"
	category = SLOT_IN_BACKPACK
	path = /obj/item/clothing/suit/armor/vest/darkcarapace
	ckeywhitelist = list("inferno707")

/datum/gear/flagcape
	name = "US Flag Cape"
	category = SLOT_IN_BACKPACK
	path = /obj/item/clothing/neck/flagcape
	ckeywhitelist = list("darnchacha")

/datum/gear/raiqbawks
	name = "Miami Boombox"
	category = SLOT_HANDS
	cost = 2
	path = /obj/item/boombox/raiq
	ckeywhitelist = list("chefferz")

/datum/gear/m41
	name = "Toy M41"
	category = SLOT_IN_BACKPACK
	path = /obj/item/toy/gun/m41
	ckeywhitelist = list("thalverscholen")

/datum/gear/gothcoat
	name = "Goth Coat"
	category = SLOT_WEAR_SUIT
	path = /obj/item/clothing/suit/gothcoat
	ckeywhitelist = list("norko")

/datum/gear/corgisuit
	name = "Corgi Suit"
	category = SLOT_WEAR_SUIT
	path = /obj/item/clothing/suit/hooded/ian_costume
	ckeywhitelist = list("cathodetherobot")

/datum/gear/mimemask
	name = "Mime Mask"
	category = SLOT_WEAR_MASK
	path = /obj/item/clothing/mask/gas/mime
	ckeywhitelist = list("pireamaineach")

/datum/gear/mimeoveralls
	name = "Mime's Overalls"
	category = SLOT_WEAR_SUIT
	path = /obj/item/clothing/under/custom/mimeoveralls
	ckeywhitelist = list("pireamaineach")

/datum/gear/soulneck
	name = "Soul Necklace"
	category = SLOT_NECK
	path = /obj/item/clothing/neck/undertale
	ckeywhitelist = list("twilightic")

/datum/gear/frenchberet
	name = "French Beret"
	category = SLOT_HEAD
	path = /obj/item/clothing/head/frenchberet
	ckeywhitelist = list("notazoltan")

/datum/gear/onionneck
	name = "Onion Necklace"
	category = SLOT_NECK
	path = /obj/item/clothing/neck/necklace/onion
	ckeywhitelist = list("cdrcross")
