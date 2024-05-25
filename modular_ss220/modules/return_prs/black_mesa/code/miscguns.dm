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
	fire_sound = 'sound/weapons/gun/pistol/shot_alt.ogg'
	rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
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
	rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
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
