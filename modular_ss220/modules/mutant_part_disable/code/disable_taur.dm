//Disables taur
/datum/config_entry/flag/disable_taur
	default = FALSE

/datum/preference/toggle/taur/is_accessible(datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_taur))
		return FALSE
	. = ..()

/datum/preference/choiced/taur/is_accessible(datum/preferences/preferences)
	if(CONFIG_GET(flag/disable_taur))
		return FALSE
	. = ..()
