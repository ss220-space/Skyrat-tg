//CRATES

/obj/structure/closet/crate/secure/weapon/ww2
	name = "ww2 weapons crate"
	desc = "A secure weapons crate. Looks like it's from the old-era world war 2."
	icon_state = "weaponcrate"

/obj/structure/closet/crate/secure/weapon/ww2/PopulateContents()
	. = ..()
	new /obj/item/gun/ballistic/automatic/fg42(src)
	new /obj/item/ammo_box/magazine/fg42(src)
	new /obj/item/gun/ballistic/automatic/akm(src)
	new /obj/item/ammo_box/magazine/akm(src)
	new /obj/item/gun/ballistic/automatic/m16(src)
	new /obj/item/ammo_box/magazine/m16/vintage(src)
	new /obj/item/gun/ballistic/automatic/mg34(src)
	new /obj/item/ammo_box/magazine/mg34(src)
	new /obj/item/gun/ballistic/automatic/mp40(src)
	new /obj/item/ammo_box/magazine/mp40(src)
	new /obj/item/gun/ballistic/automatic/stg(src)
	new /obj/item/ammo_box/magazine/stg(src)
	new /obj/item/gun/ballistic/automatic/ppsh(src)
	new /obj/item/ammo_box/magazine/ppsh(src)
	new /obj/item/gun/ballistic/automatic/pps(src)
	new /obj/item/ammo_box/magazine/pps(src)
	new /obj/item/gun/ballistic/automatic/mg34/mg42(src)
	new /obj/item/ammo_box/magazine/mg42(src)
	new /obj/item/gun/ballistic/automatic/pistol/luger(src)
	new /obj/item/ammo_box/magazine/m9mm(src)
