/obj/item/clothing/head/helmet/sf_peacekeeper
	armor_type =  /datum/armor/suit_armor

/obj/item/clothing/suit/armor/sf_peacekeeper
	armor_type =  /datum/armor/suit_armor

/datum/supply_pack/imports/wt550
	name = "WT-550 Autorifle Crate"
	desc = ""
	hidden = FALSE
	access = ACCESS_ARMORY
	access_view = ACCESS_ARMORY
	cost = CARGO_CRATE_VALUE * 14
	contains = list(
		/obj/item/gun/ballistic/automatic/wt550 = 2,
		/obj/item/ammo_box/magazine/wt550m9 = 2,
	)
	crate_name = "emergency centcom crate(WT-550 Autorifle)"
	crate_type = /obj/structure/closet/crate/secure/centcom

/datum/supply_pack/imports/wt550ammo
	name = "WT-550 Ammo Crate"
	desc = ""
	hidden = FALSE
	access = ACCESS_SECURITY
	access_view = ACCESS_ARMORY
	cost = CARGO_CRATE_VALUE * 8
	contains = list(
		/obj/item/ammo_box/magazine/wt550m9 = 2,
		/obj/item/ammo_box/magazine/wt550m9/wtap = 2,
		/obj/item/ammo_box/magazine/wt550m9/wtic = 2,
	)
	crate_name = "emergency centcom crate(Ammo: WT-550 Autorifle)"
	crate_type = /obj/structure/closet/crate/secure/centcom

/datum/supply_pack/security/armory/shotguns
	name = "Riot Shotguns Crate"
	desc = "Three 12ga riot shotguns, with matching bandoliers for each."
	cost = CARGO_CRATE_VALUE * 10
	contains = list(
		/obj/item/gun/ballistic/shotgun/riot = 3,
		/obj/item/storage/belt/bandolier = 3,
	)
	crate_name = "Riot Shotgun Crate"


/datum/supply_pack/security/armory/flak_vest
	name = "Peacekeeper flak vests 'Gordyn' Crate"
	crate_name = "peacekeeper flak vests crate"
	desc = "Contains three SolFed-made flak peacekeeper vests 'Gordyn'."
	cost = CARGO_CRATE_VALUE * 3
	access = ACCESS_SECURITY
	contains = list(
		/obj/item/clothing/suit/armor/vest/det_suit/sol = 3,
	)

/datum/supply_pack/security/armory/hardened_emt_armor
	name = "Hardened emt Armor Kit Crate"
	crate_name = "hardened armor kit crate"
	desc = "Contains three sets of SolFed-made hardened emt body armor and matching helmets."
	access = ACCESS_BRIG
	cost = CARGO_CRATE_VALUE * 5
	contains = list(
		/obj/item/clothing/head/helmet/toggleable/sf_hardened/emt = 3,
		/obj/item/clothing/suit/armor/sf_hardened/emt = 3,
	)

/datum/supply_pack/security/armory/soft_branded_armor
	name = "Soft Peacekeeper Armor Kit Crate"
	crate_name = "soft peacekeeper armor kit crate"
	desc = "Contains three sets of SolFed-made soft peacekeeper body armor and matching helmets."
	access = ACCESS_SECURITY
	cost = CARGO_CRATE_VALUE * 5
	contains = list(
		/obj/item/clothing/head/helmet/sf_peacekeeper = 3,
		/obj/item/clothing/suit/armor/sf_peacekeeper = 3,
	)

/datum/supply_pack/security/armory/gunkit
	cost = CARGO_CRATE_VALUE * 5.4
	access = ACCESS_WEAPONS
	access_view = ACCESS_ARMORY
	access_any = list(ACCESS_COMMAND, ACCESS_ARMORY)

/datum/supply_pack/security/armory/gunkit/hell
	name = "Experimental gunkit Crate(hellfire)"
	desc = "Contains one hellfire crafting gunkit. Requires Command or Armory access to open."
	contains = list(/obj/item/weaponcrafting/gunkit/hellgun)
	crate_name = "experimental gunkit crate(hellfire)"

/datum/supply_pack/security/armory/gunkit/tesla
	name = "Experimental gunkit Crate(tesla)"
	desc = "Contains one tesla crafting gunkit. Requires Command or Armory access to open."
	contains = list(/obj/item/weaponcrafting/gunkit/tesla)
	crate_name = "experimental gunkit crate(tesla)"

/datum/supply_pack/security/armory/gunkit/ion
	name = "Experimental gunkit Crate(ion)"
	desc = "Contains one ion crafting gunkit. Requires Command or Armory access to open."
	contains = list(/obj/item/weaponcrafting/gunkit/ion)
	crate_name = "experimental gunkit crate(ion)"

/datum/supply_pack/security/armory/gunkit/xray
	name = "Experimental gunkit Crate(xray)"
	desc = "Contains one xray crafting gunkit. Requires Command or Armory access to open."
	contains = list(/obj/item/weaponcrafting/gunkit/xray)
	crate_name = "experimental gunkit crate(xray)"

/obj/effect/spawner/armory_spawn/shotguns
	guns = list(
		/obj/item/gun/ballistic/shotgun/riot,
		/obj/item/gun/ballistic/shotgun/riot,
		/obj/item/gun/ballistic/shotgun/riot,
	)

/obj/effect/spawner/armory_spawn/mod_lasers_big
	guns = list(
		/obj/item/gun/microfusion/mcr01,
		/obj/item/gun/microfusion/mcr01,
		/obj/item/gun/microfusion/mcr01,
	)

/obj/effect/spawner/armory_spawn/mod_lasers_small
	guns = list(
		/obj/item/gun/energy/laser,
		/obj/item/gun/energy/laser,
		/obj/item/gun/energy/laser,
	)

/obj/effect/spawner/armory_spawn/smg
	vertical_guns = TRUE
	guns = list(
		/obj/item/gun/ballistic/automatic/wt550,
		/obj/item/gun/ballistic/automatic/wt550,
		/obj/item/gun/ballistic/automatic/wt550, // replace with /obj/item/gun/ballistic/automatic/battle_rifle later
	)

/datum/supply_pack/security/ammo
	special = FALSE

/datum/supply_pack/security/securityclothes
	special = FALSE

/datum/supply_pack/security/armory/ballistic
	special = FALSE

/datum/supply_pack/security/armory/thermal
	special = FALSE

/datum/supply_pack/imports/russian
	special = FALSE

/datum/supply_pack/security/armory/sacrificial_armor
	special = TRUE
	hidden = TRUE

/datum/supply_pack/security/armory/renoster
	special = TRUE
	hidden = TRUE

/datum/supply_pack/security/armory/short_mod_laser
	special = TRUE
	hidden = TRUE

/datum/supply_pack/security/armory/big_mod_laser
	special = TRUE
	hidden = TRUE

/datum/supply_pack/security/armory/sindano
	special = TRUE
	hidden = TRUE


