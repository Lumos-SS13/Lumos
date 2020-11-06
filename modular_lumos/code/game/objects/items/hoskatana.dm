/obj/item/hoskatana
	name = "ZR-0 Type 15 Katana"
	desc = "A 'katana' if you can call it that anymore.  With a grip that feels nice in your hand.  The blade is pulsing with energy.  Just wielding this makes you feel like a dragon."
	icon = 'modular_lumos/icons/obj/items_and_weapons.dmi'
	icon_state = "hoskatana"
	item_state = "katana"
	lefthand_file = 'modular_lumos/icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'modular_lumos/icons/mob/inhands/equipment/security_righthand.dmi'
	flags_1 = CONDUCT_1
	force = 18
	throwforce = 10
	w_class = WEIGHT_CLASS_BULKY
	hitsound = 'sound/weapons/blade1.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	armour_penetration = 50
	sharpness = SHARP_EDGED
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	item_flags = NEEDS_PERMIT | ITEM_CAN_PARRY
	total_mass = TOTAL_MASS_MEDIEVAL_WEAPON
	obj_flags = UNIQUE_RENAME
	block_parry_data = /datum/block_parry_data/energy_sword

//using energy sword parry data since its the most average and hassle free way of allowing a weapon thats very similar to parry
/datum/block_parry_data/energy_sword
	parry_time_windup = 0
	parry_time_active = 25
	parry_time_spindown = 0
	parry_time_windup_visual_override = 1
	parry_time_active_visual_override = 3
	parry_time_spindown_visual_override = 12
	parry_flags = PARRY_DEFAULT_HANDLE_FEEDBACK		
	parry_time_perfect = 2.5
	parry_time_perfect_leeway = 1.5
	parry_imperfect_falloff_percent = 5
	parry_efficiency_to_counterattack = 100
	parry_efficiency_considered_successful = 65		
	parry_efficiency_perfect = 100
	parry_failed_stagger_duration = 4 SECONDS
	parry_cooldown = 0.5 SECONDS

/obj/item/hoskatana/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 30, 95, 5) 
	AddElement(/datum/element/sword_point)

/obj/item/hoskatana/on_exit_storage(datum/component/storage/S)
	var/obj/item/storage/belt/hoskatana/B = S.parent
	if(istype(B))
		playsound(B, 'sound/items/unsheath.ogg', 25, 1)
	..()

/obj/item/hoskatana/on_enter_storage(datum/component/storage/S)
	var/obj/item/storage/belt/hoskatana/B = S.parent
	if(istype(B))
		playsound(B, 'sound/items/sheath.ogg', 25, 1)
	..()

/obj/item/hoskatana/get_belt_overlay()
	return mutable_appearance('modular_lumos/icons/obj/clothing/belt_overlays.dmi', "hilt")

/obj/item/hoskatana/get_worn_belt_overlay()
	return mutable_appearance('modular_lumos/icons/obj/clothing/belt_overlays.dmi', "-hilt")
