//These scythes are pretty nice...
/datum/design/base_scythe
	name = "Simple Scythe"
	desc = "A scythe that can somewhat deal with kudzu."
	id = "base_scythe"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 300, /datum/material/glass = 300)
	build_path = /obj/item/scythe
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/super_scythe
	name = "Super Scythe"
	desc = "A scythe that can decently deal with kudzu."
	id = "super_scythe"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600)
	build_path = /obj/item/scythe/super
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/ultra_scythe
	name = "Ultra Scythe"
	desc = "A scythe that can decimate the kudzu."
	id = "ultra_scythe"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1200, /datum/material/glass = 1200)
	build_path = /obj/item/scythe/ultra
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
