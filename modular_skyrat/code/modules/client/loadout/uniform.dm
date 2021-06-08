/datum/gear/polyunder
	name = "Polychromic Under"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/suit/polychromic
	cost = 2

/datum/gear/polyfemtank
	name = "Polychromic Feminine Tanktop"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/misc/poly_tanktop/female
	cost = 2

/datum/gear/skirtleneck
	name = "Sensible Suitskirt"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/rank/civilian/curator/skirt

/datum/gear/trekcmdtos
	name = "EntCorp uniform, cmd"
	restricted_roles = CMD_ROLES

/datum/gear/trekmedscitos
	name = "EntCorp uniform, medsci"
	restricted_roles = MEDSCI_ROLES

/datum/gear/trekengtos
	name = "EntCorp uniform, ops"
	restricted_roles = OPRS_ROLES

/datum/gear/trekfedutil
	name = "Fed uniform, classic"
	restricted_roles = NOCIV_ROLES // Accomodates for modular and forgotten roles.

/datum/gear/capt_alternative
	name = "Captains Naval Alternative"
	category = SLOT_W_UNIFORM
	path = /obj/item/clothing/under/suit/captain_blacksuit
	restricted_roles = list("Captain", "Head of Personnel")
