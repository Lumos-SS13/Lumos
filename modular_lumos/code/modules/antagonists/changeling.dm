/datum/antagonist/changeling/roundend_report()
	var/list/parts = list()

	var/changelingwin = 1
	if(!owner.current)
		changelingwin = 0

	parts += printplayer(owner)

	//Removed sanity if(changeling) because we -want- a runtime to inform us that the changelings list is incorrect and needs to be fixed.
	parts += "<b>Changeling ID:</b> [changelingID]."
	parts += "<b>Genomes Extracted:</b> [absorbedcount]"
	parts += " "
	if(objectives.len)
		var/count = 1
		for(var/datum/objective/objective in objectives)
			if(objective.completable)
				var/completion = objective.check_completion()
				if(completion >= 1)
					parts += "<B>Objective #[count]</B>: [objective.explanation_text] <span class='greentext'><B>Success!</B></span>"
				else if(completion <= 0)
					parts += "<B>Objective #[count]</B>: [objective.explanation_text] <span class='redtext'>Fail.</span>"
					changelingwin = FALSE
				else
					parts += "<B>Objective #[count]</B>: [objective.explanation_text] <span class='yellowtext'>[completion*100]%</span>"
			else
				parts += "<B>Objective #[count]</B>: [objective.explanation_text]"
			count++

	if(changelingwin)
		parts += "<span class='greentext'>The changeling was successful!</span>"
	else
		parts += "<span class='redtext'>The changeling has failed.</span>"

	return parts.Join("<br>")
