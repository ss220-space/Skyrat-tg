/datum/supply_pack/security/armory/mcr01adv
	name = "MCR-01 advanced Microfusion Crate"
	desc = "Micron Control Systems Incorporated supplied MCR-01 Microfusion weapons platform. Comes with 4 advanced guns!"
	cost = CARGO_CRATE_VALUE * 20
	contains = list(
		/obj/item/gun/microfusion/mcr01/advanced,
		/obj/item/gun/microfusion/mcr01/advanced,
		/obj/item/gun/microfusion/mcr01/advanced,
		/obj/item/gun/microfusion/mcr01/advanced,
	)
	crate_name = "MCR-01 Microfusion Crate"

/datum/supply_pack/goody/mcr01basic
	name = "MCR-01 Microfusion Single-Pack"
	desc = "Micron Control Systems Incorporated supplied MCR-01 Microfusion weapons platform. Comes with 1 basic gun!"
	cost = CARGO_CRATE_VALUE * 6
	access_view = ACCESS_WEAPONS
	contains = list(
		/obj/item/gun/microfusion/mcr01,
	)

/datum/supply_pack/goody/mcr01surplus
	name = "MCR-01 Microfusion? Single-Pack"
	desc = "Micron Contral Sistems Incarparated supplies MCR-001 Microfysion weapons platform. Comes with 1 Er#*or# gun!"
	cost = CARGO_CRATE_VALUE * 4
	contraband = TRUE
	contains = list(
		/obj/item/gun/microfusion/mcr01/surplus,
	)


/datum/supply_pack/security/microadvanced
	name = "Assorted Microfusion Advanced Upgrade Crate"
	desc = "Micron Control Systems Incorporated supplied Microfusion cells and emitters!"
	cost = CARGO_CRATE_VALUE * 5
	contains = list(
		/obj/item/microfusion_phase_emitter/advanced,
		/obj/item/microfusion_phase_emitter/advanced,
		/obj/item/stock_parts/power_store/cell/microfusion/advanced,
		/obj/item/stock_parts/power_store/cell/microfusion/advanced,
	)
	crate_name = "Microfusion Upgrade Crate (Advanced)"

/datum/supply_pack/security/microbluespace
	name = "Assorted Microfusion Bluespace Upgrade Crate"
	desc = "Micron Control Systems Incorporated supplied Microfusion cells and emitters!"
	cost = CARGO_CRATE_VALUE * 30
	contains = list(
		/obj/item/microfusion_phase_emitter/bluespace,
		/obj/item/microfusion_phase_emitter/bluespace,
		/obj/item/stock_parts/power_store/cell/microfusion/bluespace,
		/obj/item/stock_parts/power_store/cell/microfusion/bluespace,
	)
	crate_name = "Microfusion Upgrade Crate (Bluespace)"

/datum/supply_pack/security/mcr01_attachments_a
	name = "MCR-01 Military Attachments Crate Type A"
	desc = "Micron Control Systems Incorporated supplied MCR-01 Military spec attachments! This crate comes with two utilitarian repeater loadout."
	cost = CARGO_CRATE_VALUE * 14
	contains = list(
		/obj/item/microfusion_gun_attachment/grip,
		/obj/item/microfusion_gun_attachment/grip,
		/obj/item/microfusion_gun_attachment/rail,
		/obj/item/microfusion_gun_attachment/rail,
		/obj/item/microfusion_gun_attachment/barrel/repeater,
		/obj/item/microfusion_gun_attachment/barrel/repeater,
	)
	crate_name = "MCR-01 Military Attachments Crate Type A"

/datum/supply_pack/security/mcr01_attachments_cell
	name = "MCR-01 Military Cell Attachments Crate"
	desc = "Micron Control Systems Incorporated supplied MCR-01 Military cell attachments! This crate comes with three overcapacity and stabiliser attachment."
	cost = CARGO_CRATE_VALUE * 20
	contains = list(
		/obj/item/microfusion_cell_attachment/overcapacity,
		/obj/item/microfusion_cell_attachment/overcapacity,
		/obj/item/microfusion_cell_attachment/overcapacity,
		/obj/item/microfusion_cell_attachment/stabiliser,
		/obj/item/microfusion_cell_attachment/stabiliser,
		/obj/item/microfusion_cell_attachment/stabiliser,
	)
	crate_name = "MCR-01 Military Cell Attachments Crate"

/datum/supply_pack/security/mcr01_attachments_protocell
	name = "MCR-01 Military Prototype Cell Attachment Crate"
	desc = "Micron Control Systems Incorporated supplied MCR-01 Prototype Military cell attachments! This crate comes with one prototype self charge attachment."
	cost = CARGO_CRATE_VALUE * 40
	contains = list(
		/obj/item/microfusion_cell_attachment/selfcharging,
	)
	crate_name = "MCR-01 Military Prototype Cell Attachments Crate"

/datum/supply_pack/security/mcr01_attachments_type_b
	name = "MCR-01 Military Attachments Crate Type B"
	desc = "Micron Control Systems Incorporated supplied MCR-01 Military spec attachments! This crate comes in a mixed specialist loadout."
	cost = CARGO_CRATE_VALUE * 16
	contains = list(
		/obj/item/microfusion_gun_attachment/grip,
		/obj/item/microfusion_gun_attachment/grip,
		/obj/item/microfusion_gun_attachment/grip,
		/obj/item/microfusion_gun_attachment/barrel/scatter,
		/obj/item/microfusion_gun_attachment/barrel/scatter,
		/obj/item/microfusion_gun_attachment/barrel/scatter,
		/obj/item/microfusion_gun_attachment/scope,
		/obj/item/microfusion_gun_attachment/barrel/lance,
	)
	crate_name = "MCR-01 Military Attachments Crate Type B"


/datum/supply_pack/security/mcr01_attachments_h
	name = "HCR-01 Military Attachments Crate Type H"
	desc = "Honkicron Clownery Systems Inhonkorated supplied HCR-01 Clownery spec attachments! This crate oddly smells of bananas."
	cost = CARGO_CRATE_VALUE * 20
	contraband = TRUE
	contains = list(
		/obj/item/microfusion_gun_attachment/barrel/honk,
		/obj/item/microfusion_gun_attachment/barrel/honk,
		/obj/item/microfusion_gun_attachment/barrel/honk,
		/obj/item/microfusion_gun_attachment/camo/honk,
		/obj/item/microfusion_gun_attachment/camo/honk,
		/obj/item/microfusion_gun_attachment/camo/honk,
		/obj/item/food/pie/cream,
		/obj/item/food/pie/cream,
		/obj/item/food/pie/cream,
	)
	crate_name = "MCR-01 Military Attachments Crate Type H"
