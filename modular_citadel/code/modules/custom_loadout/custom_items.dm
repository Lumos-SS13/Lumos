
//For custom items.

// Unless there's a digitigrade version make sure you add mutantrace_variation = NONE to all clothing/under and shoes - Pooj
// Digitigrade stuff is uniform_digi.dmi and digishoes.dmi in icons/mob

/obj/item/custom/ceb_soap
	name = "Cebutris' Soap"
	desc = "A generic bar of soap that doesn't really seem to work right."
	gender = PLURAL
	icon = 'icons/obj/custom.dmi'
	icon_state = "cebu"
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON

/obj/item/soap/cebu //real versions, for admin shenanigans. Adminspawn only
	desc = "A bright blue bar of soap that smells of wolves"
	icon = 'icons/obj/custom.dmi'
	icon_state = "cebu"

/obj/item/soap/cebu/fast //speedyquick cleaning version. Still not as fast as Syndiesoap. Adminspawn only.
	cleanspeed = 15

/obj/item/clothing/neck/cloak/inferno
	name = "Kiara's Cloak"
	desc = "The design on this seems a little too familiar."
	icon = 'icons/obj/custom.dmi'
	icon_state = "infcloak"
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	item_state = "infcloak"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/neck/petcollar/inferno
	name = "Kiara's Collar"
	desc = "A soft black collar that seems to stretch to fit whoever wears it."
	icon = 'icons/obj/custom.dmi'
	icon_state = "infcollar"
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	item_state = "infcollar"
	tagname = null

/obj/item/toy/darksabre
	name = "Kiara's Sabre"
	desc = "This blade looks as dangerous as its owner."
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "darksabre"
	item_state = "darksabre"
	lefthand_file = 'modular_citadel/icons/mob/inhands/stunsword_left.dmi'
	righthand_file = 'modular_citadel/icons/mob/inhands/stunsword_right.dmi'
	attack_verb = list("attacked", "struck", "hit")

/obj/item/toy/darksabre/get_belt_overlay()
	return mutable_appearance('icons/obj/custom.dmi', "darksheath-darksabre")

/obj/item/toy/darksabre/get_worn_belt_overlay(icon_file)
	return mutable_appearance(icon_file, "darksheath-darksabre")

/obj/item/storage/belt/sabre/darksabre
	name = "Ornate Sheathe"
	desc = "An ornate and rather sinister looking sabre sheathe."
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "darksheath"
	item_state = "darksheath"
	fitting_swords = list(/obj/item/toy/darksabre)
	starting_sword = /obj/item/toy/darksabre

/obj/item/lighter/gold
	name = "\improper Engraved Zippo"
	desc = "A shiny and relatively expensive zippo lighter. There's a small etched in verse on the bottom that reads, 'No Gods, No Masters, Only Man.'"
	icon = 'icons/obj/custom.dmi'
	icon_state = "gold_zippo"
	item_state = "gold_zippo"
	w_class = WEIGHT_CLASS_TINY
	flags_1 = CONDUCT_1
	slot_flags = SLOT_BELT
	heat = 1500
	resistance_flags = FIRE_PROOF
	light_color = LIGHT_COLOR_FIRE

/obj/item/toy/plush/carrot
	name = "carrot plushie"
	desc = "While a normal carrot would be good for your eyes, this one seems a bit more for hugging then eating."
	icon = 'icons/obj/hydroponics/harvest.dmi'
	icon_state = "carrot"
	item_state = "carrot"
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("slapped")
	resistance_flags = FLAMMABLE
	squeak_override = list('sound/items/bikehorn.ogg'= 1)

/obj/item/toy/plush/tree
	name = "christmass tree plushie"
	desc = "A festive plush that squeeks when you squeeze it!"
	icon = 'icons/obj/custom.dmi'
	icon_state = "pine_c"
	item_state = "pine_c"
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("slapped")
	resistance_flags = FLAMMABLE
	squeak_override = list('sound/misc/server-ready.ogg'= 1)

/obj/item/clothing/head/hardhat/reindeer/fluff
	name = "novelty reindeer hat"
	desc = "Some fake antlers and a very fake red nose - Sponsored by PWR Game(tm)"
	icon_state = "hardhat0_reindeer"
	item_state = "hardhat0_reindeer"
	hat_type = "reindeer"
	flags_inv = 0
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	brightness_on = 0 //luminosity when on
	dynamic_hair_suffix = ""

/obj/item/clothing/head/santa/fluff
	name = "santa's hat"
	desc = "On the first day of christmas my employer gave to me! - From Vlad with Salad"
	icon_state = "santahatnorm"
	item_state = "that"
	dog_fashion = /datum/dog_fashion/head/santa

//Removed all of the space flags from this suit so it utilizes nothing special.
/obj/item/clothing/suit/space/santa/fluff
	name = "Santa's suit"
	desc = "Festive!"
	icon_state = "santa"
	item_state = "santa"
	slowdown = 0

/obj/item/reagent_containers/food/drinks/flask/steel
	name = "steel flask"
	desc = "A plain steel flask, because alcoholism is to spacemen as STDs are to Felinids; All of them have it."
	icon = 'icons/obj/custom.dmi'
	icon_state = "steelflask"
	volume = 60

/obj/item/clothing/under/sweater/black/naomi
	name = "worn black sweater"
	mutantrace_variation = NONE
	desc = "A well-loved sweater, showing signs of several cleanings and re-stitchings. And a few stains. Is that cat fur?"

/obj/item/clothing/neck/petcollar/naomi
	name = "worn pet collar"
	desc = "a pet collar that looks well used."

/obj/item/clothing/neck/cloak/green
	name = "Generic Green Cloak"
	desc = "This cloak doesn't seem too special."
	icon = 'icons/obj/custom.dmi'
	icon_state = "wintergreencloak"
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	item_state = "wintergreencloak"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/head/paperhat
	name = "paperhat"
	desc = "A piece of paper folded into neat little hat."
	icon_state = "paperhat"
	item_state = "paperhat"

/obj/item/clothing/neck/flagcape
	name = "banner of patriots"
	desc = "A idealistic relic of an era when humans on other planets was a mere dream."
	icon = 'icons/obj/custom.dmi'
	resistance_flags = FLAMMABLE
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "flagcape"
	item_state = "flagcape"

/obj/item/clothing/shoes/gold_trim
	name = "parade jackboots"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	desc = "They lack literally all the benefits of standard jackboots, but damn do they look nice."
	item_state = "luckyjack"
	icon_state = "luckyjack"
	mutantrace_variation = NONE

/obj/item/clothing/under/custom/mimeoveralls
	name = "Mime's Overalls"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	desc = "A less-than-traditional mime's attire, completed by a set of dorky-looking overalls."
	item_state = "moveralls"
	icon_state = "moveralls"
	mutantrace_variation = NONE

/obj/item/clothing/neck/necklace/onion
	name = "Onion Necklace"
	desc = "A string of onions sequenced together to form a necklace."
	icon = 'icons/obj/custom.dmi'
	icon_state = "onion"
	item_state = "onion"
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/under/custom/white_bikini
	name = "white bikini"
	desc = "Riske!"
	icon_state = "mikubikini"
	item_state = "mikubikini"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	mutantrace_variation = NONE

/obj/item/toy/plush/mammal/dog/fritz
	icon = 'icons/obj/custom.dmi'
	icon_state = "fritz"
	item_state = "fritz"
	attack_verb = list("barked", "boofed", "shotgun'd")
	obj_flags = UNIQUE_RENAME
	unique_reskin = list("Goodboye" = "fritz", "Badboye" = "fritz_bad")
	mutantrace_variation = NONE

/obj/item/clothing/neck/cloak/polychromic/polyce
	name = "polychromic embroidered cloak"
	desc = "A fancy cloak embroidered with polychromatic thread in a pattern that reminds one of the wielders of unlimited power."
	icon_state = "polyce"
	poly_colors = list("#808080", "#8CC6FF", "#FF3535")

/obj/item/clothing/mask/luchador/zigfie // Stub-code - was causing errors with maint loot for some weird reason.
