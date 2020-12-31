/*
* More Baycode mobs, repurposed for later projects, credit to the dmis and some of the original dm elements go to them
* Mostly these are either basic run-attack, but some will be modified later.
* toe jam on toast
*/
/mob/living/simple_animal/hostile/retaliate/samak // The Pokemon boi, intended to later be a peaceful-ish monster, don't get too close!
	name = "samak"
	desc = "A fast, armoured predator accustomed to hiding and ambushing in cold terrain."
	icon = 'modular_lumos/icons/mob/simplemobs/retaliate/littlebois.dmi'
	icon_state = "samak"
	icon_living = "samak"
	icon_dead = "samak_dead"
	move_to_delay = 2
	maxHealth = 125
	health = 125
	speed = 2
	attack_verb_continuous = "scratches"
	attack_verb_simple = "scratch"
	attack_sound = 'sound/weapons/bite.ogg'
	melee_damage_lower = 5
	melee_damage_upper = 15
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 3)
	speak_chance = 5
	see_in_dark = 6
	speak = list("Hruuugh!","Hrunnph")
	emote_see = list("paws the ground","shakes its head","stomps")
	emote_hear = list("snuffles")
	faction = ("mining")
	environment_smash = ENVIRONMENT_SMASH_NONE
	stop_automated_movement_when_pulled = 1
	loot = list(/obj/effect/decal/cleanable/blood)

/mob/living/simple_animal/hostile/retaliate/samak/mcchonks // Dedicated HoS pet, cause gaming.
	name = "Officer McChonks"
	desc = "Head of Security's faithful Samak. He's got a mean glint in his eye and a strong sense of Justice."
	icon_state = "samak_HoS"
	icon_living = "samak_HoS"
	icon_dead = "samak_dead"
	faction = list("dog")
	loot = list(/obj/effect/decal/cleanable/blood, /obj/item/clothing/head/HoS/beret = 1)

/mob/living/simple_animal/hostile/retaliate/simbu // The fluff-beast! Later intended to be used in insulation and duraweave collection!
	name = "simbu"
	desc = "A small fluffy animal. They grow a thick lining of wool around their small bodies."
	icon = 'modular_lumos/icons/mob/simplemobs/retaliate/littlebois.dmi'
	icon_state = "diyaab"
	icon_living = "diyaab"
	icon_dead = "diyaab_dead"
	move_to_delay = 1
	maxHealth = 25
	health = 25
	speed = 1
	melee_damage_lower = 1
	melee_damage_upper = 8
	attack_verb_continuous = "scratches"
	attack_verb_simple = "scratch"
	attack_sound = 'sound/weapons/bite.ogg'
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 1, /obj/item/stack/sheet/animalhide = 1)
	speak_chance = 5
	see_in_dark = 6
	speak = list("Awrr?","Aowrl!","Worrl")
	emote_see = list("sniffs the air cautiously","looks around")
	emote_hear = list("snuffles")
	faction = ("mining")
	stop_automated_movement_when_pulled = 1
	loot = list(/obj/effect/decal/cleanable/blood)

/mob/living/simple_animal/hostile/retaliate/brahthani // The strange dog-pig! Later intended to be a tamable mining pet!
	name = "brahthani"
	desc = "A stocky creature somewhat reminiscent of a wild boar. Its mane appears to be mildly iridescent."
	icon = 'modular_lumos/icons/mob/simplemobs/retaliate/littlebois.dmi'
	icon_state = "shantak"
	icon_living = "shantak"
	icon_dead = "shantak_dead"
	move_to_delay = 1
	maxHealth = 75
	health = 75
	speed = 1
	melee_damage_lower = 3
	melee_damage_upper = 12
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 2, /obj/item/stack/sheet/animalhide = 3)
	speak_chance = 2
	see_in_dark = 6
	speak = list("Shuhn","Shrunnph?","Shunpf")
	emote_see = list("scratches the ground","shakes out it's mane","tinkles gently")
	faction = ("mining")
	stop_automated_movement_when_pulled = 1
	loot = list(/obj/effect/decal/cleanable/blood)

/mob/living/simple_animal/hostile/thinbug // WILL be repurposed later, intended to spit corrosive acid!
	name = "taki"
	desc = "It looks like a bunch of legs."
	icon = 'modular_lumos/icons/mob/simplemobs/retaliate/littlebois.dmi'
	icon_state = "thinbug"
	icon_living = "thinbug"
	icon_dead = "thinbug_dead"
	speak_chance = 1
	emote_hear = list("scratches the ground","chitters")
	faction = ("mining")


/mob/living/simple_animal/friendly/yithian // A cute boy, later on will be a very collectable pet, or a source of gubbock-like milk!
	name = "yithian"
	desc = "A friendly creature vaguely resembling an oversized snail without a shell."
	icon_state = "yithian"
	icon_living = "yithian"
	icon_dead = "yithian_dead"
	faction = ("mining")

/mob/living/simple_animal/friendly/tindalos // A scavenger, later going to be used as vermin that eat plants!
	name = "tindalos"
	desc = "It looks like a large, flightless grasshopper."
	icon_state = "tindalos"
	icon_living = "tindalos"
	icon_dead = "tindalos_dead"
	faction = ("mining")
	stop_automated_movement_when_pulled = 1
	loot = list(/obj/effect/decal/cleanable/blood/xeno)
