/obj/effect/decal/cleanable/crayon
	icon = 'modular_ss220/modules/spraycan_letters_ru/crayondecal.dmi'

#define PAINT_NORMAL 1
#define PAINT_LARGE_HORIZONTAL 2
#define PAINT_LARGE_HORIZONTAL_ICON 'icons/effects/96x32.dmi'

/obj/item/toy/crayon/ui_act(action, list/params)
	switch(action)
		if("toggle_cap")
			if(has_cap)
				is_capped = !is_capped
				. = TRUE
		if("select_stencil")
			var/stencil = params["item"]
			if(stencil in all_drawables + randoms)
				drawtype = stencil
				. = TRUE
				text_buffer = ""
			if(stencil in graffiti_large_h)
				paint_mode = PAINT_LARGE_HORIZONTAL
				text_buffer = ""
			else
				paint_mode = PAINT_NORMAL
		if("custom_color")
			. = can_change_colour && pick_painting_tool_color(usr, paint_color)
		if("color")
			if(!can_change_colour)
				return
			paint_color = GLOB.pipe_paint_colors[params["paint_color"]]
			set_painting_tool_color(paint_color)
			. = TRUE
		if("enter_text")
			var/txt = tgui_input_text(usr, "Choose what to write", "Scribbles", text_buffer)
			if(isnull(txt))
				return
			txt = crayon_text_strip_ru(text)
			if(text_buffer == txt)
				return // No valid changes.
			text_buffer = txt

			. = TRUE
			paint_mode = PAINT_NORMAL
			drawtype = "a"
	update_appearance()

/obj/item/toy/crayon/proc/crayon_text_strip_ru(text)
	text = copytext(text, 1, MAX_MESSAGE_LEN)
	var/static/regex/crayon_regex_ru = new /regex(@"[^А-ЯA-Z0-9!?,.=&%#+/\-]", "ig")
	return LOWER_TEXT(crayon_regex_ru.Replace(text, ""))

#undef PAINT_NORMAL
#undef PAINT_LARGE_HORIZONTAL
#undef PAINT_LARGE_HORIZONTAL_ICON