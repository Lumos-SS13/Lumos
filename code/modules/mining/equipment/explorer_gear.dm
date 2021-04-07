
// Explorer suit - Your basic mining suit //

/obj/item/clothing/suit/hooded/explorer
	name = "explorer suit"
	desc = "A standard issue armored exploration suit. Used primarily by light-equipment miners."
	ashwalker_desc = "Weak creatures need plentiful armor."
	icon_state = "explorer"
	item_state = "explorer"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	cold_protection = CHEST|GROIN|LEGS|ARMS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|ARMS
	hoodtype = /obj/item/clothing/head/hooded/explorer
	armor = list("melee" = 30, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 50, "wound" = 15)
	flags_inv = HIDEJUMPSUIT|HIDETAUR
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/resonator, /obj/item/mining_scanner, /obj/item/t_scanner/adv_mining_scanner, /obj/item/gun/energy/kinetic_accelerator, /obj/item/pickaxe)
	resistance_flags = FIRE_PROOF
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_SNEK_TAURIC|STYLE_PAW_TAURIC

/obj/item/clothing/head/hooded/explorer
	name = "explorer hood"
	desc = "The attached hood of the explorer suit. Integrated hardhat, but sadly no headlamp."
	icon_state = "explorer"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	cold_protection = HEAD
	max_heat_protection_temperature = FIRE_HELM_MAX_TEMP_PROTECT
	heat_protection = HEAD
	armor = list("melee" = 30, "bullet" = 20, "laser" = 20, "energy" = 20, "bomb" = 50, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 50, "wound" = 15)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/hooded/explorer/standard
	hoodtype = /obj/item/clothing/head/hooded/explorer/standard

/obj/item/clothing/suit/hooded/explorer/standard/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate, 3, /obj/item/stack/sheet/animalhide/goliath_hide, list("melee" = 10, "wound" = 3.5))

/obj/item/clothing/head/hooded/explorer/standard/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate, 3, /obj/item/stack/sheet/animalhide/goliath_hide, list("melee" = 10, "wound" = 3.5))

/obj/item/clothing/mask/gas/explorer
	name = "explorer gas mask"
	desc = "Standard issue gasmask for mining personnel. Provides modest facial trauma protection."
	ashwalker_desc = "Outsiders are sickly, needing to breath sweet winds to survive."
	icon_state = "gas_mining"
	visor_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	visor_flags_inv = HIDEFACIALHAIR
	visor_flags_cover = MASKCOVERSMOUTH
	actions_types = list(/datum/action/item_action/adjust)
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 5, "bio" = 50, "rad" = 0, "fire" = 20, "acid" = 40, "wound" = 5)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/mask/gas/explorer/attack_self(mob/user)
	adjustmask(user)

/obj/item/clothing/mask/gas/explorer/adjustmask(user)
	..()
	w_class = mask_adjusted ? WEIGHT_CLASS_NORMAL : WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/gas/explorer/folded/Initialize()
	. = ..()
	adjustmask()

// C.A.M.P. Suit - Civilian mining suit for prospective prospectors. //

/obj/item/clothing/suit/hooded/explorer/campsuit
	name = "C.A.M.P. Suit"
	desc = "The Civilian Assisting Mining Personnel Suit is designed to provide bare minimum life support and protection for non-qualified mining personnel."
	icon_state = "seva"
	item_state = "seva"
	w_class = WEIGHT_CLASS_BULKY
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	hoodtype = /obj/item/clothing/head/hooded/explorer/campsuit
	armor = list("melee" = 15, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 15, "bio" = 50, "rad" = 25, "fire" = 20, "acid" = 25, "wound" = 5) //skyrat edit
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/hooded/explorer/campsuit
	name = "C.A.M.P. Hood"
	desc = "A lightweight hood, giving minor physical protection and minimum life support."
	icon_state = "seva"
	item_state = "seva"
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 15, "bio" = 50, "rad" = 25, "fire" = 20, "acid" = 25, "wound" = 5) //skyrat edit
	resistance_flags = FIRE_PROOF

/obj/item/clothing/mask/gas/campsuit
	name = "C.A.M.P. Mask"
	desc = "A basic rubber gasmask faceplate, designed for use with the C.A.M.P. Suit."
	icon_state = "seva"
	item_state = "seva"
	resistance_flags = FIRE_PROOF

// P.A.L.U. Exoskeleton - For the construction miners to lug materials and resources around more //

/obj/item/clothing/suit/hooded/explorer/exo
	name = "P.A.L.U. Exoskeleton"
	desc = "A Personal Assisted Loading Unit. Meant for help with lugging heavy materials and equipment long distances."
	icon_state = "exo"
	item_state = "exo"
	slowdown = 1
	w_class = WEIGHT_CLASS_BULKY
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	hoodtype = /obj/item/clothing/head/hooded/explorer/exo
	armor = list("melee" = 15, "bullet" = 5, "laser" = 10, "energy" = 20, "bomb" = 50, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 15, "wound" = 15)
	resistance_flags = FIRE_PROOF | GOLIATH_WEAKNESS // Formerly GOLIATH_RESISTANCE, but this is more for non-combatifying mining

/obj/item/clothing/head/hooded/explorer/exo
	name = "P.A.L.U. Integrated Helmet"
	desc = "A heavy-duty helmet integrated into a P.A.L.U. to prevent head trauma of users."
	icon_state = "exo"
	item_state = "exo"
	armor = list("melee" = 55, "bullet" = 5, "laser" = 5, "energy" = 5, "bomb" = 40, "bio" = 25, "rad" = 10, "fire" = 0, "acid" = 0, "wound" = 13) //skyrat edit
	resistance_flags = FIRE_PROOF | GOLIATH_WEAKNESS

// H.E.A.P. Suit - For pure AoE miners. //

/obj/item/clothing/suit/hooded/heapsuit
	name = "H.E.A.P. Suit"
	desc = "Heavy Explosive Application Personnel Suit. A padded suit designed to protect mining personnel when using detonation charges."
	icon_state = "bombsuit"
	item_state = "bombsuit"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 2
	armor = list("melee" = 20, "bullet" = 0, "laser" = 20,"energy" = 10, "bomb" = 90, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 50, "wound" = 5)
	hoodtype = /obj/item/clothing/head/hooded/heapsuit
	flags_inv = HIDEJUMPSUIT|HIDETAUR
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	strip_delay = 70
	equip_delay_other = 70
	resistance_flags = NONE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_SNEK_TAURIC|STYLE_PAW_TAURIC

/obj/item/clothing/head/hooded/heapsuit
	name = "H.E.A.P. Helmet"
	desc = "The integrated helmet for a H.E.A.P. suit. Warranty void if exposed to a 'rapid increase in volume and release of energy in an extreme manner'."
	icon_state = "bombsuit"
	clothing_flags = THICKMATERIAL
	armor = list("melee" = 20, "bullet" = 0, "laser" = 20,"energy" = 10, "bomb" = 100, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 50, "wound" = 5)
	flags_inv = HIDEFACE|HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = NONE
	mutantrace_variation = STYLE_MUZZLE

// H.E.C.K. Suit - Dropped by bubblegum for *those* miners. //

/obj/item/clothing/suit/space/hostile_environment
	name = "H.E.C.K. suit"
	desc = "Hostile Environment Cross-Kinetic Suit: A suit designed to withstand the wide variety of hazards from Lavaland. It wasn't enough for its last owner."
	icon_state = "hostile_env"
	item_state = "hostile_env"
	clothing_flags = THICKMATERIAL //not spaceproof
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | LAVA_PROOF | ACID_PROOF | GOLIATH_RESISTANCE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_SNEK_TAURIC|STYLE_PAW_TAURIC
	slowdown = 0
	armor = list("melee" = 70, "bullet" = 40, "laser" = 10, "energy" = 10, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100, "wound" = 30) //skyrat edit
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/resonator, /obj/item/mining_scanner, /obj/item/t_scanner/adv_mining_scanner, /obj/item/gun/energy/kinetic_accelerator, /obj/item/pickaxe)

/obj/item/clothing/suit/space/hostile_environment/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/space/hostile_environment/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/clothing/suit/space/hostile_environment/process()
	var/mob/living/carbon/C = loc
	if(istype(C) && prob(2)) //cursed by bubblegum
		if(prob(15))
			new /datum/hallucination/oh_yeah(C)
			to_chat(C, "<span class='colossus'><b>[pick("I AM IMMORTAL.","I SHALL TAKE BACK WHAT'S MINE.","I SEE YOU.","YOU CANNOT ESCAPE ME FOREVER.","DEATH CANNOT HOLD ME.")]</b></span>")
		else
			to_chat(C, "<span class='warning'>[pick("You hear faint whispers.","You smell ash.","You feel hot.","You hear a roar in the distance.")]</span>")

/obj/item/clothing/head/helmet/space/hostile_environment
	name = "H.E.C.K. helmet"
	desc = "Hostile Environiment Cross-Kinetic Helmet: A helmet designed to withstand the wide variety of hazards from Lavaland. It wasn't enough for its last owner."
	icon_state = "hostile_env"
	item_state = "hostile_env"
	w_class = WEIGHT_CLASS_NORMAL
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	clothing_flags = THICKMATERIAL // no space protection
	armor = list("melee" = 70, "bullet" = 40, "laser" = 10, "energy" = 10, "bomb" = 50, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 100, "wound" = 30) //skyrat edit
	resistance_flags = FIRE_PROOF | LAVA_PROOF

/obj/item/clothing/head/helmet/space/hostile_environment/Initialize()
	. = ..()
	AddComponent(/datum/component/spraycan_paintable)
	update_icon()


/obj/item/clothing/head/helmet/space/hostile_environment/update_overlays()
	. = ..()
	var/mutable_appearance/glass_overlay = mutable_appearance(icon, "hostile_env_glass")
	glass_overlay.appearance_flags = RESET_COLOR
	. += glass_overlay

/obj/item/clothing/head/helmet/space/hostile_environment/worn_overlays(isinhands, icon_file, used_state, style_flags = NONE)
	. = ..()
	if(!isinhands)
		var/mutable_appearance/M = mutable_appearance('icons/mob/clothing/head.dmi', "hostile_env_glass")
		M.appearance_flags = RESET_COLOR
		. += M
