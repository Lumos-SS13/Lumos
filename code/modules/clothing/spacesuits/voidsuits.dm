////////////////
// Void Suits //
////////////////

/* Void suits are taken similarly to the old nasa space suit, the intended purpose is to make spacewalks and EVA
	a venture less immediately safe. Think of the EVA suit as an armored space suit, whereas a voidsuit is a standard civilian-grade space suit.
*/

/obj/item/clothing/head/helmet/space/voidsuit
	name = "Generic Voidsuit Helmet"
	desc = "A generic knock-off voidsuit helmet. Voidsuits are more cheaper, comfortable, and maneuverable spacesuits at the cost of durability and physical protection."
	icon_state = "void_generic"
	item_state = "void_generic"
	strip_delay = 65
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 20, "fire" = 50, "acid" = 15, "wound" = 1)

/obj/item/clothing/suit/space/voidsuit
	name = "Generic Voidsuit"
	desc = "A generic knock-off voidsuit.  Hermetic sealing makes a cheap, albiet unprotective spacesuit helmet."
	strip_delay = 65
	slowdown = 2
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 20, "fire" = 50, "acid" = 15, "wound" = 1)

// NASA suit - Entirely for /obj/item/storage/box/hero/astronaut
/obj/item/clothing/head/helmet/space/voidsuit/og_spessman
	name = "Ancient Space Helmet"
	desc = "Complete with even a UV visor and the ability to breath!"
	icon_state = "spaceold"
	item_state = "spaceold"
	strip_delay = 65

/obj/item/clothing/suit/space/voidsuit/og_spessman
	name = "Ancient Spacesuit"
	desc = "This belongs in a museum!"
	icon_state = "spaceold_ogspess"
	strip_delay = 65
	slowdown = 4

// NASA-NT suit
/obj/item/clothing/head/helmet/space/voidsuit/nasa
	name = "NASA-NT Voidsuit Helmet"
	desc = "An old, NASA-NT CentCom branch voidsuit helmet. Hermetically seals with an appropriate spacesuit."
	icon_state = "void"
	item_state = "void"

/obj/item/clothing/suit/space/voidsuit/nasa
	name = "NASA-NT Voidsuit"
	icon_state = "void"
	item_state = "void"
	desc = "An old, NASA-NT CentCom branch voidsuit. A cheap, albiet fragile, space suit used for general external work."
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/multitool)
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/head/helmet/space/voidsuit/nasa/old
	name = "Engineering Voidsuit Helmet"
	desc = "An old, NASA-NT CentCom branch voidsuit helmet. While it's battered and dusty from neglect, it still gets the job done."
	icon_state = "void"
	item_state = "void"

/obj/item/clothing/suit/space/voidsuit/nasa/old
	name = "Engineering Voidsuit"
	icon_state = "void"
	item_state = "void"
	desc = "An old, NASA-NT CentCom branch voidsuit. Age and neglect have ruined the interior joints making movement difficult and slow. Thankfully, it's still spaceworthy."
	slowdown = 4
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/multitool)

//Radiation
/obj/item/clothing/head/helmet/space/voidsuit/rad
	name = "radiation voidsuit helmet"
	desc = "A special helmet that protects against radiation and space. Not much else unfortunately."
	icon_state = "cespace_helmet"
	item_state = "nothing"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 0, "wound" = 0)
	resistance_flags = FIRE_PROOF
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE
	actions_types = list()

/obj/item/clothing/suit/space/voidsuit/rad
	name = "radiation voidsuit"
	desc = "A special suit that protects against radiation and space. Not much else unfortunately."
	icon_state = "hardsuit-rad"
	item_state = "nothing"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 100, "fire" = 0, "acid" = 0, "wound" = 0)
	resistance_flags = FIRE_PROOF
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE
	mutantrace_variation = NONE

// fragile suit
/obj/item/clothing/head/helmet/space/fragile
	name = "emergency space helmet"
	desc = "A bulky, air-tight helmet meant to protect the user during emergency situations. It doesn't look very durable."
	icon_state = "syndicate-helm-orange"
	item_state = "syndicate-helm-orange"
	armor = list("melee" = 5, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 10, "fire" = 0, "acid" = 0, "wound" = 0)
	strip_delay = 65

/obj/item/clothing/suit/space/fragile
	name = "emergency space suit"
	desc = "A bulky, air-tight suit meant to protect the user during emergency situations. It doesn't look very durable."
	var/torn = FALSE
	icon_state = "syndicate-orange"
	item_state = "syndicate-orange"
	slowdown = 2
	armor = list("melee" = 5, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 10, "fire" = 0, "acid" = 0, "wound" = 0)
	strip_delay = 65

/obj/item/clothing/suit/space/fragile/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	. = ..()
	if(!torn && prob(50) && damage >= 5)
		to_chat(owner, "<span class='warning'>[src] tears from the damage, breaking the air-tight seal!</span>")
		clothing_flags &= ~STOPSPRESSUREDAMAGE
		name = "torn [src]."
		desc = "A bulky suit meant to protect the user during emergency situations, at least until someone tore a hole in the suit."
		torn = TRUE
		playsound(loc, 'sound/weapons/slashmiss.ogg', 50, 1)
		playsound(loc, 'sound/effects/refill.ogg', 50, 1)
