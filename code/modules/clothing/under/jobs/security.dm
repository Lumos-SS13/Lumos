/*
 * Contains:
 *		Security
 *		Detective
 *		Navy uniforms
 */

/*
 * Security
 */
/obj/item/clothing/under/rank/security
	strip_delay = 50
	alt_covers_chest = TRUE
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	//skyrat edit
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30, "wound" = 10)
	//

/obj/item/clothing/under/rank/security/officer
	name = "security jumpsuit"
	desc = "A tactical security jumpsuit for officers complete with Nanotrasen belt buckle."
	icon_state = "rsecurity"
	item_state = "r_suit"
	//armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)

/obj/item/clothing/under/rank/security/officer/grey
	name = "grey security jumpsuit"
	desc = "A tactical relic of years past before Nanotrasen decided it was cheaper to dye the suits red instead of washing out the blood."
	icon_state = "security"
	item_state = "gy_suit"

/obj/item/clothing/under/rank/security/officer/formal
	name = "security officer's formal uniform"
	desc = "The latest in fashionable security outfits."
	icon_state = "officerblueclothes"
	item_state = "officerblueclothes"
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/security/officer/blueshirt
	name = "blue shirt and tie"
	desc = "I'm a little busy right now, Calhoun."
	icon_state = "blueshift"
	item_state = "blueshift"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/officer/spacepol
	name = "police uniform"
	desc = "Space not controlled by megacorporations, planets, or pirates is under the jurisdiction of Spacepol."
	icon_state = "spacepol"
	item_state = "spacepol"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/officer/snowflake
	name = "special aesthetic security jumpsuit"
	desc = "A security jumpsuit designed with a special skytensive-polymerized-jogmesh(tm) for semi-maximum customization exactly once."
	icon_state = "rsecurity"
	item_state = "r_suit"
	can_adjust = FALSE
	unique_reskin_icons = list(
	"Default" = 'icons/obj/clothing/uniforms.dmi',
	"Tactical" = 'modular_skyrat/icons/obj/clothing/uniform.dmi',
	"Sol Federation" = 'modular_skyrat/icons/obj/clothing/uniform.dmi',
	"HECU" = 'modular_skyrat/icons/obj/clothing/uniform.dmi',
	"Firestarter" = 'modular_skyrat/icons/obj/clothing/uniform.dmi',
	"Gorka" = 'modular_skyrat/icons/obj/clothing/uniform.dmi',
	"Bushfighter" = 'modular_skyrat/icons/obj/clothing/uniform.dmi',
	)
	unique_reskin_worn = list(
	"Default" = 'icons/mob/clothing/uniform.dmi',
	"Tactical" = 'modular_skyrat/icons/mob/clothing/uniform.dmi',
	"Sol Federation" = 'modular_skyrat/icons/mob/clothing/uniform.dmi',
	"HECU" = 'modular_skyrat/icons/mob/clothing/uniform.dmi',
	"Firestarter" = 'modular_skyrat/icons/mob/clothing/uniform.dmi',
	"Gorka" = 'modular_skyrat/icons/mob/clothing/uniform.dmi',
	"Bushfighter" = 'modular_skyrat/icons/mob/clothing/uniform.dmi',
	)
	unique_reskin_worn_anthro = list(
	"Default" = 'icons/mob/clothing/uniform_digi.dmi',
	"Tactical" = 'modular_skyrat/icons/mob/clothing/uniform_digi.dmi',
	"Sol Federation" = 'modular_skyrat/icons/mob/clothing/uniform_digi.dmi',
	"HECU" = 'modular_skyrat/icons/mob/clothing/uniform_digi.dmi',
	"Firestarter" = 'modular_skyrat/icons/mob/clothing/uniform_digi.dmi',
	"Gorka" = 'modular_skyrat/icons/mob/clothing/uniform_digi.dmi',
	"Bushfighter" = 'modular_skyrat/icons/mob/clothing/uniform_digi.dmi',
	)
	unique_reskin = list(
	"Default" = "rsecurity",
	"Tactical" = "tactical_uniform",
	"Sol Federation" = "solfed_uniform",
	"HECU" = "hecu_uniform",
	"Firestarter" = "firestarter_uniform",
	"Gorka" = "gorka_uniform",
	"Bushfighter" = "rhodebrush",
	)
	unique_desc = list(
	"Default" = "A good classic - tactical red jumpsuit for officers complete with Nanotrasen belt buckle.",
	"Tactical" = "A tactical black jumpsuit with Nanotrasen's security armband.",
	"Sol Federation" = "A tactical light-blue jumpsuit complete with kneepads and an insignia of Sol Federation.",
	"HECU" = "A snow-camofluaged t-shirt and pants, perfect fit for hunting down the free man.",
	"Firestarter" = "A tactical jumpsuit with some rusty colors.",
	"Gorka" = "A militaristic jumpsuit coming from Russian colonies, perfect for windy mountains and space alike.",
	"Bushfighter" = "A button-up shirt and cargo shorts in a very peculiar brush pattern, best worn with boots and webbing. What a time it was.",
	)

/*
 * Warden
 */

/obj/item/clothing/under/rank/security/warden
	name = "security suit"
	desc = "A formal security suit for officers complete with Nanotrasen belt buckle."
	icon_state = "rwarden"
	item_state = "r_suit"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)

/obj/item/clothing/under/rank/security/warden/grey
	name = "grey security suit"
	desc = "A formal relic of years past before Nanotrasen decided it was cheaper to dye the suits red instead of washing out the blood."
	icon_state = "warden"
	item_state = "gy_suit"

/obj/item/clothing/under/rank/security/warden/formal
	desc = "The insignia on this uniform tells you that this uniform belongs to the Warden."
	name = "warden's formal uniform"
	icon_state = "wardenblueclothes"
	item_state = "wardenblueclothes"
	alt_covers_chest = TRUE

/*
 * Detective
 */

/obj/item/clothing/under/rank/security/detective
	name = "hard-worn suit"
	desc = "Someone who wears this means business."
	icon_state = "detective"
	item_state = "det"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)

/obj/item/clothing/under/rank/security/detective/skirt
	name = "detective's suitskirt"
	desc = "Someone who wears this means business."
	icon_state = "detective_skirt"
	item_state = "det"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/rank/security/detective/grey
	name = "noir suit"
	desc = "A hard-boiled private investigator's grey suit, complete with tie clip."
	icon_state = "greydet"
	item_state = "greydet"

/obj/item/clothing/under/rank/security/detective/grey/skirt
	name = "noir suitskirt"
	desc = "A hard-boiled private investigator's grey suitskirt, complete with tie clip."
	icon_state = "greydet_skirt"
	item_state = "greydet"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/*
 * Head of Security
 */

/obj/item/clothing/under/rank/security/head_of_security
	name = "head of security's jumpsuit"
	desc = "A security jumpsuit decorated for those few with the dedication to achieve the position of Head of Security."
	icon_state = "rhos"
	item_state = "r_suit"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 15) //skyrat edit
	strip_delay = 60

/obj/item/clothing/under/rank/security/head_of_security/grey
	name = "head of security's grey jumpsuit"
	desc = "There are old men, and there are bold men, but there are very few old, bold men."
	icon_state = "hos"
	item_state = "gy_suit"

/obj/item/clothing/under/rank/security/head_of_security/alt
	name = "head of security's turtleneck"
	desc = "A stylish alternative to the normal head of security jumpsuit, complete with tactical pants."
	icon_state = "hosalt"
	item_state = "bl_suit"

/obj/item/clothing/under/rank/security/head_of_security/alt/skirt
	name = "head of security's turtleneck skirt"
	desc = "A stylish alternative to the normal head of security jumpsuit, complete with a tactical skirt."
	icon_state = "hosalt_skirt"
	item_state = "bl_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/rank/security/head_of_security/formal
	desc = "The insignia on this uniform tells you that this uniform belongs to the Head of Security."
	name = "head of security's formal uniform"
	icon_state = "hosblueclothes"
	item_state = "hosblueclothes"

/obj/item/clothing/under/rank/security/head_of_security/parade
	name = "head of security's parade uniform"
	desc = "A male head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_male"
	item_state = "r_suit"
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/head_of_security/parade/female
	name = "head of security's parade uniform"
	desc = "A female head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_fem"
	item_state = "r_suit"
	fitted = FEMALE_UNIFORM_TOP
