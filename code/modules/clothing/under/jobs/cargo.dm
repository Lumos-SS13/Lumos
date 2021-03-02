
/obj/item/clothing/under/rank/cargo/qm
	name = "quartermaster's jumpsuit"
	desc = "It's a jumpsuit worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm"
	item_state = "lb_suit"

/obj/item/clothing/under/rank/cargo/tech
	name = "cargo technician's jumpsuit"
	desc = "Shooooorts! They're comfy and easy to wear!"
	icon_state = "cargo"
	item_state = "lb_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/cargo/miner
	desc = "It's a snappy jumpsuit with a sturdy set of overalls. It is very dirty."
	name = "shaft miner's jumpsuit"
	icon_state = "miner"
	item_state = "miner"
	//skyrat edit
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 0, "wound" = 10)
	//

/obj/item/clothing/under/rank/cargo/miner/lavaland
	desc = "A green uniform for operating in hazardous environments."
	name = "shaft miner's jumpsuit"
	icon_state = "explorer"
	item_state = "explorer"
	can_adjust = FALSE
