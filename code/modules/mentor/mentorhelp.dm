/// Client var used for tracking the ticket the (usually) not-mentor client is dealing with
/client/var/datum/mentor_help/current_mentor_ticket

GLOBAL_DATUM_INIT(mhelp_tickets, /datum/mentor_help_tickets, new)

/**
 * # Mentorhelp Ticket Manager
 */
/datum/mentor_help_tickets
	/// The set of all active tickets
	var/list/active_tickets = list()
	/// The set of all resolved tickets
	var/list/resolved_tickets = list()

	var/obj/effect/statclick/mentor_ticket_list/astatclick = new(null, null, MHELP_ACTIVE)
	var/obj/effect/statclick/mentor_ticket_list/rstatclick = new(null, null, MHELP_RESOLVED)

/datum/mentor_help_tickets/Destroy()
	QDEL_LIST(active_tickets)
	QDEL_LIST(resolved_tickets)
	QDEL_NULL(astatclick)
	QDEL_NULL(rstatclick)
	return ..()

/datum/mentor_help_tickets/proc/TicketByID(id)
	var/list/lists = list(active_tickets, resolved_tickets)
	for(var/I in lists)
		for(var/J in I)
			var/datum/mentor_help/MH = J
			if(MH.id == id)
				return J

/datum/mentor_help_tickets/proc/TicketsByCKey(ckey)
	. = list()
	var/list/lists = list(active_tickets, resolved_tickets)
	for(var/I in lists)
		for(var/J in I)
			var/datum/mentor_help/MH = J
			if(MH.initiator_ckey == ckey)
				. += MH

//private
/datum/mentor_help_tickets/proc/ListInsert(datum/mentor_help/new_ticket)
	var/list/ticket_list
	switch(new_ticket.state)
		if(MHELP_ACTIVE)
			ticket_list = active_tickets
		if(MHELP_RESOLVED)
			ticket_list = resolved_tickets
		else
			CRASH("Invalid ticket state: [new_ticket.state]")
	var/num_closed = ticket_list.len
	if(num_closed)
		for(var/I in 1 to num_closed)
			var/datum/mentor_help/MH = ticket_list[I]
			if(MH.id > new_ticket.id)
				ticket_list.Insert(I, new_ticket)
				return
	ticket_list += new_ticket

//opens the ticket listings for one of the 3 states
/datum/mentor_help_tickets/proc/BrowseTickets(state)
	var/list/l2b
	var/title
	switch(state)
		if(MHELP_ACTIVE)
			l2b = active_tickets
			title = "Active Tickets"
		if(MHELP_RESOLVED)
			l2b = resolved_tickets
			title = "Resolved Tickets"
	if(!l2b)
		return
	var/list/dat = list("<html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>[title]</title></head>")
	dat += "<A href='?_src_=holder;[HrefToken()];mhelp_tickets=[state]'>Refresh</A><br><br>"
	for(var/I in l2b)
		var/datum/mentor_help/MH = I
		dat += "[span_mentornotice("[span_mentor("M Ticket #[MH.id]")]: <A href='?_src_=holder;[HrefToken()];mhelp=[REF(MH)];mhelp_action=ticket'>[MH.initiator_key_name]: [MH.name]</A>")]<br>"

	usr << browse(dat.Join(), "window=mhelp_list[state];size=600x480")

//Mentor Tickets statpanel
/datum/mentor_help_tickets/proc/stat_entry()
	SHOULD_CALL_PARENT(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	var/list/L = list()
	var/num_disconnected = 0
	L[++L.len] = list("Active Tickets:", "[astatclick.update("[active_tickets.len]")]", null, REF(astatclick))
	astatclick.update("[active_tickets.len]")
	for(var/I in active_tickets)
		var/datum/mentor_help/MH = I
		if(MH.initiator)
			var/obj/effect/statclick/updated = MH.statclick.update()
			L[++L.len] = list("[MH.handler ? "H-[MH.handler]" : ""]#[MH.id]. [MH.initiator_key_name]:", "[updated.name]", REF(MH))
		else
			++num_disconnected
	if(num_disconnected)
		L[++L.len] = list("Disconnected:", "[astatclick.update("[num_disconnected]")]", null, REF(astatclick))
	L[++L.len] = list("Resolved Tickets:", "[rstatclick.update("[resolved_tickets.len]")]", null, REF(rstatclick))
	return L

//Reassociate still open ticket if one exists
/datum/mentor_help_tickets/proc/ClientLogin(client/C)
	C.current_mentor_ticket = CKey2ActiveTicket(C.ckey)
	if(C.current_mentor_ticket)
		C.current_mentor_ticket.initiator = C
		C.current_mentor_ticket.AddInteraction("Client reconnected.")

//Dissasociate ticket
/datum/mentor_help_tickets/proc/ClientLogout(client/C)
	if(C.current_mentor_ticket)
		var/datum/mentor_help/T = C.current_mentor_ticket
		T.AddInteraction("Client disconnected.")
		T.initiator = null

//Get a ticket given a ckey
/datum/mentor_help_tickets/proc/CKey2ActiveTicket(ckey)
	for(var/I in active_tickets)
		var/datum/mentor_help/MH = I
		if(MH.initiator_ckey == ckey)
			return MH

//
//TICKET LIST STATCLICK
//

/obj/effect/statclick/mentor_ticket_list
	var/current_state

/obj/effect/statclick/mentor_ticket_list/Initialize(mapload, name, state)
	. = ..()
	current_state = state

/obj/effect/statclick/mentor_ticket_list/Click()
	if (!usr.client?.holder)
		message_admins("[key_name_admin(usr)] non-holder clicked on a ticket list statclick! ([src])")
		usr.log_message("non-holder clicked on a ticket list statclick! ([src])", LOG_ADMIN)
		return

	GLOB.mhelp_tickets.BrowseTickets(current_state)

//called by mentor topic
/obj/effect/statclick/mentor_ticket_list/proc/Action()
	Click()

/**
 * # Modified Adminhelp to mentorhelp Ticket
 */
/datum/mentor_help
	/// Unique ID of the ticket
	var/id
	/// The current name of the ticket
	var/name
	/// The current state of the ticket
	var/state = MHELP_ACTIVE
	/// The time at which the ticket was opened
	var/opened_at
	/// The time at which the ticket was closed
	var/closed_at
	/// Semi-misnomer, it's the person who mhelped/was bwoinked
	var/client/initiator
	/// The ckey of the initiator
	var/initiator_ckey
	/// The key name of the initiator
	var/initiator_key_name
	/// If any mentors were online when the ticket was initialized
	var/heard_by_no_mentors = FALSE
	/// The collection of interactions with this ticket. Use AddInteraction() or, preferably, admin_ticket_log()
	var/list/ticket_interactions
	/// Statclick holder for the ticket
	var/obj/effect/statclick/mhelp/statclick
	/// Static counter used for generating each ticket ID
	var/static/ticket_counter = 0
	/// The list of clients currently responding to the opening ticket before it gets a response
	var/list/opening_responders
	/// List of player interactions
	var/list/player_interactions
	/// List of mentor ckeys that are involved, like through responding
	var/list/mentors_involved = list()
	/// Has the player replied to this ticket yet?
	var/player_replied = FALSE
	/// Who is handling this mentor help?
	var/handler
	/// All sanitized text
	var/full_text


/**
 * Call this on its own to create a ticket, don't manually assign current_mentor_ticket
 *
 * Arguments:
 * * msg_raw - The first message of this mentor_help: used for the initial title of the ticket
 */
/datum/mentor_help/New(msg_raw, client/C)
	//clean the input msg
	var/msg = sanitize(copytext_char(msg_raw, 1, MAX_MESSAGE_LEN))
	if(!msg || !C || !C.mob)
		qdel(src)
		return

	id = ++ticket_counter
	opened_at = world.time

	name = copytext_char(msg, 1, 100)

	full_text = msg //SKYRAT EDIT ADDITION - Mentorhelps into mentorhelps converting.

	initiator = C
	initiator_ckey = initiator.ckey
	initiator_key_name = key_name(initiator, FALSE, TRUE)
	if(initiator.current_mentor_ticket) //This is a bug
		stack_trace("Multiple mhelp current_mentor_tickets")
		initiator.current_mentor_ticket.AddInteraction("M Ticket erroneously left open by code")
		initiator.current_mentor_ticket.Resolve()
	initiator.current_mentor_ticket = src

	statclick = new(null, src)
	ticket_interactions = list()
	player_interactions = list()

	MessageNoRecipient(msg_raw)
	GLOB.mhelp_tickets.active_tickets += src

/datum/mentor_help/Destroy()
	RemoveActive()
	GLOB.mhelp_tickets.resolved_tickets -= src
	return ..()

/datum/mentor_help/proc/AddInteraction(formatted_message, player_message)
	if (!isnull(usr) && usr.ckey != initiator_ckey)
		mentors_involved |= usr.ckey
		if(heard_by_no_mentors)
			heard_by_no_mentors = FALSE
			// send2adminchat(initiator_ckey, "Ticket #[id]: Answered by [key_name(usr)]") ДИСКОРД

	ticket_interactions += "[time_stamp()]: [formatted_message]"
	if (!isnull(player_message))
		player_interactions += "[time_stamp()]: [player_message]"

//private
/datum/mentor_help/proc/MentorMonty(ref_src)
	if(!ref_src)
		ref_src = "[REF(src)]"
	. = ADMIN_MENTORMONTY(initiator.mob)
	. += ClosureLinks(ref_src)

//private
/datum/mentor_help/proc/ClosureLinks(ref_src)
	if(!ref_src)
		ref_src = "[REF(src)]"
	. += " (<A HREF='?_src_=holder;[HrefToken(forceGlobal = TRUE)];mhelp=[ref_src];mhelp_action=resolve'>RSLVE</A>)"

//private
/datum/mentor_help/proc/LinkedReplyName(ref_src)
	if(!ref_src)
		ref_src = "[REF(src)]"
	return "<A HREF='?_src_=holder;[HrefToken(forceGlobal = TRUE)];mhelp=[ref_src];mhelp_action=reply'>[initiator_key_name]</A>"

//private
/datum/mentor_help/proc/TicketHref(msg, ref_src, action = "ticket")
	if(!ref_src)
		ref_src = "[REF(src)]"
	return "<A HREF='?_src_=holder;[HrefToken(forceGlobal = TRUE)];mhelp=[ref_src];mhelp_action=[action]'>[msg]</A>"

//message from the initiator without a target, all mentors will see this
//won't bug irc/discord
/datum/mentor_help/proc/MessageNoRecipient(msg)
	msg = sanitize(copytext_char(msg, 1, MAX_MESSAGE_LEN))
	var/ref_src = "[REF(src)]"
	//Message to be sent to all admins
	// var/mentor_msg = span_adminnotice(span_adminhelp("M Ticket [TicketHref("#[id]", ref_src)]</span><b>: [LinkedReplyName(ref_src)] [MentorMonty(ref_src)]:</b> [span_linkify(msg)]"))

	AddInteraction("<font color='red'>[LinkedReplyName(ref_src)]: [msg]</font>", player_message = "<font color='red'>[LinkedReplyName(ref_src)]: [msg]</font>")
	log_admin_private("M Ticket #[id]: [key_name(initiator)]: [msg]")

	//send this msg to all mentors
	var/list/mentors = get_admin_counts(R_MENTOR)
	for(var/client/X in mentors)
		if(X.prefs.toggles & SOUND_ADMINHELP)
			SEND_SOUND(X, 'sound/items/bikehorn.ogg')
		window_flash(X, ignorepref = TRUE)
		to_chat(X, msg, confidential = TRUE)

	//show it to the person mentorhelping too
	reply_to_mentors_notification(msg)

/// Sends a message to the player that they are replying to admins.
/datum/mentor_help/proc/reply_to_mentors_notification(message)
	to_chat(initiator, span_notice("PM to-<b>Mentors</b>: [span_linkify(message)]"), confidential = TRUE)
	player_replied = TRUE

//Reopen a closed ticket
/datum/mentor_help/proc/Reopen()
	if(state == MHELP_ACTIVE)
		to_chat(usr, span_warning("This ticket is already open."), confidential = TRUE)
		return

	if(GLOB.mhelp_tickets.CKey2ActiveTicket(initiator_ckey))
		to_chat(usr, span_warning("This user already has an active ticket, cannot reopen this one."), confidential = TRUE)
		return

	statclick = new(null, src)
	GLOB.mhelp_tickets.active_tickets += src
	GLOB.mhelp_tickets.resolved_tickets -= src
	state = MHELP_ACTIVE
	closed_at = null
	if(initiator)
		initiator.current_mentor_ticket = src

	AddInteraction("<font color='purple'>Reopened by [key_name(usr)]</font>", player_message = "Ticket reopened!")
	var/msg = span_adminhelp("M Ticket [TicketHref("#[id]")] reopened by [key_name(usr)].")
	to_mentors(msg)
	log_admin_private(msg)
	TicketPanel() //can only be done from here, so refresh it

//private
/datum/mentor_help/proc/RemoveActive()
	if(state != MHELP_ACTIVE)
		return
	closed_at = world.time
	QDEL_NULL(statclick)
	GLOB.mhelp_tickets.active_tickets -= src
	if(initiator && initiator.current_mentor_ticket == src)
		initiator.current_mentor_ticket = null

	SEND_SIGNAL(src, COMSIG_MENTOR_HELP_MADE_INACTIVE)

//Mark open ticket as resolved/legitimate
/datum/mentor_help/proc/Resolve(key_name = key_name(usr), silent = FALSE)
	if(state != MHELP_ACTIVE)
		return

	if(handler && handler != usr.ckey)
		var/response = tgui_alert(usr, "This ticket is already being handled by [handler]. Do you want to continue?", "Ticket already assigned", list("Yes", "No"))
		if(!response || response == "No")
			return

	RemoveActive()
	state = MHELP_RESOLVED
	GLOB.mhelp_tickets.ListInsert(src)

	AddInteraction("<font color='green'>Resolved by [key_name].</font>", player_message = "<font color='green'>Ticket resolved!</font>")
	to_chat(initiator, span_adminhelp("Your ticket has been resolved by a mentor."), confidential = TRUE)
	if(!silent)
		var/msg = "M Ticket [TicketHref("#[id]")] resolved by [key_name]"
		to_mentors(msg)
		log_admin_private(msg)

//Show the ticket panel
/datum/mentor_help/proc/TicketPanel()
	var/list/dat = list("<html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>Ticket #[id]</title></head>")
	var/ref_src = "[REF(src)]"
	dat += "<h4>Mentor Help Ticket #[id]: [LinkedReplyName(ref_src)]</h4>"
	dat += "<b>State: [ticket_status()]</b>"
	dat += "[FOURSPACES][TicketHref("Refresh", ref_src)][FOURSPACES][TicketHref("Re-Title", ref_src, "retitle")]"
	if(state != MHELP_ACTIVE)
		dat += "[FOURSPACES][TicketHref("Reopen", ref_src, "reopen")]"
	dat += "<br><br>Opened at: [gameTimestamp(wtime = opened_at)] (Approx [DisplayTimeText(world.time - opened_at)] ago)"
	if(closed_at)
		dat += "<br>Closed at: [gameTimestamp(wtime = closed_at)] (Approx [DisplayTimeText(world.time - closed_at)] ago)"
	dat += "<br><br>"
	if(initiator)
		dat += "[MentorMonty(ref_src)]<br>"
	else
		dat += "<b>DISCONNECTED</b>[FOURSPACES][ClosureLinks(ref_src)]<br>"
	dat += "<br><b>Log:</b><br><br>"
	for(var/I in ticket_interactions)
		dat += "[I]<br>"

	// Append any tickets also opened by this user if relevant
	var/list/related_tickets = GLOB.mhelp_tickets.TicketsByCKey(initiator_ckey)
	if (related_tickets.len > 1)
		dat += "<br/><b>Other Tickets by User</b><br/>"
		for (var/datum/mentor_help/related_ticket in related_tickets)
			if (related_ticket.id == id)
				continue
			dat += "[related_ticket.TicketHref("#[related_ticket.id]")] ([related_ticket.ticket_status()]): [related_ticket.name]<br/>"

	usr << browse(dat.Join(), "window=mhelp[id];size=750x480")

/**
 * Renders the current status of the ticket into a displayable string
 */
/datum/mentor_help/proc/ticket_status()
	switch(state)
		if(MHELP_ACTIVE)
			return "<font color='red'>OPEN</font>"
		if(MHELP_RESOLVED)
			return "<font color='green'>RESOLVED</font>"
		else
			stack_trace("Invalid ticket state: [state]")
			return "INVALID, CALL A CODER"

/datum/mentor_help/proc/Retitle()
	var/new_title = input(usr, "Enter a title for the ticket", "Rename Ticket", name) as text|null
	if(new_title)
		name = new_title
		//not saying the original name cause it could be a long ass message
		var/msg = "M Ticket [TicketHref("#[id]")] titled [name] by [key_name(usr)]"
		to_mentors(msg)
		log_admin_private(msg)
	TicketPanel() //we have to be here to do this

//Forwarded action from Mentor/Topic
/datum/mentor_help/proc/Action(action)
	testing("Mhelp action: [action]")
	switch(action)
		if("ticket")
			TicketPanel()
		if("retitle")
			Retitle()
		if("resolve")
			Resolve()
		if("reopen")
			Reopen()
		// SKYRAT EDIT ADDITION
		if("handle_issue")
			handle_issue()
		if("convert")
			convert_to_adminhelp()
		// SKYRAT EDIT ADDITION END

/datum/mentor_help/proc/player_ticket_panel()
	var/list/dat = list("<html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title>Player Ticket</title></head>")
	dat += "<b>State: "
	switch(state)
		if(MHELP_ACTIVE)
			dat += "<font color='red'>OPEN</font></b>"
		if(MHELP_RESOLVED)
			dat += "<font color='green'>RESOLVED</font></b>"
		else
			dat += "UNKNOWN</b>"
	dat += "\n[FOURSPACES]<A href='?_src_=holder;[HrefToken(forceGlobal = TRUE)];player_ticket_panel=1'>Refresh</A>"
	dat += "<br><br>Opened at: [gameTimestamp("hh:mm:ss", opened_at)] (Approx [DisplayTimeText(world.time - opened_at)] ago)"
	if(closed_at)
		dat += "<br>Closed at: [gameTimestamp("hh:mm:ss", closed_at)] (Approx [DisplayTimeText(world.time - closed_at)] ago)"
	dat += "<br><br>"
	dat += "<br><b>Log:</b><br><br>"
	for (var/interaction in player_interactions)
		dat += "[interaction]<br>"

	var/datum/browser/player_panel = new(usr, "mhelp[id]", 0, 620, 480)
	player_panel.set_content(dat.Join())
	player_panel.open()

//Let the initiator know their mhelp is being handled
/datum/mentor_help/proc/handle_issue(key_name = key_name(usr))
	if(state != MHELP_ACTIVE)
		return FALSE

	if(handler && handler == usr.ckey) // No need to handle it twice as the same person ;)
		return TRUE

	if(handler && handler != usr.ckey)
		var/response = tgui_alert(usr, "This ticket is already being handled by [handler]. Do you want to continue?", "Ticket already assigned", list("Yes", "No"))
		if(!response || response == "No")
			return FALSE

	var/msg = span_adminhelp("Your ticket is now being handled by [usr?.client?.holder?.fakekey ? usr?.client?.holder?.fakekey : usr?.client]! Please wait while they type their response and/or gather relevant information.")

	if(initiator)
		to_chat(initiator, msg)

	msg = "M Ticket [TicketHref("#[id]")] is being handled by [key_name]"
	to_mentors(msg)
	log_admin_private(msg)
	AddInteraction("Being handled by [key_name]", "Being handled by [key_name(usr, FALSE)]")

	handler = "[usr.ckey]"
	return TRUE

///Proc which converts an admin_help ticket to a mentorhelp
/datum/mentor_help/proc/convert_to_adminhelp(key_name = key_name(usr))
	if(state != MHELP_ACTIVE)
		return FALSE

	if(handler && handler != usr.ckey)
		var/response = tgui_alert(usr, "This ticket is already being handled by [handler]. Do you want to continue?", "Ticket already assigned", list("Yes", "No"))
		if(!response || response == "No")
			return FALSE

	to_chat(initiator, span_adminhelp("Your ticket was converted to Adminhelp"))
	initiator.adminhelp(full_text)
	initiator.giveadminhelpverb()

	to_mentors("[key_name] converted M Ticket #[id] from [initiator_key_name] into Adminhelp")
	log_admin("[usr.client] converted M Ticket #[id] from [initiator_ckey] into Adminhelp")

	Resolve(key_name, TRUE)


//
// TICKET STATCLICK
//

/obj/effect/statclick/mhelp
	var/datum/mentor_help/mhelp_datum

/obj/effect/statclick/mhelp/Initialize(mapload, datum/mentor_help/MH)
	mhelp_datum = MH
	. = ..()

/obj/effect/statclick/mhelp/update()
	return ..(mhelp_datum.name)

/obj/effect/statclick/mhelp/Click()
	if (!usr.client?.holder)
		message_admins("[key_name_admin(usr)] non-holder clicked on an mhelp statclick! ([src])")
		usr.log_message("non-holder clicked on an mhelp statclick! ([src])", LOG_ADMIN)
		return

	mhelp_datum.TicketPanel()

/obj/effect/statclick/mhelp/Destroy()
	mhelp_datum = null
	return ..()

//
// CLIENT PROCS
//

GLOBAL_DATUM_INIT(mentor_help_ui_handler, /datum/mentor_help_ui_handler, new)

/datum/mentor_help_ui_handler
	var/list/mhelp_cooldowns = list()

/datum/mentor_help_ui_handler/ui_state(mob/user)
	return GLOB.always_state

/datum/mentor_help_ui_handler/ui_data(mob/user)
	. = list()
	var/list/mentors = get_admin_counts(R_MENTOR)
	.["mentorCount"] = length(mentors["present"])

/datum/mentor_help_ui_handler/ui_static_data(mob/user)
	. = list()

/datum/mentor_help_ui_handler/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Mentorhelp")
		ui.open()
		ui.set_autoupdate(FALSE)

/datum/mentor_help_ui_handler/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	var/client/user_client = usr.client
	var/message = sanitize_text(trim(params["message"]))

	perform_mentorhelp(user_client, message)
	ui.close()

/datum/mentor_help_ui_handler/proc/perform_mentorhelp(client/user_client, message)
	if(GLOB.say_disabled) //This is here to try to identify lag problems
		to_chat(usr, span_danger("Speech is currently mentor-disabled."), confidential = TRUE)
		return

	if(!message)
		return

	//handle muting and automuting
	if(user_client.prefs.muted & MUTE_ADMINHELP)
		to_chat(user_client, span_danger("Error: Mentor-PM: You cannot send mentorhelps (Muted Adminhelp)."), confidential = TRUE)
		return
	if(user_client.handle_spam_prevention(message, MUTE_ADMINHELP))
		return

	if(user_client.current_ticket)
		user_client.current_ticket.MessageNoRecipient(message)
		return

	new /datum/mentor_help(message, user_client, FALSE, null)

/client/verb/no_tgui_mentorhelp(message as message)
	set name = "NoTguiMentorhelp"
	set hidden = TRUE

	message = trim(message)

	GLOB.mentor_help_ui_handler.perform_mentorhelp(src, message, FALSE)

/client/verb/mentorhelp()
	set category = "Mentor"
	set name = "Mentorhelp"
	GLOB.mentor_help_ui_handler.ui_interact(mob)
	to_chat(src, span_boldnotice("Mentorhelp failing to open or work? <a href='?src=[REF(src)];tguiless_mentorhelp=1'>Click here</a>"))

//It should be in mentorsay.dm but it doesn't allow me. Sorry
/proc/to_mentors(msg)
	var/list/mentors = get_admin_counts(R_MENTOR)
	to_chat(mentors["total"], msg)
