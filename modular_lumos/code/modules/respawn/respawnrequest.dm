#define RESPAWN_REQUEST_COOLDOWN (30 SECONDS)

GLOBAL_LIST_EMPTY(respawns)
GLOBAL_LIST_EMPTY(respawned_chars)

/datum/respawns/request
	var/player_ckey
	var/request_cooldown
	var/started_as_observer //so players can respawn if they initially observed

proc/GetRespawnRequest(mob/M)
	var/user_ckey = M.ckey
	for(var/datum/respawns/request/R in GLOB.respawns)
		if(user_ckey == R.player_ckey)
			return R
	return

proc/RespawnRequestCooldown(mob/M, amount)
	var/datum/respawns/request/R = GetRespawnRequest(M)
	R.request_cooldown = world.time + amount

proc/CheckRespawnedChars(mob/M)
	// returns true if character name in the currently selected slot exists in respawned_chars
	for(var/C in GLOB.respawned_chars)
		if(M.client.prefs.real_name == C)
			return TRUE
		return FALSE

proc/RequestRespawn(mob/dead/observer/M)
	// attempt to get existing request
	var/datum/respawns/request/R = GetRespawnRequest(M)
	if(R)
		// already created a request, display current cooldown time or send another alert
		if(R.request_cooldown > world.time)
			to_chat(usr, "<span class='notice'>Please wait [DisplayTimeText(R.request_cooldown - world.time)] before requesting a respawn again.</span>")
			return
		to_chat(usr, "<span class='notice'>Another respawn request has been created.</span>")
	else // doesnt exist, create a new request
		var/datum/respawns/request/NR = new /datum/respawns/request
		NR.player_ckey = M.ckey
		NR.request_cooldown = world.time + RESPAWN_REQUEST_COOLDOWN
		NR.started_as_observer = M.started_as_observer
		GLOB.respawns += NR

	// inform admins of new request
	log_admin("[key_name(usr)] requested to respawn")
	message_admins("[key_name_admin(M)] is requesting to respawn [ADMIN_RESPAWN_REQUEST_MONTY(M)]")
	RespawnRequestCooldown(M, RESPAWN_REQUEST_COOLDOWN)
	to_chat(usr, "<span class='notice'>Respawn request created. Please wait for an admin to decide.</span>")

/mob/dead/observer/proc/request_respawn()
	set category = "Ghost"
	set name = "Request Respawn"
	set desc = "Send a request to admins to be sent back to the lobby to respawn"

	switch(alert(src, "Are you sure you want to request a respawn?", "Confirm request", "Yes", "No"))
		if("Yes")
			RequestRespawn(usr)
