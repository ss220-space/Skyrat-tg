/datum/armament_entry/company_import/nri_surplus
	category = NRI_SURPLUS_COMPANY_NAME
	company_bitflag = CARGO_COMPANY_NRI_SURPLUS

// Various NRI clothing items

/datum/armament_entry/company_import/nri_surplus/clothing
	subcategory = "Clothing Supplies"

/datum/armament_entry/company_import/nri_surplus/clothing/uniform
	item_type = /obj/item/clothing/under/syndicate/rus_army/cin_surplus/random_color
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/clothing/belt
	item_type = /obj/item/storage/belt/military/cin_surplus/random_color
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/clothing/backpack
	item_type = /obj/item/storage/backpack/industrial/cin_surplus/random_color
	cost = PAYCHECK_CREW


/datum/armament_entry/company_import/nri_surplus/clothing/police_uniform
	item_type = /obj/item/clothing/under/colonial/nri_police
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/clothing/police_cloak
	item_type = /obj/item/clothing/neck/cloak/colonial/nri_police
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/clothing/police_cap
	item_type = /obj/item/clothing/head/hats/colonial/nri_police
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/clothing/police_mask
	item_type = /obj/item/clothing/mask/gas/nri_police
	cost = PAYCHECK_CREW*2


/datum/armament_entry/company_import/nri_surplus/armor
	subcategory = "Armor Supplies"
	cost = PAYCHECK_COMMAND * 2
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/armor/cin_helmet
	item_type = /obj/item/clothing/head/helmet/cin_surplus_helmet/random_color

/datum/armament_entry/company_import/nri_surplus/armor/cin_vest
	item_type = /obj/item/clothing/suit/armor/vest/cin_surplus_vest

/datum/armament_entry/company_import/nri_surplus/armor/police_vest
	item_type = /obj/item/clothing/head/helmet/nri_police

/datum/armament_entry/company_import/nri_surplus/armor/police_helmet
	item_type = /obj/item/clothing/suit/armor/vest/nri_police

/datum/armament_entry/company_import/nri_surplus/misc
	subcategory = "Miscellaneous Supplies"

/datum/armament_entry/company_import/nri_surplus/misc/flares
	item_type = /obj/item/storage/box/nri_flares
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/nri_surplus/misc/binoculars
	item_type = /obj/item/binoculars
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/misc/screwdriver_pen
	item_type = /obj/item/pen/screwdriver
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/misc/trench_tool
	item_type = /obj/item/trench_tool
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/misc/food_replicator
	description = "A widespread technology previously used by far colonies on the NRI's borders, over time being shifted from the foundation of colonies \
	to a simple disaster relief solution. It can turn spoiled or inedible plant matter into food, medical supplies, and other general items. \
	These particular units were displaced during a stock count in an NRI warehouse."
	item_type = /obj/item/circuitboard/machine/biogenerator/food_replicator
	cost = CARGO_CRATE_VALUE * 9

/datum/armament_entry/company_import/nri_surplus/misc/nri_flag
	item_type = /obj/item/sign/flag/nri
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/nri_surplus/firearm_ammo
	subcategory = "Firearm Magazines"
	contraband = TRUE
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/plasma_battery
	item_type = /obj/item/ammo_box/magazine/recharge/plasma_battery

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/miecz
	item_type = /obj/item/ammo_box/magazine/miecz/spawns_empty

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/sakhno
	item_type = /obj/item/ammo_box/strilka310
	cost = PAYCHECK_CREW * 6

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/lanca
	item_type = /obj/item/ammo_box/magazine/lanca/spawns_empty

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/amr_magazine
	item_type = /obj/item/ammo_box/magazine/wylom
	cost = PAYCHECK_CREW * 8
