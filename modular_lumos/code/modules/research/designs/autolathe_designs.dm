/datum/design/floor_painter
	name = "Floor Painter"
	id = "floor_painter"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 300, /datum/material/glass = 100)
	build_path = /obj/item/airlock_painter/floor_painter
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/fish_brush
	name = "Fish Tank Brush"
	id = "fish_brush"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 300)
	build_path = /obj/item/fish_tool/brush
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/fish_clipper
	name = "Fish Tank Clipper"
	id = "fish_clipper"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 300)
	build_path = /obj/item/fish_tool/clippers
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/fish_analyzer
	name = "Fish Analyzer"
	id = "fish_analyzer"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 300)
	build_path = /obj/item/fish_tool/analyzer
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/fish_egg_killer
	name = "Fish Egg Killer"
	id = "fish_egg_killer"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 300)
	build_path = /obj/item/fish_tool/egg_killer
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/fish_rod_adv
	name = "Advanced Fishing Rod"
	id = "fish_rod_adv"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600)
	build_path = /obj/item/fish_tool/fishing_rod/advanced
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/pitcher
	name = "glass pitcher"
	id = "pitcher_glass"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass=1000)
	build_path = /obj/item/reagent_containers/glass/pitcher
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
