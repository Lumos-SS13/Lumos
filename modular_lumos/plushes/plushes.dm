//highly potent shitcode below this point

/obj/item/toy/lumosplush
	name = "oh god oh fuck"
	desc = "you shouldn't be seeing this!"
	icon = 'modular_lumos/plushes/plushes.dmi'
	icon_state = "error"
	var/plushtype = /obj/item/toy/lumosplush
	var/pillowtype = /obj/structure/bed/roller/bodypillow
	var/list/itemsounds = list('sound/items/toysqueak1.ogg'=1, 'sound/items/toysqueak2.ogg'=1, 'sound/items/toysqueak3.ogg'=1)

/obj/item/toy/lumosplush/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, itemsounds)

/obj/item/toy/lumosplush/attack_self(mob/user)
	. = ..()
	to_chat(user, "<span class='notice'>You pet [src]. D'awww.</span>")

/obj/item/toy/lumosplush/examine(mob/user)
	. = ..()
	. += "<span class='notice'><b>Alt-Click</b> to deploy the bodypillow.</span>"

/obj/item/toy/lumosplush/AltClick(mob/user)
	. = ..()
	if(istype(user) && user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		deploy_pillow(user, user.loc)

/obj/item/toy/lumosplush/proc/deploy_pillow(mob/user, atom/location)
	var/obj/structure/bed/roller/bodypillow/R = new pillowtype(location)
	user.visible_message("<span class='notice'>[user] deploys \the [R].</span>", "<span class='notice'>You deploy \the [R].</span>")
	R.add_fingerprint(user)
	qdel(src)


// yes this is a roller bed B)
/obj/structure/bed/roller/bodypillow
	name = "oh god oh fuck"
	desc = "you shouldn't be seeing this!"
	icon = 'modular_lumos/plushes/plushes.dmi'
	icon_state = "error"
	foldabletype = /obj/item/toy/lumosplush
	bolts = FALSE


/obj/structure/bed/roller/bodypillow/Moved()
	if(has_gravity())
		playsound(src, 'sound/weapons/thudswoosh.ogg', 100, 1)

/obj/structure/bed/roller/bodypillow/examine(mob/user)
	. = ..()
	. += "<span class='notice'><b>Click and drag the sprite onto you</b> to collapse the bodypillow.</span>"

/obj/structure/bed/roller/bodypillow/post_buckle_mob(mob/living/M)
	density = TRUE
	M.pixel_y = initial(M.pixel_y)

/obj/structure/bed/roller/bodypillow/post_unbuckle_mob(mob/living/M)
	density = FALSE
	M.pixel_x = M.get_standard_pixel_x_offset(M.lying)
	M.pixel_y = M.get_standard_pixel_y_offset(M.lying)

// plushies below
// duke
/obj/item/toy/lumosplush/duke
	name = "shitcoder"
	desc = "its ya boy"
	icon_state = "duke-plush"
	plushtype = /obj/item/toy/lumosplush/duke
	pillowtype = /obj/structure/bed/roller/bodypillow/duke
	itemsounds = list('sound/machines/terminal_button01.ogg' = 7, 'sound/machines/buzz-two.ogg' = 2, 'sound/effects/adminhelp.ogg' = 1)

/obj/structure/bed/roller/bodypillow/duke
	name = "shitcoder"
	desc = "its ya boy"
	icon_state = "duke"
	foldabletype = /obj/item/toy/lumosplush/duke

/datum/crafting_recipe/lumosplush/duke
	name = "duke plushie"
	result = /obj/item/toy/lumosplush/duke
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


// vera
/obj/item/toy/lumosplush/vera
	name = "screamer retard"
	desc = "now ᴘʟᴀʏɪɴɢ: Who asked (Feat: Nobody) ───────────────── ◄◄⠀▐▐⠀►► 𝟸:𝟷𝟾 / 𝟹:𝟻𝟼⠀───○"
	icon_state = "vera-plush"
	plushtype = /obj/item/toy/lumosplush/vera
	pillowtype = /obj/structure/bed/roller/bodypillow/vera
	itemsounds = list('sound/misc/server-ready.ogg' = 1)

/obj/structure/bed/roller/bodypillow/vera
	name = "screamer retard"
	desc = "now ᴘʟᴀʏɪɴɢ: Who asked (Feat: Nobody) ───────────────── ◄◄⠀▐▐⠀►► 𝟸:𝟷𝟾 / 𝟹:𝟻𝟼⠀───○"
	icon_state = "vera"
	foldabletype = /obj/item/toy/lumosplush/vera

/datum/crafting_recipe/lumosplush/vera
	name = "vera plushie"
	result = /obj/item/toy/lumosplush/vera
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


// jack
/obj/item/toy/lumosplush/jack
	name = "daddys kitten"
	desc = "champion head of security fragger 2060"
	icon_state = "jack-plush"
	plushtype = /obj/item/toy/lumosplush/jack
	pillowtype = /obj/structure/bed/roller/bodypillow/jack
	itemsounds = list('sound/weapons/smash.ogg' = 8, 'sound/effects/adminhelp.ogg' = 2)

/obj/structure/bed/roller/bodypillow/jack
	name = "daddys kitten"
	desc = "champion head of security fragger 2060"
	icon_state = "jack"
	foldabletype = /obj/item/toy/lumosplush/jack

/datum/crafting_recipe/lumosplush/jack
	name = "jack plushie"
	result = /obj/item/toy/lumosplush/jack
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


// kevin
/obj/item/toy/lumosplush/kevin
	name = "competent doctor"
	desc = "water ice salt aye"
	icon_state = "kevin-plush"
	plushtype = /obj/item/toy/lumosplush/kevin
	pillowtype = /obj/structure/bed/roller/bodypillow/kevin
	itemsounds = list('modular_citadel/sound/voice/peep.ogg' = 1)

/obj/structure/bed/roller/bodypillow/kevin
	name = "competent doctor"
	desc = "water ice salt aye"
	icon_state = "kevin"
	foldabletype = /obj/item/toy/lumosplush/kevin

/datum/crafting_recipe/lumosplush/kevin
	name = "kevin plushie"
	result = /obj/item/toy/lumosplush/kevin
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


// marissa
/obj/item/toy/lumosplush/marissa
	name = "fart.jpg"
	desc = "uh oh are they gonna get ooc disabled again???"
	icon_state = "marissa-plush"
	plushtype = /obj/item/toy/lumosplush/marissa
	pillowtype = /obj/structure/bed/roller/bodypillow/marissa
	itemsounds = list('sound/weapons/gunshot.ogg' = 1)

/obj/structure/bed/roller/bodypillow/marissa
	name = "fart.jpg"
	desc = "uh oh are they gonna get ooc disabled again???"
	icon_state = "marissa"
	foldabletype = /obj/item/toy/lumosplush/marissa

/datum/crafting_recipe/lumosplush/marissa
	name = "marissa plushie"
	result = /obj/item/toy/lumosplush/marissa
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


// lennox
/obj/item/toy/lumosplush/lennox
	name = "pissbaby"
	desc = "when you hittin it from the back and the pussy fart"
	icon_state = "lennox-plush"
	plushtype = /obj/item/toy/lumosplush/lennox
	pillowtype = /obj/structure/bed/roller/bodypillow/lennox
	itemsounds = list('modular_citadel/sound/voice/scream_moth.ogg' = 1)

/obj/structure/bed/roller/bodypillow/lennox
	name = "pissbaby"
	desc = "when you hittin it from the back and the pussy fart"
	icon_state = "lennox"
	foldabletype = /obj/item/toy/lumosplush/lennox

/datum/crafting_recipe/lumosplush/lennox
	name = "lennox plushie"
	result = /obj/item/toy/lumosplush/lennox
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


// moffy
/obj/item/toy/lumosplush/moffy
	name = "fluffy moff"
	desc = "reeks of alcohol"
	icon_state = "moffy-plush"
	plushtype = /obj/item/toy/lumosplush/moffy
	pillowtype = /obj/structure/bed/roller/bodypillow/moffy
	itemsounds = list('sound/voice/moth/mothlaugh.ogg' = 9, 'sound/effects/adminhelp.ogg' = 1)

/obj/structure/bed/roller/bodypillow/moffy
	name = "fluffy moff"
	desc = "reeks of alcohol"
	icon_state = "moffy"
	foldabletype = /obj/item/toy/lumosplush/moffy

/datum/crafting_recipe/lumosplush/moffy
	name = "moffy plushie"
	result = /obj/item/toy/lumosplush/moffy
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


// vadim
/obj/item/toy/lumosplush/vadim
	name = "hot neo-Slavic dad"
	desc = "Nyet, Vadim is not want be marketable plush!"
	icon_state = "vadim-plush"
	plushtype = /obj/item/toy/lumosplush/vadim
	pillowtype = /obj/structure/bed/roller/bodypillow/vadim
	itemsounds = list('sound/effects/slosh.ogg' = 1)

/obj/structure/bed/roller/bodypillow/vadim
	name = "hot neo-Slavic dad"
	desc = "Nyet, Vadim is not want be marketable plush!"
	icon_state = "vadim"
	foldabletype = /obj/item/toy/lumosplush/vadim

/datum/crafting_recipe/lumosplush/vadim
	name = "vadim plushie"
	result = /obj/item/toy/lumosplush/vadim
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


// light
/obj/item/toy/lumosplush/light
	name = "hardsuit moff"
	desc = "the hardsuit appears to be glued to him"
	icon_state = "light-plush"
	plushtype = /obj/item/toy/lumosplush/light
	pillowtype = /obj/structure/bed/roller/bodypillow/light
	itemsounds = list('sound/mecha/mechmove03.ogg' = 1)

/obj/structure/bed/roller/bodypillow/light
	name = "hardsuit moff"
	desc = "the hardsuit appears to be glued to him"
	icon_state = "light"
	foldabletype = /obj/item/toy/lumosplush/light

/datum/crafting_recipe/lumosplush/light
	name = "light drinker plushie"
	result = /obj/item/toy/lumosplush/light
	reqs = list(/obj/item/bedsheet/ = 1,
				/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/cable_coil/ = 5)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

