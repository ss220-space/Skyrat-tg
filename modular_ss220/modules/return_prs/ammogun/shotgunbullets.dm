#define AMMO_MATS_SHOTGUN_PT20 list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 3,\
									/datum/material/plasma = SMALL_MATERIAL_AMOUNT * 0.5,\
									/datum/material/titanium = SMALL_MATERIAL_AMOUNT * 0.5) // plastitanium slug

#define AMMO_MATS_SHOTGUN_RIP list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 3,\
									/datum/material/bronze = SMALL_MATERIAL_AMOUNT * 1) // the bronze is because real RIP shells are made with copper, apparently

#define AMMO_MATS_SHOTGUN_TEMP list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 2,\
									/datum/material/plasma = SMALL_MATERIAL_AMOUNT * 2) // covers both iceblox and incendiary

/obj/item/ammo_casing/shotgun/hp
	name = "hollow point slug"
	desc = "A 12 gauge hollow point slug purpose built for unarmored targets."
	icon_state = "stunshell"
	projectile_type = /obj/projectile/bullet/shotgun_slug/hp
	advanced_print_req = TRUE

/obj/projectile/bullet/shotgun_slug/hp
	name = "12g hollow point shotgun slug"
	damage = 60
	wound_bonus = 0
	bare_wound_bonus = 40
	weak_against_armour = TRUE

/obj/item/ammo_casing/shotgun/pt20
	name = "PT-20 armor piercing slug"
	desc = "A 12 gauge plastitanium slug purpose built to penetrate armored targets."
	icon_state = "apshell"
	projectile_type = /obj/projectile/bullet/shotgun_slug/pt20
	custom_materials = AMMO_MATS_SHOTGUN_PT20
	advanced_print_req = TRUE

/obj/projectile/bullet/shotgun_slug/pt20
	name = "armor piercing shotgun slug"
	damage = 40
	armour_penetration = 50

/obj/item/ammo_casing/shotgun/rip
	name = "RIP shotgun slug"
	desc = "A Radically Invasive Projectile Slug that is designed to cause massive damage against unarmored targets by embedding inside them."
	icon_state = "ripshell"
	projectile_type = /obj/projectile/bullet/shotgun_slug/rip
	custom_materials = AMMO_MATS_SHOTGUN_RIP
	advanced_print_req = TRUE

/obj/projectile/bullet/shotgun_slug/rip
	name = "RIP shotgun slug"
	damage = 50
	weak_against_armour = TRUE
	embedding = list(embed_chance=80, pain_chance=40, fall_chance=5, jostle_chance=5, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.5, pain_mult=5, rip_time=30)

/obj/item/ammo_casing/shotgun/iceblox
	name = "Iceshot shell"
	desc = "A highly experimental shell filled with nanites that will lower the body temperature of hit targets."
	icon_state = "tshell"
	projectile_type = /obj/projectile/bullet/pellet/shotgun_buckshot/iceblox
	custom_materials = AMMO_MATS_SHOTGUN_TEMP
	pellets = 5
	variance = 20
	advanced_print_req = TRUE

/obj/projectile/bullet/pellet/shotgun_buckshot/iceblox //see /obj/projectile/temp for the original code
	name = "iceblox pellet"
	damage = 5
	weak_against_armour = TRUE
	var/temperature = 30

/obj/projectile/bullet/pellet/shotgun_buckshot/iceblox/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isliving(target))
		var/mob/living/UnluckyBastard = target
		UnluckyBastard.adjust_bodytemperature(((100-blocked)/100)*(temperature - UnluckyBastard.bodytemperature))
