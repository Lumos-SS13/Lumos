// Welcome to the ultra-cool seating file, only cool and sexy people are allowed to look at this dm
/obj/structure/chair/throne
	name = "throne"
	desc = "A golden throne fit for a king. These violent delights have violent ends..."
	can_buckle = 0
	buildstackamount = 1
	icon_state = "kingthronelumos"
	icon = 'modular_lumos/icons/obj/structures/seaties.dmi'
	buildstacktype = /obj/item/stack/sheet/mineral/gold
	buildstackamount = 10
	max_integrity = 350

/obj/structure/chair/bench
	name = "wooden bench"
	desc = "A wooden bench, for sitting."
	icon = 'modular_lumos/icons/obj/structures/seaties.dmi'
	icon_state = "benchmiddle"
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 2
	item_chair = null
	resistance_flags = FLAMMABLE
	max_integrity = 50

/obj/structure/chair/bench/left
	name = "wooden bench end"
	icon_state = "bench_left"

obj/structure/chair/bench/right
	name = "wooden bench end"
	icon_state = "bench_right"
