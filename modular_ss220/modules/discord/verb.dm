/client/verify_in_discord()
	set hidden = TRUE

/client/verb/link_discord_account()
	set name = "Привязка Discord"
	set category = "Special Verbs"
	set desc = "Привязать аккаунт Discord для удобного просмотра игровой статистики на нашем Discord-сервере."

	if(!CONFIG_GET(string/discord_link))
		return

	if(IsGuestKey(key))
		to_chat(usr, "Гостевой аккаунт не может быть связан.")
		return

	load_player_discord()

	if(discord_id && length(discord_id) < 32)
		to_chat(usr, "<span class='darkmblue'>Аккаунт Discord уже привязан! Чтобы отвязать используйте команду <span class='boldannounce'>!отвязать_аккаунт</span> в канале <b>#дом-бота<b> в Discord-сообществе!</span>")
		return

	var/token = md5("[world.time+rand(1000,1000000)]")

	var/datum/db_query/query_update_token = SSdbcore.NewQuery("UPDATE [CONFIG_GET(string/utility_database)].[format_table_name("player")] SET discord_id=:token WHERE ckey=:ckey", list("token" = token, "ckey" = ckey))
	if(!query_update_token.warn_execute())
		to_chat(usr, "<span class='warning'>Ошибка записи токена в БД! Обратитесь к администрации.</span>")
		qdel(query_update_token)
		return
	qdel(query_update_token)
	to_chat(usr, "<span class='darkmblue'>Для завершения используйте команду <span class='boldannounce'>!привязать_аккаунт [token]</span> в канале <b>#дом-бота</b> в Discord-сообществе!</span>")
	load_player_discord(usr)
