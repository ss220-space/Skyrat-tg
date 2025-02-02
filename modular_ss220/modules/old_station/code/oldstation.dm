//  old trims overrides and new one's

/datum/id_trim/away/old/sci
	sechud_icon_state = SECHUD_OLD_SCI

/datum/id_trim/away/old/robo
	sechud_icon_state = SECHUD_ROBOTICIST

/datum/id_trim/away/old/equipment
	sechud_icon_state = SECHUD_STATION_ENGINEER

/datum/id_trim/away/old/eng
	sechud_icon_state = SECHUD_OLD_ENG

/datum/id_trim/away/old/sec
	sechud_icon_state = SECHUD_OLD_SEC
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_SEC, ACCESS_WEAPONS)

// new medic
/datum/id_trim/away/old/med
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MEDICAL)
	assignment = "Charlie Station Medic"
	sechud_icon_state = SECHUD_OLD_MED

// charlie captain's spare(cool id card with (probably)all necessary access
/datum/id_trim/away/old/captain
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINTENANCE, ACCESS_AWAY_SUPPLY, ACCESS_AWAY_MEDICAL, ACCESS_AWAY_SCIENCE, ACCESS_AWAY_ENGINEERING, ACCESS_AWAY_SEC, ACCESS_AWAY_COMMAND, ACCESS_ENGINEERING, ACCESS_ENGINE_EQUIP, ACCESS_CONSTRUCTION, ACCESS_ROBOTICS, ACCESS_ORDNANCE, ACCESS_RESEARCH, ACCESS_MEDICAL, ACCESS_SECURITY, ACCESS_COMMAND, ACCESS_WEAPONS)
	assignment = "Charlie Station Captain"
	sechud_icon_state = SECHUD_OLD_CAPTAIN
	big_pointer = TRUE

// id overrides

/obj/item/card/id/away/old
	name = "\proper a perfectly generic identification ID"
	desc = "A perfectly generic clip on ID Badge. Looks like it could use some flavor."
	icon= 'modular_ss220/modules/old_station/icons/card.dmi'
	icon_state = "retro"

/obj/item/card/id/away/old/sec
	name = "Charlie Station Security Officer's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. You can make out this one is encoded for the \"Security Dept\"."
	icon_state = "retro_sec"
	trim = /datum/id_trim/away/old/sec

/obj/item/card/id/away/old/sci
	name = "Charlie Station Scientist's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. You can make out this one is encoded for the \"Science Dept\"."
	icon_state = "retro_sci"
	trim = /datum/id_trim/away/old/sci

/obj/item/card/id/away/old/eng
	name = "Charlie Station Engineer's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. You can make out this one is encoded for the \"Engineering Dept\"."
	icon_state = "retro_eng"
	trim = /datum/id_trim/away/old/eng

/obj/item/card/id/away/old/equipment
	name = "Engineering Equipment Access"
	desc = "A special ID Badge that allows access to engineering equipment."
	trim = /datum/id_trim/away/old/equipment

/obj/item/card/id/away/old/robo
	name = "Delta Station Roboticist's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. You can make out this one is encoded for the \"Science Dept\". This one allows access to bots maintenance protocols."
	icon_state = "retro_sci"
	trim = /datum/id_trim/away/old/robo

//medic id
/obj/item/card/id/away/old/med
	name = "Charlie Station Medical ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. This one is encoded for the \"Medical Dept\"."
	icon_state = "retro_med"
	trim = /datum/id_trim/away/old/med

// captain space id(in safe)
/obj/item/card/id/away/old/captains_spare
	name = "Charlie Station Spare Captain's ID"
	desc = "A clip on ID Badge, has one of those fancy new magnetic strips built in. This one is encoded for the \"High Command Dept\"."
	icon_state = "retro_nt"
	trim = /datum/id_trim/away/old/captain

// communications computer
/obj/machinery/computer/communications/old
	name = "charlie station communications console"
	icon_screen = "comm_monitor"
	icon_keyboard = "med_key"
	light_color = LIGHT_COLOR_GREEN
	circuit = /obj/item/circuitboard/computer/communications/old
	away = TRUE
	can_call_911 = FALSE
	req_access = null
	req_one_access = list(ACCESS_AWAY_COMMAND, ACCESS_COMMAND)

/obj/item/circuitboard/computer/communications/old
	name = "Station Communications"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/computer/communications/old

/obj/machinery/computer/communications/old/can_buy_shuttles(mob/user)
	return FALSE

/obj/machinery/computer/communications/old/authenticated_as_silicon_or_captain(mob/user)
	return FALSE

/obj/machinery/computer/communications/old/can_send_messages_to_other_sectors(mob/user)
	return FALSE

// comps overrides
//this because ds2/blackmarket maybe can spawn in sector, and try to steal data
/obj/machinery/computer/rdservercontrol
	req_access = list()
	req_one_access = list(ACCESS_RD, ACCESS_AWAY_SCIENCE)

//this because apc control can be deconstucted relocated from eng to other place
/obj/machinery/computer/apc_control
	req_access = list()
	req_one_access = list(ACCESS_CE, ACCESS_AWAY_ENGINEERING)

/obj/machinery/computer/apc_control/away
	req_one_access = list()

// misc computers for decoration
/obj/machinery/computer/broken
	name = "broken computer"
	desc = "A computer long since rendered non-functional due to lack of maintenance. Spitting out error messages."
	circuit = /obj/item/circuitboard/computer/broken
	icon_screen = "generic"
	icon_keyboard = "generic_key"

/obj/item/circuitboard/computer/broken
	build_path = /obj/machinery/computer/broken

/obj/machinery/computer/broken/cryo
	name = "old cryogenic oversight console"
	desc = "An interface between crew and the cryogenic storage oversight systems. This one looks broken."
	icon = 'modular_nova/modules/cryosleep/icons/cryogenics.dmi'
	icon_state = "cellconsole_1"
	pixel_x = 32
	circuit = /obj/item/circuitboard/computer

/obj/machinery/computer/broken/acc
	icon_screen = "accounts"
	icon_keyboard = "id_key"

/obj/machinery/computer/broken/com
	icon_screen = "comm_monitor"
	icon_keyboard = "med_key"

/obj/machinery/computer/broken/comlog
	icon_screen = "comm_logs"
	icon_keyboard = "tech_key"

/obj/machinery/computer/broken/sec
	icon_screen = "security"
	icon_keyboard = "security_key"

/obj/machinery/computer/broken/eng
	icon_screen = "command"
	icon_keyboard = "power_key"

/obj/machinery/computer/broken/atm
	icon_screen = "alert:2"
	icon_keyboard = "atmos_key"

// suits
/obj/item/clothing/under/retro
	desc = "A generic retro jumpsuit."
	name = "generic retro uniform"
	icon = 'modular_ss220/modules/old_station/icons/suit.dmi'
	icon_state = "retro_sec"
	worn_icon = 'modular_ss220/modules/old_station/icons/suitworn.dmi'
	can_adjust = FALSE

/obj/item/clothing/under/retro/sec
	desc = "A (now) retro corporate security jumpsuit."
	name = "retro security officer's uniform"
	icon_state = "retro_sec"
	armor_type = /datum/armor/retro_sec

/obj/item/clothing/under/retro/eng
	desc = "A (now) retro engineering uniform and overall combo. It's coated with oil, dust, and grit."
	name = "retro engineering uniform"
	icon_state = "retro_eng"
	armor_type = /datum/armor/retro_eng

/obj/item/clothing/under/retro/sci
	desc = "A (now) retro faded polo and set of distinct white slacks. What a ridiculous tie."
	name = "retro scientist's uniform"
	icon_state = "retro_sci"
	armor_type = /datum/armor/retro_sci

/obj/item/clothing/under/retro/med
	desc = "A (now) retro medical uniform. The high-vis stripes are faded and unreflective."
	name = "retro doctor's uniform"
	icon_state = "retro_med"
	armor_type = /datum/armor/retro_med


//damaged captains armor
/obj/item/clothing/head/helmet/space/damaged_captain
	name = "damaged captain's space helmet"
	icon = 'modular_ss220/modules/old_station/icons/spacehelm.dmi'
	worn_icon = 'modular_ss220/modules/old_station/icons/spacehelmworn.dmi'
	lefthand_file = 'modular_ss220/modules/old_station/icons/spacehelm_l.dmi'
	righthand_file = 'modular_ss220/modules/old_station/icons/spacehelm_r.dmi'
	icon_state = "broken-cap"
	inhand_icon_state = "broken-cap"
	desc = "A whole once special helmet designed for only the most fashionable of military figureheads, now it's a piece of damaged junk, and no longer provides what it used to."
	flags_inv = HIDEEARS| HIDEEYES
	clothing_flags = SNUG_FIT | STACKABLE_HELMET_EXEMPT
	cold_protection = 0
	min_cold_protection_temperature = 0
	heat_protection = 0
	slowdown = 0
	max_heat_protection_temperature = 0
	flags_cover = 0
	flash_protect = FLASH_PROTECTION_WELDER
	tint = 2
	armor_type = /datum/armor/damaged_captain_space

/obj/item/clothing/suit/space/damaged_captain
	name = "damaged captain's space suit"
	desc = "A old, bulky, heavy-duty piece of exclusive Nanotrasen armor. But... this suit not in charge anymore."
	icon = 'modular_ss220/modules/old_station/icons/spacesuit.dmi'
	worn_icon = 'modular_ss220/modules/old_station/icons/spacesuitworn.dmi'
	lefthand_file = 'modular_ss220/modules/old_station/icons/spacesuit_l.dmi'
	righthand_file = 'modular_ss220/modules/old_station/icons/spacesuit_r.dmi'
	icon_state = "broken-cap"
	inhand_icon_state = "broken-cap"
	armor_type = /datum/armor/damaged_captain_space
	flags_inv = null
	clothing_flags = 0
	slowdown = 4
	cell = null
	cold_protection = 0
	min_cold_protection_temperature = null
	heat_protection = 0
	max_heat_protection_temperature = null
	allowed = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/tank/jetpack/oxygen/captain,
		/obj/item/flashlight,
		/obj/item/gun/energy,
		/obj/item/gun/ballistic,
		/obj/item/melee/baton,
		/obj/item/restraints/handcuffs,
		)

// emergency captain suit(in safe, doesnt provide too much slowdown)
/obj/item/clothing/head/helmet/space/nasavoid/captain
	name = "Fancy Retro Void Helmet"
	desc = "A old but high tech, NASA Centcom branch designed space suit helmet. Used for emergency situations. This one is tagged - \"emergency captain's space helmet\"."
	icon = 'modular_ss220/modules/old_station/icons/spacehelm.dmi'
	worn_icon = 'modular_ss220/modules/old_station/icons/spacehelmworn.dmi'
	icon_state = "void-cap"
	lefthand_file = 'modular_ss220/modules/old_station/icons/spacehelm_l.dmi'
	righthand_file = 'modular_ss220/modules/old_station/icons/spacehelm_r.dmi'
	inhand_icon_state = "void-cap"
	slowdown = 0

/obj/item/clothing/suit/space/nasavoid/captain
	name = "Fancy NASA Void Suit"
	desc = "A old but high tech, NASA Centcom branch designed space suit. Used for emergency situations. This one is tagged - \"emergency captain's space suit\". This one made from wear-resistant materials, despite its old appearance, it has not degraded."
	icon = 'modular_ss220/modules/old_station/icons/spacesuit.dmi'
	worn_icon = 'modular_ss220/modules/old_station/icons/spacesuitworn.dmi'
	icon_state = "void-cap"
	lefthand_file = 'modular_ss220/modules/old_station/icons/spacesuit_l.dmi'
	righthand_file = 'modular_ss220/modules/old_station/icons/spacesuit_r.dmi'
	inhand_icon_state = "void-cap"
	slowdown = 1

// outfit override
/datum/outfit/oldsec
	name = "Ancient Security"
	id = /obj/item/card/id/away/old/sec
	uniform = /obj/item/clothing/under/retro/sec
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/assembly/flash/handheld
	r_pocket = /obj/item/restraints/handcuffs

/datum/outfit/oldeng
	name = "Ancient Engineer"
	id = /obj/item/card/id/away/old/eng
	uniform = /obj/item/clothing/under/retro/eng
	gloves = /obj/item/clothing/gloves/color/fyellow/old
	shoes = /obj/item/clothing/shoes/workboots
	l_pocket = /obj/item/tank/internals/emergency_oxygen

/datum/outfit/oldsci
	name = "Ancient Scientist"
	id = /obj/item/card/id/away/old/sci
	uniform = /obj/item/clothing/under/retro/sci
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/stack/medical/bruise_pack

//medic outfit
/datum/outfit/oldmed
	name = "Ancient Medic"
	id = /obj/item/card/id/away/old/med
	uniform = /obj/item/clothing/under/retro/med
	gloves = /obj/item/clothing/gloves/latex
	shoes = /obj/item/clothing/shoes/sneakers/white
	l_pocket = /obj/item/stack/medical/ointment
	r_pocket = /obj/item/stack/medical/bruise_pack


//post equip code
/datum/outfit/oldsec/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldeng/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldsci/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

/datum/outfit/oldmed/post_equip(mob/living/carbon/human/nt, visualsOnly = FALSE)
	var/obj/item/card/id/id_card = nt.wear_id
	if(istype(id_card))
		id_card.registered_name = nt.real_name
		id_card.update_label()
		id_card.update_icon()

	return ..()

//medic spawner

/obj/effect/mob_spawn/ghost_role/human/oldmed
	name = "old cryogenics pod"
	desc = "A humming cryo pod. You can barely recognise an medical uniform underneath the built up ice. The machine is attempting to wake up its occupant."
	prompt_name = "a medical doctor"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	mob_species = /datum/species/human
	you_are_text = "You are a medical doctor working for Nanotrasen, stationed onboard a state of the art research station."
	flavour_text = "You vaguely recall rushing into a cryogenics pod due to an oncoming radiation storm. The last thing \
	you remember is the station's Artificial Program telling you that you would only be asleep for eight hours. As you open \
	your eyes, everything seems rusted and broken, a dark feeling swells in your gut as you climb out of your pod."
	important_text = "Work as a team with your fellow survivors and do not abandon them."
	outfit = /datum/outfit/oldmed
	spawner_job_path = /datum/job/ancient_crew

/obj/effect/mob_spawn/ghost_role/human/oldmed/Destroy()
	new/obj/structure/showcase/machinery/oldpod/used(drop_location())
	return ..()

// medic closet(for beta station)

/obj/structure/closet/secure_closet/old_med
	name = "medical closet"
	desc = "Filled with medical junk."
	icon_state = "med"
	req_access = list(ACCESS_AWAY_MEDICAL)

/obj/structure/closet/secure_closet/old_med/PopulateContents()
	..()
	new /obj/item/clothing/head/utility/surgerycap(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/clothing/mask/breath/medical(src)
	new /obj/item/reagent_containers/hypospray/medipen/atropine(src)
	new /obj/item/clothing/head/bio_hood/general(src)
	new /obj/item/clothing/suit/bio_suit/general(src)
	new /obj/item/clothing/suit/toggle/labcoat/medical(src)
	new /obj/item/storage/box/masks(src)
