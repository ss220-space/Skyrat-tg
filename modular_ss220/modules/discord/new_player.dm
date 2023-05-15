/mob/dead/new_player/Topic(href, href_list[])
	if(src != usr)
		return

	if(!client)
		return

	if(client.interviewee)
		return FALSE

	if(CONFIG_GET(string/discord_link))
		if(href_list["observe"] || href_list["toggle_ready"] || href_list["late_join"])
			if(!client.discord_id || (client.discord_id && length(client.discord_id) == 32))
				client.load_player_discord(client)
				to_chat(usr, "<span class='danger'>Вам необходимо привязать дискорд-профиль к аккаунту!</span>")
				to_chat(usr, "<span class='warning'>Нажмите 'Привязка Discord' во вкладке 'Special Verbs' для получения инструкций.</span>")
				return FALSE

	..()
