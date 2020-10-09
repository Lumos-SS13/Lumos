/datum/chemical_reaction/megabicaridine
	name = "megaBicaridine"
	id = /datum/reagent/medicine/megabicaridine
	results = list(/datum/reagent/medicine/megabicaridine = 3)
	required_reagents = list(/datum/reagent/medicine/bicaridine = 1, /datum/reagent/blood = 1, /datum/reagent/stable_plasma = 1)
	required_temp = 400

/datum/chemical_reaction/ultrabicaridine
	name = "ultraBicaridine"
	id = /datum/reagent/medicine/ultrabicaridine
	results = list(/datum/reagent/medicine/ultrabicaridine = 3)
	required_reagents = list(/datum/reagent/medicine/megabicaridine = 1, /datum/reagent/medicine/tchem = 1, /datum/reagent/water = 1)
	required_temp = 600

/datum/chemical_reaction/failed/ultrabicaridine
	name = "ultraBicaridine explosion"
	id = "ubicardboom"
	required_temp = 602 //slightly above the meth mix time.
	required_reagents = list(/datum/reagent/medicine/ultrabicaridine = 1)

/datum/chemical_reaction/failed/ultrabicaridine/on_reaction(datum/reagents/holder, multiplier)
	var/turf/T = get_turf(holder.my_atom)
	holder.clear_reagents()
	for(var/i in 1 to 5)
		for(var/turf/turf in range(1,T))
			new /obj/effect/hotspot(turf)
		sleep(5)

/datum/chemical_reaction/megakelotane
	name = "megaKelotane"
	id = /datum/reagent/medicine/megakelotane
	results = list(/datum/reagent/medicine/megakelotane = 3)
	required_reagents = list(/datum/reagent/medicine/kelotane = 1, /datum/reagent/blood = 1, /datum/reagent/stable_plasma = 1)
	required_temp = 400

/datum/chemical_reaction/ultrakelotane
	name = "ultraKelotane"
	id = /datum/reagent/medicine/ultrakelotane
	results = list(/datum/reagent/medicine/ultrakelotane = 3)
	required_reagents = list(/datum/reagent/medicine/megakelotane = 1, /datum/reagent/medicine/tchem = 1, /datum/reagent/water = 1)
	required_temp = 600

/datum/chemical_reaction/failed/ultrakelotane
	name = "ultraKelotane explosion"
	id = "ukeloboom"
	required_temp = 602 //slightly above the meth mix time.
	required_reagents = list(/datum/reagent/medicine/ultrakelotane = 1)

/datum/chemical_reaction/failed/ultrakelotane/on_reaction(datum/reagents/holder, multiplier)
	var/turf/T = get_turf(holder.my_atom)
	holder.clear_reagents()
	for(var/i in 1 to 5)
		for(var/turf/turf in range(1,T))
			new /obj/effect/hotspot(turf)
		sleep(5)

/datum/chemical_reaction/megaantitoxin
	name = "megaAnti-Toxin"
	id = /datum/reagent/medicine/megaantitoxin
	results = list(/datum/reagent/medicine/megaantitoxin = 3)
	required_reagents = list(/datum/reagent/medicine/antitoxin = 1, /datum/reagent/blood = 1, /datum/reagent/stable_plasma = 1)
	required_temp = 400

/datum/chemical_reaction/ultraantitoxin
	name = "ultraAnti-Toxin"
	id = /datum/reagent/medicine/ultraantitoxin
	results = list(/datum/reagent/medicine/ultraantitoxin = 3)
	required_reagents = list(/datum/reagent/medicine/megaantitoxin = 1, /datum/reagent/medicine/tchem = 1, /datum/reagent/water = 1)
	required_temp = 600

/datum/chemical_reaction/failed/ultraantitoxin
	name = "ultraAnti-Toxin explosion"
	id = "utoxboom"
	required_temp = 602 //slightly above the meth mix time.
	required_reagents = list(/datum/reagent/medicine/ultraantitoxin = 1)

/datum/chemical_reaction/failed/ultraantitoxin/on_reaction(datum/reagents/holder, multiplier)
	var/turf/T = get_turf(holder.my_atom)
	holder.clear_reagents()
	for(var/i in 1 to 5)
		for(var/turf/turf in range(1,T))
			new /obj/effect/hotspot(turf)
		sleep(5)

/datum/chemical_reaction/megatricordrazine
	name = "megaTricordrazine"
	id = /datum/reagent/medicine/megatricordrazine
	results = list(/datum/reagent/medicine/megatricordrazine = 3)
	required_reagents = list(/datum/reagent/medicine/tricordrazine = 1, /datum/reagent/blood = 1, /datum/reagent/stable_plasma = 1)
	required_temp = 400

/datum/chemical_reaction/ultratricordrazine
	name = "ultraTricordrazine"
	id = /datum/reagent/medicine/ultratricordrazine
	results = list(/datum/reagent/medicine/ultratricordrazine = 3)
	required_reagents = list(/datum/reagent/medicine/megatricordrazine = 1, /datum/reagent/medicine/tchem = 1, /datum/reagent/water = 1)
	required_temp = 600

/datum/chemical_reaction/failed/ultratricordrazine
	name = "ultraTricordrazine explosion"
	id = "utriboom"
	required_temp = 602 //slightly above the meth mix time.
	required_reagents = list(/datum/reagent/medicine/ultratricordrazine = 1)

/datum/chemical_reaction/failed/ultratricordrazine/on_reaction(datum/reagents/holder, multiplier)
	var/turf/T = get_turf(holder.my_atom)
	holder.clear_reagents()
	for(var/i in 1 to 5)
		for(var/turf/turf in range(1,T))
			new /obj/effect/hotspot(turf)
		sleep(5)

/datum/chemical_reaction/tchem
	name = "tChem"
	id = /datum/reagent/medicine/tchem
	results = list(/datum/reagent/medicine/tchem = 3)
	required_reagents = list(/datum/reagent/toxin/plasma = 1, /datum/reagent/toxin/formaldehyde = 1, /datum/reagent/toxin/mutagen = 1)
	required_temp = 500
