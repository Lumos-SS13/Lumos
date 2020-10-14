//Bicaridine
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

//Kelotane
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

//Anti-Toxin
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

//Tricordrazine
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

//tChem
/datum/chemical_reaction/tchem
	name = "tChem"
	id = /datum/reagent/medicine/tchem
	results = list(/datum/reagent/medicine/tchem = 3)
	required_reagents = list(/datum/reagent/toxin/plasma = 1, /datum/reagent/toxin/formaldehyde = 1, /datum/reagent/toxin/mutagen = 1)
	required_temp = 500

//Dexalin
/datum/chemical_reaction/dexalin
	name = "Dexalin"
	id = /datum/reagent/medicine/dexalin
	results = list(/datum/reagent/medicine/dexalin = 3)
	required_reagents = list(/datum/reagent/water = 1, /datum/reagent/oxygen = 1, /datum/reagent/iron = 1)

/datum/chemical_reaction/megadexalin
	name = "megaDexalin"
	id = /datum/reagent/medicine/megadexalin
	results = list(/datum/reagent/medicine/megadexalin = 3)
	required_reagents = list(/datum/reagent/medicine/tricordrazine = 1, /datum/reagent/blood = 1, /datum/reagent/stable_plasma = 1)
	required_temp = 400

/datum/chemical_reaction/ultradexalin
	name = "ultraDexalin"
	id = /datum/reagent/medicine/ultradexalin
	results = list(/datum/reagent/medicine/ultradexalin = 3)
	required_reagents = list(/datum/reagent/medicine/megadexalin = 1, /datum/reagent/medicine/tchem = 1, /datum/reagent/water = 1)
	required_temp = 600
