//sechud defines
#define SECHUD_OLD_CAPTAIN "hudoldcaptain"
#define SECHUD_OLD_SEC "hudoldsec"
#define SECHUD_OLD_ENG "hudoldeng"
#define SECHUD_OLD_SCI "hudoldsci"
#define SECHUD_OLD_MED "hudoldmed"

// safe code
GLOBAL_LIST_EMPTY(safes)

/obj/structure/safe
	var/known_by = list()

/obj/structure/safe/proc/get_combination()
	return jointext(tumblers, ", ")

/obj/structure/safe/Initialize(mapload)
	. = ..()
	GLOB.safes += src

/obj/structure/safe/Destroy()
	GLOB.safes -= src
	return ..()

/obj/item/paper/paperslip/corporate/fluff/safe_code
	name = "safe codes"
	default_raw_text = "<center><h3>Safe Codes</h3></center>"
	var/owner

/obj/item/paper/paperslip/corporate/fluff/safe_code/Initialize(mapload)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/item/paper/paperslip/corporate/fluff/safe_code/LateInitialize(mapload)
	. = ..()
	for(var/safe in GLOB.safes)
		var/obj/structure/safe/S = safe
		if(owner in S.known_by)
			default_raw_text = "<br>The combination for the safe located in the [get_area(S)] is: [S.get_combination()]<br>"
			update_icon()
			add_raw_text(default_raw_text)
	update_appearance()

//charlie bridge safe and code
/obj/structure/safe/floor/charlie_captain
	number_of_tumblers = 3
	known_by = list("charlie")

/obj/item/paper/paperslip/corporate/fluff/safe_code/charlie_safe
	name = "emergency bridge safe code"
	owner = "charlie"

// suits and armor datums
/datum/armor/retro_sec
	acid = 10
	bio = 10
	bomb = 0
	bullet = 5
	energy = 0
	fire = 40
	laser = 0
	melee = 10
	wound = 10
	consume = 0

/datum/armor/retro_eng
	acid = 40
	bio = 10
	bomb = 15
	bullet = 0
	energy = 0
	fire = 80
	laser = 5
	melee = 0
	wound = 10
	consume = 0

/datum/armor/retro_sci
	acid = 70
	bio = 20
	bomb = 5
	bullet = 0
	energy = 5
	fire = 20
	laser = 0
	melee = 0
	wound = 5
	consume = 0

/datum/armor/retro_med
	acid = 30
	bio = 60
	bomb = 0
	bullet = 0
	energy = 0
	fire = 10
	laser = 0
	melee = 0
	wound = 15
	consume = 0

/datum/armor/damaged_captain_space
	melee = 30
	bullet = 20
	laser = 20
	energy = 15
	bomb = 5
	bio = 0
	fire = 0
	acid = 0
	wound = 5
