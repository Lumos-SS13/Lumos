/obj/item/seeds/pigtails
	name = "pack of pig-tail seeds"
	desc = "A pack of pig-tail seeds. A fiberous plant used to make primitive textiles."
	icon_state = "seed-pigtail"
	species = "pigtail"
	plantname = "Pigtail"
	icon_harvest = "pigtail-harvest"
	product = /obj/item/grown/cotton/pigtails
	lifespan = 35
	endurance = 25
	maturation = 15
	production = 1
	yield = 2
	potency = 50
	growthstages = 3
	growing_icon = 'icons/obj/hydroponics/growing.dmi'
	icon_dead = "pigtail-dead"
	mutatelist = null

/obj/item/seeds/pigtails
	name = "handful of pig-tail seeds"
	desc = "A couple of round pig-tail seeds. Found often in underground environments and can be spun into a primitive cloth."
	icon_state = "seed-pigtailwild"

/obj/item/grown/cotton/pigtails
	seed = /obj/item/seeds/pigtails
	name = "pig-tail bundle"
	desc = "Curly pig-tails, a fiberous plant. It needs to be processed before being turned into textile."
	icon_state = "pigtail"
	force = 1 // like a really crappy whip
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 2
	throw_range = 3
	attack_verb = list("whipped", "whacked", "pig-tailed")
	cotton_type = /obj/item/stack/sheet/cotton/pigtail
	cotton_name = "raw pigtail fiber"
