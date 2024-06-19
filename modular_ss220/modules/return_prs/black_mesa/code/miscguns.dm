/obj/item/gun/ballistic/shotgun/m23
	name = "\improper Model 23-37"
	desc = "An outdated police shotgun sporting an eight-round tube, chambered in twelve-gauge."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/guns.dmi'
	icon_state = "riotshotgun"
	worn_icon = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/guns_back.dmi'
	worn_icon_state = "riotshotgun"
	lefthand_file = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/guns_lefthand.dmi'
	righthand_file = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/guns_righthand.dmi'
	inhand_icon_state = "riot_shotgun"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/m23
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_BELT | ITEM_SLOT_OCLOTHING
	inhand_x_dimension = 32
	inhand_y_dimension = 32

/obj/item/gun/ballistic/shotgun/m23/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_BOLT)

/obj/item/ammo_box/magazine/internal/shot/m23
	name = "m23 shotgun internal magazine"
	caliber = CALIBER_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun/rubbershot
	max_ammo = 8






/obj/item/gun/ballistic/automatic/pistol/g18
	name = "\improper Glock-18"
	desc = "A weapon from bygone times, and this is the exact 21st century version. Let's hope it's more reliable. Chambered in 9x25mm."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/glock.dmi'
	icon_state = "glock_mesa"
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/g18
	can_suppress = FALSE
	fire_sound = 'sound/items/weapons/gun/pistol/shot_alt.ogg'
	rack_sound = 'sound/items/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/items/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/items/weapons/gun/pistol/slide_drop.ogg'
	burst_size = 1
	fire_delay = 1.5
	spread = 2.5
	mag_display = FALSE
	mag_display_ammo = FALSE
	projectile_damage_multiplier = 0.7


/obj/item/gun/ballistic/automatic/pistol/g18/Initialize(mapload)
	. = ..()

	AddComponent(/datum/component/automatic_fire, fire_delay)


/obj/item/ammo_box/magazine/g18
	name = "\improper Glock-18 magazine"
	desc = "A magazine for the Glock-18 machine pistol, chambered for 9x25mm."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/mags.dmi'
	icon_state = "g17"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	max_ammo = 19

/obj/item/ammo_box/magazine/g18/hp
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/g18/ihdf
	ammo_type = /obj/item/ammo_casing/c9mm/ihdf

/obj/item/ammo_box/magazine/g18/rubber
	ammo_type = /obj/item/ammo_casing/c9mm/rubber





/obj/item/gun/ballistic/automatic/pistol/g20
	name = "\improper Glock 20"
	desc = "A weapon from bygone times, and this is the exact 21st century version. In fact, even more reliable. Chambered in 10mm Auto."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/glock.dmi'
	icon_state = "glock_spec"
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/g20
	fire_sound = 'modular_nova/master_files/sound/weapons/glock17_fire.ogg'
	rack_sound = 'sound/items/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/items/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/items/weapons/gun/pistol/slide_drop.ogg'
	fire_delay = 1.7
	projectile_damage_multiplier = 0.8

/obj/item/gun/ballistic/automatic/pistol/g20/Initialize(mapload)
	. = ..()

	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/ammo_box/magazine/g20
	name = "\improper Glock-20 magazine"
	desc = "A magazine for the Glock-20 handgun, chambered for 10mm ammo."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/mags.dmi'
	icon_state = "pdh"
	ammo_type = /obj/item/ammo_casing/c10mm
	caliber = CALIBER_10MM
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	max_ammo = 15

#define COMPANY_CANTALAN "It has <b>[span_purple("Cantalan Federal Arms")]</b> etched into it."
/// The caliber used by the Catanheim.
#define CALIBER_A68 "a68"
/*
*	6.8x43mm
*/

/obj/item/ammo_casing/a68
	name = "6.8mm bullet casing"
	desc = "A 6.8mm bullet casing."
	icon_state = "762-casing"
	caliber = CALIBER_A68
	projectile_type = /obj/projectile/bullet/a68

/obj/projectile/bullet/a68
	name = "6.8 bullet"
	damage = 55
	armour_penetration = 10
	wound_bonus = -45
	wound_falloff_tile = 0

/obj/item/ammo_box/magazine/cm68
	name = "rifle magazine (6.8mm)"
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/mags.dmi'
	icon_state = "6.8"
	ammo_type = /obj/item/ammo_casing/a68
	caliber = CALIBER_A68
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/cm68/empty
	start_empty = 1


/*
*	CFA RIFLE
*/

/obj/item/gun/ballistic/automatic/cfa_rifle
	name = "Cantanheim 6.8mm rifle"
	desc = "A simple semi-automatic rifle chambered in 6.8mm. The letters 'XJP' are crossed out in the receiver." //Different 6.8mm than the FTU's propietary pulse ballistics
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/guns.dmi'
	icon_state = "cfa_rifle"
	inhand_icon_state = "irifle"
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	lefthand_file = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/64x_guns_left.dmi'
	righthand_file = 'modular_ss220/modules/return_prs/black_mesa/icons/miscweapon/64x_guns_right.dmi'
	worn_icon_state = "gun"
	accepted_magazine_type = /obj/item/ammo_box/magazine/cm68
	fire_delay = 54
	can_suppress = FALSE
	burst_size = 1
	actions_types = list()
	mag_display = FALSE
	mag_display_ammo = FALSE
	empty_indicator = FALSE
	recoil = 1
	weapon_weight = WEAPON_HEAVY
	pixel_x = -8
	w_class = WEIGHT_CLASS_BULKY

/obj/item/gun/ballistic/automatic/cfa_rifle/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 1.5)

/obj/item/gun/ballistic/automatic/cfa_rifle/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_CANTALAN)

/obj/item/gun/ballistic/automatic/cfa_rifle/give_gun_safeties()
	return

/obj/item/gun/ballistic/automatic/cfa_rifle/empty
	spawnwithmagazine = FALSE
