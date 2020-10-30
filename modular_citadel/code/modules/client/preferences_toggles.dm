TOGGLE_CHECKBOX(/datum/verbs/menu/Settings/Sound, togglehoundsleeper)()
	set name = "Toggle Voracious Hound Sleepers"
	set category = "Preferences"
	set desc = "Toggles Voracious MediHound Sleepers (DOES NOTHING - VORE REMOVAL REMNANT)"
	usr.client.prefs.cit_toggles ^= MEDIHOUND_SLEEPER
	usr.client.prefs.save_preferences()
	if(usr.client.prefs.cit_toggles & MEDIHOUND_SLEEPER)
		to_chat(usr, "You have opted in for voracious medihound sleepers.")
	else
		to_chat(usr, "Medihound sleepers will no longer be voracious when you're involved.")
	SSblackbox.record_feedback("nested tally", "preferences_verb", 1, list("Toggle MediHound Sleeper", "[usr.client.prefs.cit_toggles & MEDIHOUND_SLEEPER ? "Enabled" : "Disabled"]")) //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
/datum/verbs/menu/Settings/Sound/togglehoundsleeper/Get_checked(client/C)
	return C.prefs.cit_toggles & MEDIHOUND_SLEEPER
