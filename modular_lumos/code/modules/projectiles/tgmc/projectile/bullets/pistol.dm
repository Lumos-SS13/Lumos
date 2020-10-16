/*
//================================================
					Pistol Ammo
//================================================
*/
/obj/item/projectile/bullet/c22lr
	name = ".22 LR bullet"
	damage = 15
	wound_bonus = -15

/obj/item/projectile/bullet/c380
	name = ".380 ACP bullet"
	damage = 20
	wound_bonus = -10

/obj/item/projectile/bullet/c22lr_tranq
	name = ".22 LR tranquilizer dart"
	nodamage = TRUE
	wound_bonus = CANT_WOUND

/obj/item/projectile/bullet/c22lr_tranq/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.blur_eyes(6)
		if(L.getStaminaLoss() >= 60)
			L.Sleeping(300)
		else
			L.adjustStaminaLoss(25)

/obj/item/projectile/bullet/c9mm_tranq
	name = "9mm tranquilizer dart"
	nodamage = TRUE
	wound_bonus = CANT_WOUND

/obj/item/projectile/bullet/c9mm_tranq/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.blur_eyes(6)
		if(L.getStaminaLoss() >= 60)
			L.Sleeping(300)
		else
			L.adjustStaminaLoss(25)

/obj/item/projectile/bullet/c9mm_hp
	name = "9mm hollow-point bullet"
	damage = 25
	armour_penetration = -10
	wound_bonus = 20
