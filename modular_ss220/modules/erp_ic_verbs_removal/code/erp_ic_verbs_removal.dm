/mob/living/carbon/human/New(loc, ...)
	. = ..()
	if(CONFIG_GET(flag/disable_erp_preferences))
		src.verbs -= /mob/living/carbon/human/verb/arousal_panel
		src.verbs -= /mob/living/carbon/human/verb/toggle_arousal
		src.verbs -= /mob/living/carbon/human/verb/toggle_genitals
