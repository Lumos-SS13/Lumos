/obj/item/seeds/pigtails
	name = "pack of pig-tail seeds"
	desc = "A pack of pig-tail seeds. A fiberous plant used to make primitive textiles."
	icon_state = "seed-pigtail"
	species = "pigtail"
	plantname = "Pigtail"
	icon_harvest = "pigtail-harvest"
	product = /obj/item/grown/cotton
	lifespan = 35
	endurance = 25
	maturation = 15
	production = 1
	yield = 2
	potency = 50
	growthstages = 3
	growing_icon = 'icons/obj/hydroponics/growing.dmi'
	icon_dead = "pigtail-dead"
	mutatelist = list(/obj/item/seeds/cotton/durathread)

/obj/item/seeds/pigtails
	name = "handful of pig-tail seeds"
	desc = "A couple of round pig-tail seeds. Found often in underground environments and can be spun into a primitive cloth."
	icon_state = "seed-pigtailwild"

/obj/item/grown/cotton/pigtails
	seed = /obj/item/seeds/cotton
	name = "pig-tail bundle"
	desc = "A bundle of curly pig-tails, a fiberous plant."
	icon_state = "pigtail"
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 2
	throw_range = 3
	attack_verb = list("whipped", "whacked", "pig-tailed")
