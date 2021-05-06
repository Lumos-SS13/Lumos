/obj/item
	var/obj/structure/flora/ash/plantable_flora

/obj/item/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(istype(target, /turf/open/floor/plating/asteroid/basalt))
		var/turf/open/floor/plating/asteroid/basalt/chosenBasalt = target
		for(var/obj/structure/flora/ash/abortPlant in chosenBasalt)
			return
		if(!plantable_flora)
			return
		if(!isashwalker(user))
			return
		if(!proximity_flag)
			return
		if(!do_after(user, 4 SECONDS, target = chosenBasalt))
			return
		var/obj/structure/flora/ash/planted_flora = new plantable_flora(get_turf(chosenBasalt))
		planted_flora.harvest(harvest_allow = FALSE)
		qdel(src)
	else
		return ..()

//logs and stuff
/obj/item/grown/log
	plantable_flora = /obj/structure/flora/ash/lumos_planting/hard_mushroom

/obj/item/grown/log/bamboo
	plantable_flora = /obj/structure/flora/ash/lumos_planting/bamboo_plant

//mushrooms
/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom
	plantable_flora = /obj/structure/flora/ash/lumos_planting/glowing_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/reishi
	plantable_flora = /obj/structure/flora/ash/lumos_planting/reishi_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/amanita
	plantable_flora = /obj/structure/flora/ash/lumos_planting/amanita_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/angel
	plantable_flora = /obj/structure/flora/ash/lumos_planting/angel_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/libertycap
	plantable_flora = /obj/structure/flora/ash/lumos_planting/liberty_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/chanterelle
	plantable_flora = /obj/structure/flora/ash/lumos_planting/chanter_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/plumphelmet
	plantable_flora = /obj/structure/flora/ash/lumos_planting/plump_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom/shadowshroom
	plantable_flora = /obj/structure/flora/ash/lumos_planting/shadow_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom/glowcap
	plantable_flora = /obj/structure/flora/ash/lumos_planting/glowingcap_mushroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/jupitercup
	plantable_flora = /obj/structure/flora/ash/lumos_planting/jupiter_mushroom

/obj/item/grown/cotton/durathread
	plantable_flora = /obj/structure/flora/ash/lumos_planting/durathread_plant

//ambrosia stuff
/obj/item/reagent_containers/food/snacks/grown/ambrosia/vulgaris
	plantable_flora = /obj/structure/flora/ash/lumos_planting/vulgaris_plant

/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus
	plantable_flora = /obj/structure/flora/ash/lumos_planting/deus_plant

/obj/item/reagent_containers/food/snacks/grown/ambrosia/gaia
	plantable_flora = /obj/structure/flora/ash/lumos_planting/gaia_plant

//existing lavaland mushrooms
/obj/item/reagent_containers/food/snacks/grown/ash_flora/shavings
	plantable_flora = /obj/structure/flora/ash

/obj/item/reagent_containers/food/snacks/grown/ash_flora/mushroom_leaf
	plantable_flora = /obj/structure/flora/ash/leaf_shroom

/obj/item/reagent_containers/food/snacks/grown/ash_flora/mushroom_cap
	plantable_flora = /obj/structure/flora/ash/cap_shroom

/obj/item/reagent_containers/food/snacks/grown/ash_flora/mushroom_stem
	plantable_flora = /obj/structure/flora/ash/stem_shroom

/obj/item/reagent_containers/food/snacks/grown/ash_flora/cactus_fruit
	plantable_flora = /obj/structure/flora/ash/cacti

//plus divers, vivre l'esclavage des marcheurs de cendres
//more variety, live the enslavement of the walkers of ashes.

/obj/item/reagent_containers/food/snacks/grown/pineapple
	plantable_flora = /obj/structure/flora/ash/lumos_planting/pineapple

/obj/item/reagent_containers/food/snacks/grown/blumpkin
	plantable_flora = /obj/structure/flora/ash/lumos_planting/blumpkin

/obj/item/reagent_containers/food/snacks/grown/tea
	plantable_flora = /obj/structure/flora/ash/lumos_planting/tea

/obj/item/reagent_containers/food/snacks/grown/tea/astra
	plantable_flora = /obj/structure/flora/ash/lumos_planting/astraltea

/obj/item/reagent_containers/food/snacks/grown/coffee
	plantable_flora = /obj/structure/flora/ash/lumos_planting/coffee

/obj/item/reagent_containers/food/snacks/grown/coffee/robusta
	plantable_flora = /obj/structure/flora/ash/lumos_planting/robustcoffee

/obj/item/reagent_containers/food/snacks/grown/tobacco
	plantable_flora = /obj/structure/flora/ash/lumos_planting/tobacco

/obj/item/reagent_containers/food/snacks/grown/tobacco/space
	plantable_flora = /obj/structure/flora/ash/lumos_planting/spacetobacco

/obj/item/reagent_containers/food/snacks/grown/cocoapod
	plantable_flora = /obj/structure/flora/ash/lumos_planting/cocoa

/obj/item/reagent_containers/food/snacks/grown/vanillapod
	plantable_flora = /obj/structure/flora/ash/lumos_planting/vanilla

/obj/item/reagent_containers/food/snacks/grown/meatwheat
	plantable_flora = /obj/structure/flora/ash/lumos_planting/meatwheat

/obj/item/reagent_containers/food/snacks/grown/wheat
	plantable_flora = /obj/structure/flora/ash/lumos_planting/wheat

/obj/item/reagent_containers/food/snacks/grown/grass
	plantable_flora = /obj/structure/flora/ash/lumos_planting/grass

/obj/item/reagent_containers/food/snacks/grown/aloe
	plantable_flora = /obj/structure/flora/ash/lumos_planting/aloe

/obj/item/reagent_containers/food/snacks/grown/whitebeet
	plantable_flora = /obj/structure/flora/ash/lumos_planting/beet
