#define NRI_POWERUSE_HIT 100
#define NRI_POWERUSE_HEAL 150

#define NRI_COOLDOWN_HEAL (10 SECONDS)
#define NRI_COOLDOWN_RADS (20 SECONDS)
#define NRI_COOLDOWN_ACID (20 SECONDS)

#define NRI_HEAL_AMOUNT 10
#define NRI_BLOOD_REPLENISHMENT 20

/obj/item/clothing/suit/space/hev_suit/nri
	name = "\improper VOSKHOD powered combat armor"
	desc = "A hybrid set of space-resistant armor built on a modified mass-produced Nomex-Aerogel flight suit, polyurea coated durathread-lined light plasteel plates hinder mobility as little as possible while the onboard life support system aids the user in combat. The power cell is what makes the armor work without hassle, a sticker in the power supply unit warns anyone reading to responsibly manage battery levels."
	icon = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/icons/hevsuiteq.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/icons/hevsuit.dmi'
	worn_icon_digi = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/icons/hevsuit_digi.dmi'
	worn_icon_teshari = 'modular_ss220/modules/return_prs/novaya_ert/icons/tesha.dmi'
	icon_state = "nri_soldier"
	armor_type = /datum/armor/hev_suit_nri
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDESEXTOY|HIDETAIL
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/energy/sword, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	cell = /obj/item/stock_parts/power_store/cell/bluespace
	actions_types = list(/datum/action/item_action/hev_toggle/nri, /datum/action/item_action/hev_toggle_notifs/nri, /datum/action/item_action/toggle_spacesuit)
	resistance_flags = FIRE_PROOF|UNACIDABLE|ACID_PROOF|FREEZE_PROOF
	clothing_flags = STOPSPRESSUREDAMAGE|SNUG_FIT
	clothing_traits = list(TRAIT_BRAWLING_KNOCKDOWN_BLOCKED)

	activation_song = null //No nice song.
	radio_key = /obj/item/encryptionkey/headset_cent
	radio_channel = RADIO_CHANNEL_CENTCOM

	armor_unpowered = /datum/armor/hev_suit_nri
	armor_powered = /datum/armor/hev_suit_nri/powered
	heal_amount = NRI_HEAL_AMOUNT
	blood_replenishment = NRI_BLOOD_REPLENISHMENT
	health_static_cooldown = NRI_COOLDOWN_HEAL
	rads_static_cooldown = NRI_COOLDOWN_RADS
	acid_static_cooldown = NRI_COOLDOWN_ACID
	suit_name = "VOSKHOD"
	first_use = FALSE //No nice song.

	logon_sound = null
	armor_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/02_powerarmor_on.ogg'
	atmospherics_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/03_atmospherics_on.ogg'
	vitalsigns_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/04_vitalsigns_on.ogg'
	automedic_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/05_automedic_on.ogg'
	weaponselect_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/06_weaponselect_on.ogg'
	munitions_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/07_munitionview_on.ogg'
	communications_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/08_communications_on.ogg'
	safe_day_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/09_safe_day.ogg'

	batt_50_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/power_level_is_fifty.ogg'
	batt_40_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/power_level_is_fourty.ogg'
	batt_30_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/power_level_is_thirty.ogg'
	batt_20_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/power_level_is_twenty.ogg'
	batt_10_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/power_level_is_ten.ogg'

	near_death_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/near_death.ogg'
	health_critical_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/health_critical.ogg'
	health_dropping_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/health_dropping2.ogg'

	blood_loss_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/blood_loss.ogg'
	blood_toxins_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/blood_toxins.ogg'
	biohazard_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/biohazard_detected.ogg'
	chemical_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/chemical_detected.ogg'
	radiation_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/radiation_detected.ogg'

	minor_fracture_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/minor_fracture.ogg'
	major_fracture_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/major_fracture.ogg'
	minor_lacerations_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/minor_lacerations.ogg'
	major_lacerations_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/major_lacerations.ogg'

	morphine_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/morphine_shot.ogg'
	wound_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/wound_sterilized.ogg'
	antitoxin_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/antitoxin_shot.ogg'
	antidote_sound = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/sound/pcv/antidote_shot.ogg'



/datum/armor/hev_suit_nri
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 25
	bio = 25
	fire = 30
	acid = 30
	wound = 30
	consume = 10

/datum/armor/hev_suit_nri/powered
	melee = 40
	bullet = 50
	laser = 30
	energy = 40
	bomb = 60
	bio = 75
	fire = 50
	acid = 50
	wound = 50
	consume = 40

/obj/item/clothing/head/helmet/space/hev_suit/nri
	name = "\improper VOSKHOD powered combat armor helmet"
	desc = "A composite graphene-plasteel helmet with a ballistic nylon inner padding, complete with a deployable airtight polycarbonate visor and respirator system. 'НРИ - Оборонная Коллегия' is imprinted on the back."
	icon = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/icons/helmeq.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/icons/helmet.dmi'
	worn_icon_muzzled = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/icons/helmet_m.dmi'
	worn_icon_teshari = 'modular_ss220/modules/return_prs/black_mesa/hev_suit/icons/helmet_m.dmi'
	icon_state = "nri_soldier"
	armor_type = /datum/armor/hev_suit_nri
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	obj_flags = null
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION
	resistance_flags = FIRE_PROOF|UNACIDABLE|ACID_PROOF|FREEZE_PROOF
	clothing_flags = STOPSPRESSUREDAMAGE|SNUG_FIT|BLOCK_GAS_SMOKE_EFFECT|HEADINTERNALS
	clothing_traits = list(TRAIT_HEAD_INJURY_BLOCKED)
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	flash_protect = FLASH_PROTECTION_WELDER
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags = STOPSPRESSUREDAMAGE
	slowdown = 0
	has_flashlight = FALSE

/obj/item/clothing/head/helmet/space/hev_suit/nri/captain
	name = "\improper VOSKHOD-2 powered combat armor helmet"
	desc = "A black composite polyurea coated graphene-plastitanium helmet with durathread inner padding, complete with a deployable airtight tinted plasmaglass visor and a kevlar-lined respirator system. 'НРИ - Оборонная Коллегия' is imprinted on the back."
	icon_state = "nri_captain"

/obj/item/clothing/head/helmet/space/hev_suit/nri/medic
	name = "\improper VOSKHOD-KH powered combat armor helmet"
	desc = "A combat medic's composite graphene-titanium helmet with bio-resistant padding, complete with a deployable airtight polycarbonate visor and optimized respirator system. 'НРИ - Оборонная Коллегия' is imprinted on the back."
	icon_state = "nri_medic"

/obj/item/clothing/head/helmet/space/hev_suit/nri/engineer
	name = "\improper VOSKHOD-IN powered combat armor helmet"
	desc = "A composite tungsten-plasteel helmet with a lead-lined ballistic nylon inner padding, complete with a deployable airtight polycarbonate visor and respirator system. 'НРИ - Оборонная Коллегия' is imprinted on the back."
	icon_state = "nri_engineer"

/datum/action/item_action/hev_toggle/nri
	name = "Toggle VOSKHOD Suit"
	button_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/toggles.dmi'
	button_icon_state = "system_off"

/datum/action/item_action/hev_toggle_notifs/nri
	name = "Toggle VOSKHOD Suit Notifications"
	button_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/toggles.dmi'
	button_icon_state = "sound_VOICE_AND_TEXT"

/obj/item/clothing/suit/space/hev_suit/nri/captain
	name = "\improper VOSKHOD-2 powered combat armor"
	desc = "A unique hybrid set of space-resistant armor made for high-ranking NRI operatives, built on a proprietary durathread padded, Akulan made Larr'Takh silk utility uniform. Polyurea coated hexagraphene-lined plastitanium plates hinder mobility as little as possible while the onboard life support system aids the user in combat. The power cell is what makes the armor work without hassle, a sticker in the power supply unit warns anyone reading to responsibly manage battery levels."
	icon_state = "nri_captain"

/obj/item/clothing/suit/space/hev_suit/nri/medic
	name = "\improper VOSKHOD-KH powered combat armor"
	desc = "A hybrid set of space-resistant armor built on a modified mass-produced Dipolyester-Aerogel surgeon field jumpsuit, polyurea coated titanium plates hinder mobility as little as possible while the onboard life support system aids the user in combat and provides additional medical functions. The power cell is what makes the armor work without hassle, a sticker in the power supply unit warns anyone reading to responsibly manage battery levels."
	icon_state = "nri_medic"

/obj/item/clothing/suit/space/hev_suit/nri/engineer
	name = "\improper VOSKHOD-IN powered combat armor"
	desc = "A hybrid set of space-resistant armor built on a modified Nanotrasen heavy-duty engineering undersuit, polyurea coated lead-lined light plasteel plates hinder mobility as little as possible and offer additional radiation protection while the onboard life support system aids the user in combat. The power cell is what makes the armor work without hassle, a sticker in the power supply unit warns anyone reading to responsibly manage battery levels."
	icon_state = "nri_engineer"

#undef NRI_POWERUSE_HIT
#undef NRI_POWERUSE_HEAL
#undef NRI_COOLDOWN_HEAL
#undef NRI_COOLDOWN_RADS
#undef NRI_COOLDOWN_ACID
#undef NRI_HEAL_AMOUNT
#undef NRI_BLOOD_REPLENISHMENT
