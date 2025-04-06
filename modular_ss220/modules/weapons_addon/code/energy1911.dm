/obj/item/gun/ballistic/automatic/pistol/em1911
	name = "energy M1911"
	desc = "A special laser pistol, designed to look like the M1911."
	icon = 'modular_ss220/modules/weapons_addon/icons/guns.dmi'
	icon_state = "m1911"
	lefthand_file = 'modular_ss220/modules/weapons_addon/icons/guns_lefthand.dmi'
	righthand_file = 'modular_ss220/modules/weapons_addon/icons/guns_righthand.dmi'
	inhand_icon_state = "colt"
	accepted_magazine_type = /obj/item/ammo_box/magazine/recharge/m1911
	force = 5
	bolt_type = BOLT_TYPE_OPEN
	show_bolt_icon = FALSE
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	can_suppress = FALSE
	fire_sound = 'sound/items/weapons/laser.ogg'
	rack_sound = 'sound/items/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/items/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/items/weapons/gun/pistol/slide_drop.ogg'

/obj/item/ammo_box/magazine/recharge/m1911
	name = "energy m1911 cell (lethal)"
	desc = "A rechargeable, detachable battery that serves as a magazine for laser pistols."
	icon = 'modular_ss220/modules/weapons_addon/icons/ammo.dmi'
	icon_state = "l45-8"
	base_icon_state = "l45"
	ammo_type = /obj/item/ammo_casing/laser/m1911
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE
	caliber = "em1911ll"


/obj/item/ammo_box/magazine/recharge/m1911/disabler
	name = "energy m1911 cell (nonlethal)"
	ammo_type = /obj/item/ammo_casing/laser/m1911/disabler
	icon_state = "d45-8"
	base_icon_state = "d45"
	caliber = "em1911d"

/obj/item/ammo_casing/laser/m1911
	can_be_printed = FALSE
	projectile_type = /obj/projectile/beam/m1911
	fire_sound = 'sound/items/weapons/laser.ogg'
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/red
	caliber = "em1911ll"

/obj/item/ammo_casing/laser/m1911/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/delete_on_drop)


/obj/item/ammo_casing/laser/m1911/disabler
	projectile_type = /obj/projectile/beam/m1911/disabler
	fire_sound = 'sound/items/weapons/taser2.ogg'
	harmful = FALSE
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/blue
	caliber = "em1911d"

/obj/projectile/beam/m1911
	name = "focused laser beam"
	hitscan = FALSE
	speed = 0.6
	damage = 20
	wound_bonus = -40
	icon_state = "laser"
	hitsound = 'sound/items/weapons/sear.ogg'
	hitsound_wall = 'sound/items/weapons/effects/searwall.ogg'
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser

/obj/projectile/beam/m1911/disabler
	name = "focused disabler beam"
	icon_state = "omnilaser"
	damage = 30
	damage_type = STAMINA
	armor_flag = ENERGY
	hitsound = 'sound/items/weapons/sear_disabler.ogg'
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler



/obj/item/gun/ballistic/automatic/pistol/em1911/nomag
	spawnwithmagazine = FALSE


/obj/item/storage/toolbox/guncase/nova/pistol/ntc
	name = "Nanotrasen Consultant's Energy M1911 guncase"

/obj/item/storage/toolbox/guncase/nova/pistol/ntc/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/em1911/nomag(src)
	new /obj/item/ammo_box/magazine/recharge/m1911/disabler(src)
	new /obj/item/ammo_box/magazine/recharge/m1911/disabler(src)
	new /obj/item/ammo_box/magazine/recharge/m1911(src)
	new /obj/item/ammo_box/magazine/recharge/m1911(src)

/obj/item/choice_beacon/ntc
	company_source = "Nanotrasen Corporation"

/obj/item/choice_beacon/ntc/generate_display_names()
	var/static/list/selectable_gun_types = list(
		"Energy M1911 Pistol Set" = /obj/item/storage/toolbox/guncase/nova/pistol/ntc,
	)

	return selectable_gun_types
