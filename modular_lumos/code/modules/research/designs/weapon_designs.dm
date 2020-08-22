/datum/design/pin_redalert
	name = "Red-Alert Firing Pin"
	desc = "This is a security firing pin which only works on Red Alert and above."
	id = "pin_redalert"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300)
	build_path = /obj/item/firing_pin/red_alert
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_commandapproved
	name = "Command-Approved Firing Pin"
	desc = "This is a security firing pin which only works on command keycard authentication approval."
	id = "pin_commandapproved"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300)
	build_path = /obj/item/firing_pin/command_pin
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
