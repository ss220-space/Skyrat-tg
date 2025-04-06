#define CALIBER_HUNTER_STRILKA310 ".310_strilka_hunter"
/obj/projectile/bullet/strilka310/qmhunter
	name = ".310 Strilka hunter bullet"
	damage = 10
	armour_penetration = 0
	weak_against_armour = TRUE

	var/biotype_damage_multiplier = 8
	var/biotype_we_look_for = MOB_BEAST

/obj/projectile/bullet/strilka310/qmhunter/on_hit(atom/target, blocked, pierce_hit)
	if(ismineralturf(target))
		var/turf/closed/mineral/mineral_turf = target
		mineral_turf.gets_drilled(firer, FALSE)
		if(range > 0)
			return BULLET_ACT_FORCE_PIERCE
		return ..()
	if(!isliving(target) || (damage > initial(damage)))
		return ..()
	var/mob/living/target_mob = target
	if(target_mob.mob_biotypes & biotype_we_look_for || istype(target_mob, /mob/living/simple_animal/hostile/megafauna) || istype(target_mob, /mob/living/basic/mining) )
		damage *= biotype_damage_multiplier
	return ..()

/obj/projectile/bullet/strilka310/qmhunter/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/bane, mob_biotypes = MOB_BEAST, damage_multiplier = 8)

/obj/item/ammo_casing/strilka310/qmhunter
	name = ".310 Strilka hunter bullet casing"
	desc = "A .310 Strilka special hunter bullet casing. This one is specially designed that deal extra damage to the local planetary fauna."
	caliber = CALIBER_HUNTER_STRILKA310
	projectile_type = /obj/projectile/bullet/strilka310/qmhunter

/obj/item/gun/ballistic/rifle/sporterized/qmr
	name = "\improper Rengo Precision Rifle"
	desc = "A heavily modified Sakhno rifle, with parts made by Xhihao light arms based around Jupiter herself. \
		Has a higher capacity than standard Sakhno rifles, fitting ten special hunter .310 cartridges made to pierce lavaland fauna."
	accepted_magazine_type = /obj/item/ammo_box/magazine/lanca/qmr
	spawn_magazine_type = /obj/item/ammo_box/magazine/lanca/qmr


/obj/item/gun/ballistic/rifle/sporterized/qmr/empty
	spawn_magazine_type = /obj/item/ammo_box/magazine/lanca/qmr/empty


/obj/item/ammo_box/magazine/lanca/qmr
	name = "Lanca rifle magazine (hunter)"
	desc = "A modified magazine for special anti-fauna bullet casings, doesnt made to fit standart one's"
	ammo_type = /obj/item/ammo_casing/strilka310/qmhunter
	caliber = CALIBER_HUNTER_STRILKA310
	max_ammo = 9

/obj/item/ammo_box/magazine/lanca/qmr/empty
	start_empty = TRUE

/obj/structure/closet/secure_closet/quartermaster/PopulateContents()
	new /obj/item/storage/lockbox/medal/cargo(src)
	new /obj/item/radio/weather_monitor (src)
	new /obj/item/radio/headset/heads/qm(src)
	new /obj/item/megaphone/cargo(src)
	new /obj/item/tank/internals/emergency_oxygen(src)
	new /obj/item/universal_scanner(src)
	new /obj/item/door_remote/quartermaster(src)
	new /obj/item/circuitboard/machine/techfab/department/cargo(src)
	new /obj/item/storage/photo_album/qm(src)
	new /obj/item/circuitboard/machine/ore_silo(src)
	new /obj/item/storage/bag/garment/quartermaster(src)
	new /obj/item/gun/ballistic/rifle/sporterized/qmr(src) // The QM's 'special' head item. It spawns loaded, but you have to find more ammo if you run out!
	new /obj/item/cargo_teleporter(src) // Adds a cargo teleporter to QM locker, so they can entice others to research it
	new /obj/item/clothing/glasses/hud/gun_permit/sunglasses(src)
