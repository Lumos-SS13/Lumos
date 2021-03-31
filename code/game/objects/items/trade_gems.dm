/*
	Gemstones

		Solely for trade value, atleast at this time, to enforce Cargo and Mining departmental cooperation.
			Prehaps in the future we can get gemcutting for max dorf fortress B)
*/

/obj/item/trade_gem
	name = "uh oh"
	desc = "you shouldn't be seeing this!"
	icon = 'icons/obj/items/trade_gems.dmi'
	icon_state = "uhoh"

// Common-ish //

/obj/item/trade_gem/zircon
	name = "colored zircons"
	desc = "A small pile of fairly cheap silicate minerals. Should be worth something to Cargo."
	icon_state = "zircons"

/obj/item/trade_gem/quartz
	name = "quartz shard"
	desc = "Common silicate mineral, found everywhere. Should be worth something for Cargo."
	icon_state = "quartz"

/obj/item/trade_gem/obsidian
	name = "obsidian shard"
	desc = "A beautiful shard formed from the volcanic heart of a planet. Prized for their naturally occuring monofilament edge."
	icon_state = "obsidian"

// Rare //

/obj/item/trade_gem/emerald
	name = "emerald gem"
	desc = "An exceptional emerald gem. Cargo could use this for trade."
	icon_state = "emerald"

/obj/item/trade_gem/ruby
	name = "ruby gem"
	desc = "Hardy lump of corundum. Often used in electronics and lasers, so it should be worth something."
	icon_state = "ruby"

/obj/item/trade_gem/helixite
	name = "helixite shard"
	desc = "A valuable fragment of helixite, a durable key material in high-tension combat plating. Sadly, it's useless outside of a fat stack of credits for Cargo."
	icon_state = "helixite"

// Super Rare like how the hell did you find this //

/obj/item/trade_gem/peridot
	name = "peridot fragment"
	desc = "Pronounced pair-uh-doe! Worth something compared to most these clods!"
	icon_state = "peridot"

/obj/item/trade_gem/compressed_gold // diggy diggy hole
	name = "compressed gold boulder"
	desc = "We're rich! Too big for any fabricators to disassemble, but should be worth its weight in..."
	icon_state = "goldchunk"
	layer = ABOVE_MOB_LAYER
	w_class = WEIGHT_CLASS_HUGE

/obj/item/trade_gem/compressed_gold/ComponentInitialize() // Copied from kirbyplants - to make miners choose between carrying this hunk of gold or leave it
	. = ..()
	AddElement(/datum/element/tactical)
	addtimer(CALLBACK(src, /datum.proc/_AddElement, list(/datum/element/beauty, 500)), 0)
	AddComponent(/datum/component/two_handed, require_twohands=TRUE, force_unwielded=10, force_wielded=10)
