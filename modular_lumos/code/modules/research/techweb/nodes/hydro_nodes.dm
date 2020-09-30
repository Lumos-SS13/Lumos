/datum/techweb_node/scythe_node_base
	id = "scythe_node"
	display_name = "Base Scythe"
	description = "The base scythe used to cull kudzu."
	prereq_ids = list("base")
	design_ids = list("base_scythe")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500)

/datum/techweb_node/scythe_node_super
	id = "scythe_node_super"
	display_name = "Super Scythe"
	description = "The super scythe used to cull kudzu."
	prereq_ids = list("scythe_node")
	design_ids = list("super_scythe")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500)

/datum/techweb_node/scythe_node_ultra
	id = "scythe_node_ultra"
	display_name = "Ultra Scythe"
	description = "The ultra scythe used to cull kudzu."
	prereq_ids = list("scythe_node_super")
	design_ids = list("ultra_scythe")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1500)
