//Trek Chems, used primarily by medibots. Only heals a specific damage type, but is very efficient.

///////////////////
///Brute Healing///
///////////////////
//Bicaridine
/datum/reagent/medicine/bicaridine
	name = "Bicaridine"
	description = "Restores bruising. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#fc2626"
	overdose_threshold = 30
	pH = 5

/datum/reagent/medicine/bicaridine/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-1*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/bicaridine/overdose_process(mob/living/M)
	M.adjustBruteLoss(4*REM, FALSE)
	..()
	. = 1

//megaBicaridine
/datum/reagent/medicine/megabicaridine
	name = "megaBicaridine"
	description = "Restores bruising. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#fc2626"
	overdose_threshold = 30
	pH = 5

/datum/reagent/medicine/megabicaridine/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-2.5*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/megabicaridine/overdose_process(mob/living/M)
	M.adjustBruteLoss(4*REM, FALSE)
	..()
	. = 1

//ultraBicaridine
/datum/reagent/medicine/ultrabicaridine
	name = "ultraBicaridine"
	description = "Restores bruising. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#fc2626"
	overdose_threshold = 30
	pH = 5

/datum/reagent/medicine/ultrabicaridine/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-4*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/ultrabicaridine/overdose_process(mob/living/M)
	M.adjustBruteLoss(4*REM, FALSE)
	..()
	. = 1

////////////////////
///Oxygen Healing///
////////////////////
//Dexalin
/datum/reagent/medicine/dexalin
	name = "Dexalin"
	description = "Restores oxygen loss. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#13d2f0"
	overdose_threshold = 30
	pH = 9.7

/datum/reagent/medicine/dexalin/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-1*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/dexalin/overdose_process(mob/living/M)
	M.adjustOxyLoss(4*REM, FALSE)
	..()
	. = 1

//megaDexalin
/datum/reagent/medicine/megadexalin
	name = "megaDexalin"
	description = "Restores oxygen loss. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#13d2f0"
	overdose_threshold = 30
	pH = 9.7

/datum/reagent/medicine/megadexalin/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-2*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/megadexalin/overdose_process(mob/living/M)
	M.adjustOxyLoss(4*REM, FALSE)
	..()
	. = 1

//ultraDexalin
/datum/reagent/medicine/ultradexalin
	name = "ultraDexalin"
	description = "Restores oxygen loss. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#13d2f0"
	overdose_threshold = 30
	pH = 9.7

/datum/reagent/medicine/ultradexalin/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-4*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/ultradexalin/overdose_process(mob/living/M)
	M.adjustOxyLoss(4*REM, FALSE)
	..()
	. = 1

//////////////////
///Burn Healing///
//////////////////
//Kelotane
/datum/reagent/medicine/kelotane
	name = "Kelotane"
	description = "Restores fire damage. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#ffc400"
	overdose_threshold = 30
	pH = 9

/datum/reagent/medicine/kelotane/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-1*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/kelotane/overdose_process(mob/living/M)
	M.adjustFireLoss(4*REM, FALSE)
	..()
	. = 1

//megaKelotane
/datum/reagent/medicine/megakelotane
	name = "megaKelotane"
	description = "Restores fire damage. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#ffc400"
	overdose_threshold = 30
	pH = 9

/datum/reagent/medicine/megakelotane/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-2.5*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/megakelotane/overdose_process(mob/living/M)
	M.adjustFireLoss(4*REM, FALSE)
	..()
	. = 1

//ultraKelotane
/datum/reagent/medicine/ultrakelotane
	name = "ultraKelotane"
	description = "Restores fire damage. Overdose causes it instead."
	reagent_state = LIQUID
	color = "#ffc400"
	overdose_threshold = 30
	pH = 9

/datum/reagent/medicine/ultrakelotane/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-4*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	..()
	. = 1

/datum/reagent/medicine/ultrakelotane/overdose_process(mob/living/M)
	M.adjustFireLoss(4*REM, FALSE)
	..()
	. = 1

///////////////////
///Toxin Healing///
///////////////////
//Antitoxin
/datum/reagent/medicine/antitoxin
	name = "Anti-Toxin"
	description = "Heals toxin damage and removes toxins in the bloodstream. Overdose causes toxin damage."
	reagent_state = LIQUID
	color = "#6aff00"
	overdose_threshold = 30
	taste_description = "a roll of gauze"
	pH = 10

/datum/reagent/medicine/antitoxin/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-1*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	for(var/datum/reagent/toxin/R in M.reagents.reagent_list)
		M.reagents.remove_reagent(R.type,1)
	..()
	. = 1

/datum/reagent/medicine/antitoxin/overdose_process(mob/living/M)
	M.adjustToxLoss(4*REM, FALSE) // End result is 2 toxin loss taken, because it heals 2 and then removes 4.
	..()
	. = 1

//megaAntitoxin
/datum/reagent/medicine/megaantitoxin
	name = "megaAnti-Toxin"
	description = "Heals toxin damage and removes toxins in the bloodstream. Overdose causes toxin damage."
	reagent_state = LIQUID
	color = "#6aff00"
	overdose_threshold = 30
	taste_description = "a roll of gauze"
	pH = 10

/datum/reagent/medicine/megaantitoxin/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-2.5*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	for(var/datum/reagent/toxin/R in M.reagents.reagent_list)
		M.reagents.remove_reagent(R.type,2)
	..()
	. = 1

/datum/reagent/medicine/megaantitoxin/overdose_process(mob/living/M)
	M.adjustToxLoss(4*REM, FALSE) // End result is 2 toxin loss taken, because it heals 2 and then removes 4.
	..()
	. = 1

//ultraAntitoxin
/datum/reagent/medicine/ultraantitoxin
	name = "ultraAnti-Toxin"
	description = "Heals toxin damage and removes toxins in the bloodstream. Overdose causes toxin damage."
	reagent_state = LIQUID
	color = "#6aff00"
	overdose_threshold = 30
	taste_description = "a roll of gauze"
	pH = 10

/datum/reagent/medicine/ultraantitoxin/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-4*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	for(var/datum/reagent/toxin/R in M.reagents.reagent_list)
		M.reagents.remove_reagent(R.type,4)
	..()
	. = 1

/datum/reagent/medicine/ultraantitoxin/overdose_process(mob/living/M)
	M.adjustToxLoss(4*REM, FALSE) // End result is 2 toxin loss taken, because it heals 2 and then removes 4.
	..()
	. = 1

/datum/reagent/medicine/inaprovaline
	name = "Inaprovaline"
	description = "Stabilizes the breathing of patients. Good for those in critical condition."
	reagent_state = LIQUID
	pH = 8.5
	color = "#5dc1f0"

/datum/reagent/medicine/inaprovaline/on_mob_life(mob/living/carbon/M)
	if(M.losebreath >= 5)
		M.losebreath -= 5
	..()

/////////////////
///All Healing///
/////////////////
//Tricordrazine
/datum/reagent/medicine/tricordrazine
	name = "Tricordrazine"
	description = "Has a high chance to heal all types of damage. Overdose instead causes it."
	reagent_state = LIQUID
	color = "#e650c0"
	overdose_threshold = 30
	taste_description = "grossness"

/datum/reagent/medicine/tricordrazine/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.5*REM, FALSE)
	M.adjustFireLoss(-0.5*REM, FALSE)
	M.adjustOxyLoss(-0.5*REM, FALSE)
	M.adjustToxLoss(-0.5*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	. = 1
	..()

/datum/reagent/medicine/tricordrazine/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REM, FALSE)
	M.adjustOxyLoss(2*REM, FALSE)
	M.adjustBruteLoss(2*REM, FALSE)
	M.adjustFireLoss(2*REM, FALSE)
	..()
	. = 1

//megaTricordrazine
/datum/reagent/medicine/megatricordrazine
	name = "megaTricordrazine"
	description = "Has a high chance to heal all types of damage. Overdose instead causes it."
	reagent_state = LIQUID
	color = "#e650c0"
	overdose_threshold = 30
	taste_description = "grossness"

/datum/reagent/medicine/megatricordrazine/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-1.75*REM, FALSE)
	M.adjustFireLoss(-1.75*REM, FALSE)
	M.adjustOxyLoss(-1.75*REM, FALSE)
	M.adjustToxLoss(-1.75*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	. = 1
	..()

/datum/reagent/medicine/megatricordrazine/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REM, FALSE)
	M.adjustOxyLoss(2*REM, FALSE)
	M.adjustBruteLoss(2*REM, FALSE)
	M.adjustFireLoss(2*REM, FALSE)
	..()
	. = 1

//ultraTricordrazine
/datum/reagent/medicine/ultratricordrazine
	name = "ultraTricordrazine"
	description = "Has a high chance to heal all types of damage. Overdose instead causes it."
	reagent_state = LIQUID
	color = "#e650c0"
	overdose_threshold = 30
	taste_description = "grossness"

/datum/reagent/medicine/ultratricordrazine/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-3*REM, FALSE)
	M.adjustFireLoss(-3*REM, FALSE)
	M.adjustOxyLoss(-3*REM, FALSE)
	M.adjustToxLoss(-3*REM, FALSE)
	M.jitteriness += 1
	M.nutrition -= 3
	. = 1
	..()

/datum/reagent/medicine/ultratricordrazine/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REM, FALSE)
	M.adjustOxyLoss(2*REM, FALSE)
	M.adjustBruteLoss(2*REM, FALSE)
	M.adjustFireLoss(2*REM, FALSE)
	..()
	. = 1

///////////////////
///Transitioning///
///////////////////
/datum/reagent/medicine/tchem
	name = "tChem"
	description = "A chemical that allows chemists to reach greater tiers."
	reagent_state = LIQUID
	color = "#064909"
	taste_description = "grossness"

/datum/reagent/medicine/tchem/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(0.5*REM, FALSE)
	M.adjustFireLoss(0.5*REM, FALSE)
	M.adjustOxyLoss(0.5*REM, FALSE)
	M.adjustToxLoss(0.5*REM, FALSE)
	M.jitteriness += 2
	M.nutrition += 5
	. = 1
	..()
