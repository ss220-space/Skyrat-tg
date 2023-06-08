/mob/living/carbon
	var/is_logout = FALSE

/mob/living/carbon/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	. = ..()
	if(is_logout && stat != DEAD && job && CONFIG_GET(number/auto_cryo_ssd_min) && world.time - lastclienttime > CONFIG_GET(number/auto_cryo_ssd_min) MINUTES)
		if(istype(loc, /obj/machinery/cryopod))
			return
		var/turf/T = get_turf(src)
		if(!is_station_level(T.z))
			return
		send_to_cryo()

/mob/living/carbon/Logout()
	. = ..()
	if(mind.active)
		is_logout = TRUE

/mob/living/carbon/Login()
	. = ..()
	is_logout = FALSE
