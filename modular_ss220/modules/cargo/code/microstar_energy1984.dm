/datum/armament_entry/company_import/microstar
	category = MICROSTAR_ENERGY_NAME
	company_bitflag = CARGO_COMPANY_MICROSTAR

// Basic lethal/disabler beam weapons

/datum/armament_entry/company_import/microstar/basic_energy_weapons
	subcategory = "Basic Energy Smallarms"

/datum/armament_entry/company_import/microstar/basic_energy_weapons/mini_egun
	item_type = /obj/item/gun/energy/e_gun/mini
	cost = PAYCHECK_COMMAND * 10

// Preset 'loadout' kits built around a barrel attachment

/datum/armament_entry/company_import/microstar/mcr_attachments
	subcategory = "Microfusion Attachment Kits"
	cost = PAYCHECK_COMMAND * 10

/datum/armament_entry/company_import/microstar/mcr_attachments/hellfire
	name = "microfusion hellfire kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/hellfire

/datum/armament_entry/company_import/microstar/mcr_attachments/scatter
	name = "microfusion scatter kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/scatter

/datum/armament_entry/company_import/microstar/mcr_attachments/lance
	name = "microfusion lance kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/lance

/datum/armament_entry/company_import/microstar/mcr_attachments/repeater
	name = "microfusion repeater kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/repeater

/datum/armament_entry/company_import/microstar/mcr_attachments/tacticool
	name = "microfusion suppressor kit"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_loadout/tacticool
	contraband = TRUE

// Improved phase emitters, cells, and cell attachments

/datum/armament_entry/company_import/microstar/mcr_upgrades
	subcategory = "Microfusion Upgrade Kits"

/datum/armament_entry/company_import/microstar/mcr_upgrades/enhanced_part_kit
	name = "microfusion enhanced parts"
	item_type = /obj/item/storage/briefcase/secure/white/mcr_parts/enhanced
	cost = PAYCHECK_COMMAND * 5

/datum/armament_entry/company_import/microstar/mcr_upgrades/capacity_booster
	item_type = /obj/item/microfusion_cell_attachment/overcapacity
	cost = PAYCHECK_COMMAND * 2
