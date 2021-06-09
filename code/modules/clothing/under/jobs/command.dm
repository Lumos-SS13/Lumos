/obj/item/clothing/under/rank/captain
	desc = "It's a formal blue jumpsuit denoting the rank of \"Captain\"."
	name = "captain's jumpsuit"
	icon_state = "captain"
	item_state = "b_suit"
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	//skyrat edit
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 15)
	//

/obj/item/clothing/under/rank/captain/skirt
	name = "captain's dress"
	desc = "It's a formal blue dress denoting the rank of \"Captain\". Practical and stylish."
	icon_state = "captain_skirt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/rank/captain/suit
	name = "captain's suit"
	desc = "A green suit and yellow necktie. Exemplifies authority."
	icon_state = "green_suit"
	item_state = "dg_suit"
	can_adjust = FALSE

/obj/item/clothing/under/rank/captain/suit/skirt
	name = "green suitskirt"
	desc = "A green suitskirt and yellow necktie. Exemplifies authority."
	icon_state = "green_suit_skirt"
	item_state = "dg_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/rank/captain/navy_formal
	name = "captain's navy formal uniform"
	desc = "The formal dress for Nanotrasen naval Captains. For those extra special occasions."
	icon_state = "captain_parade"
	item_state = "by_suit"
	can_adjust = FALSE
