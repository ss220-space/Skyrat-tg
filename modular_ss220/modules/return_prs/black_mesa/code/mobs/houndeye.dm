/mob/living/simple_animal/hostile/blackmesa/xen/houndeye
	name = "houndeye"
	desc = "Some highly aggressive alien creature. Thrives in toxic environments."
	icon = 'modular_ss220/modules/return_prs/black_mesa/icons/mobs.dmi'
	icon_state = "houndeye"
	icon_living = "houndeye"
	icon_dead = "houndeye_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	speak_chance = 1
	speak_emote = list("growls")
	speed = 1
	emote_taunt = list("growls", "snarls", "grumbles")
	taunt_chance = 100
	turns_per_move = 7
	maxHealth = 100
	health = 100
	obj_damage = 50
	harm_intent_damage = 10
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_sound = 'sound/weapons/bite.ogg'
	gold_core_spawnable = HOSTILE_SPAWN
		atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	//Since those can survive on Xen, I'm pretty sure they can thrive on any atmosphere

	minbodytemp = 0
	maxbodytemp = 1500
	loot = list(/obj/item/stack/sheet/bluespace_crystal)
	alert_sounds = list(
		'modular_ss220/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert1.ogg',
		'modular_ss220/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert2.ogg',
		'modular_ss220/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert3.ogg',
		'modular_ss220/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert4.ogg',
		'modular_ss220/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert5.ogg'
	)
	/// Charging ability
	var/datum/action/cooldown/mob_cooldown/charge/basic_charge/charge

/mob/living/simple_animal/hostile/blackmesa/xen/houndeye/Initialize(mapload)
	. = ..()
	charge = new /datum/action/cooldown/mob_cooldown/charge/basic_charge()
	charge.Grant(src)

/mob/living/simple_animal/hostile/blackmesa/xen/houndeye/Destroy()
	QDEL_NULL(charge)
	return ..()

/mob/living/simple_animal/hostile/blackmesa/xen/houndeye/OpenFire()
	if(client)
		return
	charge.Trigger(target)
