//##########lumos specific snowflake items##########

//spensara + unclebourbon snowflake mask
/obj/item/clothing/mask/gas/sec_snowflake
	name = "private military mask"
	desc = "An elite military gas mask."
	icon = 'modular_lumos/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_lumos/icons/mob/clothing/mask.dmi'
	icon_state = "sec_snowflake"
	item_state = "sec_snowflake"
	resistance_flags = FLAMMABLE
	max_integrity = 100
	dog_fashion = null
	modifies_speech = TRUE
	var/waifu_mode = TRUE
	actions_types = list(/datum/action/item_action/snowflake/toggle_waifu)

/obj/item/clothing/mask/gas/sec_snowflake/handle_speech(datum/source, list/speech_args) // copied from space ninja mask code YEET
	if(!waifu_mode)
		return

	var/message = speech_args[SPEECH_MESSAGE]
	if(message[1] != "*")
		var/list/temp_message = splittext(message, " ")
		var/list/pick_list = list()
		for(var/i in 1 to temp_message.len)
			pick_list += i
		for(var/i in 1 to abs(temp_message.len/3))
			var/H = pick(pick_list)
			if(findtext(temp_message[H], "*") || findtext(temp_message[H], ";") || findtext(temp_message[H], ":"))
				continue
			temp_message[H] = ninjaspeak(temp_message[H])
			pick_list -= H
		message = temp_message.Join(" ")

		//The Alternate speech mod is now the main one.
		message = replacetext(message, "l", "r")
		message = replacetext(message, "rr", "ru")
		message = replacetext(message, "v", "b")
		message = replacetext(message, "f", "hu")
		message = replacetext(message, "'t", "")
		message = replacetext(message, "t ", "to ")
		message = replacetext(message, " I ", " ai ")
		message = replacetext(message, "th", "z")
		message = replacetext(message, "is", "izu")
		message = replacetext(message, "ziz", "zis")
		message = replacetext(message, "se", "su")
		message = replacetext(message, "br", "bur")
		message = replacetext(message, "ry", "ri")
		message = replacetext(message, "you", "yuu")
		message = replacetext(message, "ck", "cku")
		message = replacetext(message, "eu", "uu")
		message = replacetext(message, "ow", "au")
		message = replacetext(message, "are", "aa")
		message = replacetext(message, "ay", "ayu")
		message = replacetext(message, "ea", "ii")
		message = replacetext(message, "ch", "chi")
		message = replacetext(message, "than", "sen")
		message = replacetext(message, ".", "")
		message = lowertext(message)
		speech_args[SPEECH_MESSAGE] = message

/obj/item/clothing/mask/gas/sec_snowflake/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Waifu mode is currently [ waifu_mode ? "enabled" : "disabled"].</span>"

/datum/action/item_action/snowflake/toggle_waifu
	name = "Toggle waifu mode"
	desc = "Allows you to create a stunning Judicial Marker at any location in view. Click again to disable."

/obj/item/clothing/mask/gas/sec_snowflake/ui_action_click(mob/user, action)
	toggle_waifu(user)

/obj/item/clothing/mask/gas/sec_snowflake/proc/toggle_waifu(mob/living/user)
	waifu_mode = !waifu_mode
	to_chat(user, "<span class='notice'>Waifu mode [ waifu_mode ? "enabled" : "disabled"].</span>")
