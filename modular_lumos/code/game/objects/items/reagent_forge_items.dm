/obj/item/forging/hot_metal
	name = "hot metal"
	desc = "This is metal that has become very hot."

/obj/item/forging/construct
	//0 is the default. The more mistakes, the less damage it does. I wonder if its possible to get negative mistakes... (yes it is)
	var/mistakes = 0
	//this is the amount of times it is required to be hammered
	var/required_hammered = 10
	//this is the current amount of times it has been hammered
	var/hammered = 0

/obj/item/forging/construct/sword
	name = "hot sword object"
	desc = "A hot metal mass that resembles a sword"

/obj/item/forging/construct/staff
	name = "hot staff object"
	desc = "A hot metal mass that resembles a sword"

/obj/item/forging/finished
	