
// EVA Suits - Protective hardsuits for high-intensity emergencies //

/obj/item/clothing/suit/space/eva
	name = "EVA suit"
	icon_state = "space"
	item_state = "s_suit"
	desc = "A lightweight space suit with the basic ability to protect the wearer from the vacuum of space during emergencies."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 20, "fire" = 50, "acid" = 65, "wound" = 1)

/obj/item/clothing/head/helmet/space/eva
	name = "EVA helmet"
	icon_state = "space"
	item_state = "space"
	desc = "A lightweight space helmet with the basic ability to protect the wearer from the vacuum of space during emergencies."
	flash_protect = 0
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 20, "fire" = 50, "acid" = 65, "wound" = 1)

// For Paramedics - Distinctive coloration
/obj/item/clothing/suit/space/eva/paramedic
	name = "paramedic EVA suit"
	icon_state = "paramedic-eva"
	item_state = "paramedic-eva"
	desc = "A deep blue space suit decorated with red and white crosses to indicate that the wearer is trained emergency medical personnel."
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/roller)

/obj/item/clothing/head/helmet/space/eva/paramedic
	name = "paramedic EVA helmet"
	desc = "A deep blue space helmet with a large red cross on the faceplate to designate the wearer as trained emergency medical personnel."
	icon_state = "paramedic-eva-helmet"
	item_state = "paramedic-eva-helmet"

