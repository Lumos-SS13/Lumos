//red alert firing pin
/obj/item/firing_pin/red_alert
	name = "red-alert firing pin"
	desc = "A small authentication device, to be inserted into a firearm receiver to allow operation. Can only be fired on Red Alert and above."
	fail_message = "<span class='warning'>INVALID ALERT LEVEL.</span>"

/obj/item/firing_pin/red_alert/pin_auth(mob/living/user)
	if(GLOB.security_level < SEC_LEVEL_RED)
		return FALSE
	return TRUE
	
//command keycard_auth firing pin
/obj/item/firing_pin/command_pin
	name = "command-approved firing pin"
	desc = "A small authentication device, to be inserted into a firearm receiver to allow operation. Can only be fired if command approves."
	fail_message = "<span class='warning'>COMMAND HAS NOT APPROVED FIRING.</span>"

/obj/item/firing_pin/command_pin/pin_auth(mob/living/user)
	if(!GLOB.pin_auth)
		return FALSE
	return TRUE
