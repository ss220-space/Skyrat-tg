/**
 * The CMG-2.
 *
 * It sure does exist. Comes with a projectile damage malus for some sense of parity with the old 9mm Peacekeeper round.
 * Supposed to fill the niche of being a sidearm, apparently? But it's a longarm, but it also fires 9mm and has a damage malus
 * (slightly buffed from the usual 9mm PK -> 9x25mm + 0.5x damage multiplier).
 */

/obj/item/gun/ballistic/automatic/cmg
	name = "\improper NT CMG-2 PDW"
	desc = "A bullpup, two-round burst PDW chambered in 9x25mm, developed by Nanotrasen R&D and based on a licensed Scarborough Arms design. \
	It features a folding stock and comes pre-attached with a dot sight. Unfortunately, the recoil management system reduces the \
	stopping power of individual rounds, but the manufacturer insists that quirk can be mitigated by not missing."
	icon_state = "cmg1"
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/guns.dmi'
	inhand_icon_state = "c20r"
	selector_switch_icon = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/multi_sprite/cmg
	fire_delay = 2
	burst_size = 2
	actions_types = list()
	pin = /obj/item/firing_pin/implant/mindshield
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE
	w_class = WEIGHT_CLASS_BULKY
	projectile_damage_multiplier = 0.5
	// raw outputs:
	// lethal: 30 * 0.5 = 15
	// AP: 27 * 0.5 = 13.5
	// HP: 40 * 0.5  = 20
	// INC: 15 * 0.5 = 7.5
	// rubber: 5 * 0.5 = 2.5 brute, 25 * 0.5 = 12.5 stam
	// IHDF: 30 * 0.5 = 15 stam

	/// what sound do we play when finished adjusting the stock?
	var/folding_sound = 'sound/weapons/batonextend.ogg'
	/// is our stock collapsed?
	var/folded = FALSE
	/// how long does it take to extend/collapse the stock
	var/toggle_time = 1 SECONDS
	/// what's our spread with our extended stock (mild varedit compatibility I Guess)?
	var/unfolded_spread = 0
	/// what's our spread with a folded stock (see above comment)?
	var/folded_spread = 20

/obj/item/gun/ballistic/automatic/cmg/examine(mob/user)
	. = ..()
	. += span_notice("<b>Ctrl-click</b> to [folded ? "extend" : "collapse"] the stock.")

/obj/item/gun/ballistic/automatic/cmg/click_ctrl(mob/user)
	if(!user.is_holding(src))
		return
	elif(item_flags & IN_STORAGE)
		return
	toggle_stock(user)

/obj/item/gun/ballistic/automatic/cmg/proc/toggle_stock(mob/user, var/forced)
	if(!user && forced) // for the possible case of having every shipped CMG be pre-folded
		folded = !folded
		update_fold_stats()
		return
	balloon_alert(user, "[folded ? "extending" : "collapsing"] stock...")
	if(!do_after(user, toggle_time))
		balloon_alert(user, "interrupted!")
		return
	folded = !folded
	update_fold_stats()
	balloon_alert(user, "stock [folded ? "collapsed" : "extended"]")
	playsound(src.loc, folding_sound, 30, 1)

/obj/item/gun/ballistic/automatic/cmg/proc/update_fold_stats()
	if(folded)
		spread = folded_spread
		if(suppressed)
			w_class = WEIGHT_CLASS_BULKY
		else
			w_class = WEIGHT_CLASS_NORMAL
	else
		spread = unfolded_spread
		if(suppressed)
			w_class = WEIGHT_CLASS_HUGE
		else
			w_class = WEIGHT_CLASS_BULKY
	update_icon()

/obj/item/gun/ballistic/automatic/cmg/update_overlays()
	. = ..()
	. += "[icon_state]-stock[folded ? "_in" : "_out"]"

/obj/item/gun/ballistic/automatic/cmg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.4 SECONDS)

/obj/item/gun/ballistic/automatic/cmg/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 24, \
		overlay_y = 10)

/obj/item/gun/ballistic/automatic/cmg/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_NANOTRASEN)

/obj/item/gun/ballistic/automatic/cmg/add_bayonet_point()
	AddComponent(/datum/component/bayonet_attachable, offset_x = 26, offset_y = 10)

/obj/item/ammo_box/magazine/multi_sprite/cmg
	name = "9x25mm lethal PDW magazine"
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/mags.dmi'
	icon_state = "g11_lethal"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 24
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/multi_sprite/cmg/empty
	name = "9x25mm PDW magazine"
	icon_state = "g11"
	start_empty = 1

/obj/item/ammo_box/magazine/multi_sprite/cmg/hp
	name = "9x25mm hollow-point PDW magazine"
	icon_state = "g11_hollowpoint"
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/multi_sprite/cmg/ap
	name = "9x25mm armor-piercing PDW magazine"
	icon_state = "g11_ap"
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/multi_sprite/cmg/fire
	name = "9x25mm incendiary PDW magazine"
	icon_state = "g11_incendiary"
	ammo_type = /obj/item/ammo_casing/c9mm/fire

/obj/item/ammo_box/magazine/multi_sprite/cmg/ihdf
	name = "9x25mm IHDF PDW magazine"
	icon_state = "g11_ihdf"
	ammo_type = /obj/item/ammo_casing/c9mm/ihdf

/obj/item/ammo_box/magazine/multi_sprite/cmg/rubber
	name = "9x25mm rubber PDW magazine"
	icon_state = "g11_rubber"
	ammo_type = /obj/item/ammo_casing/c9mm/rubber

/obj/item/gun/ballistic/automatic/cmg/nomag
	spawnwithmagazine = FALSE

/obj/item/suppressor/nanotrasen
	name = "NT-S suppressor"
	desc = "A Nanotrasen brand small-arms suppressor, including a large NT logo stamped on the side."

/obj/item/storage/toolbox/guncase/nova/blueshield_cmg
	name = "Blueshield's CMG-2 guncase"

/obj/item/storage/toolbox/guncase/nova/blueshield_cmg/PopulateContents()
	new /obj/item/gun/ballistic/automatic/cmg/nomag(src)
	new /obj/item/ammo_box/magazine/multi_sprite/cmg/rubber(src)
	new /obj/item/ammo_box/magazine/multi_sprite/cmg/rubber(src)
	new /obj/item/ammo_box/magazine/multi_sprite/cmg(src)
	new /obj/item/ammo_box/magazine/multi_sprite/cmg(src)
	new /obj/item/suppressor/nanotrasen(src)


