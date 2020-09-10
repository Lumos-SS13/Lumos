/mob/dead/new_player/Login()
	if(CONFIG_GET(flag/use_exp_tracking))
		client.set_exp_from_db()
		client.set_db_player_flags()
	if(!mind)
		mind = new /datum/mind(key)
		mind.active = 1
		mind.current = src

	..()

	var/motd = global.config.motd
	if(motd)
		to_chat(src, "<div class=\"motd\">[motd]</div>", handle_whitespace=FALSE)

	if(GLOB.admin_notice)
		to_chat(src, "<span class='notice'><b>Admin Notice:</b>\n \t [GLOB.admin_notice]</span>")

	var/spc = CONFIG_GET(number/soft_popcap)
	if(spc && living_player_count() >= spc)
		to_chat(src, "<span class='notice'><b>Server Notice:</b>\n \t [CONFIG_GET(string/soft_popcap_message)]</span>")

	sight |= SEE_TURFS

	//LUMOS EDIT START - LOBBYCAM
	var/obj/screen/lumoslogo = new()
	lumoslogo.name = "Lumos Station"
	lumoslogo.icon = 'modular_lumos/icons/lumoslogo.dmi'
	lumoslogo.icon_state = "lumoslogo"
	lumoslogo.screen_loc = "south:16,east-5:10"
	lumoslogo.alpha = round(255*0.7,1)
	lumoslogo.mouse_opacity = 0
	lumoslogo.layer = 20
	lumoslogo.plane = 100
	if (client)
		client.screen += lumoslogo
	//LUMOS EDIT STOP - LOBBYCAM

	new_player_panel()
	client.playtitlemusic()
	if(SSticker.current_state < GAME_STATE_SETTING_UP)
		var/tl = SSticker.GetTimeLeft()
		var/postfix
		if(tl > 0)
			postfix = "in about [DisplayTimeText(tl)]"
		else
			postfix = "soon"
		to_chat(src, "Please set up your character and select \"Ready\". The game will start [postfix].")
