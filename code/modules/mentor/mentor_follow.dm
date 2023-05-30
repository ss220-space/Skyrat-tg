/client/proc/mentor_follow(mob/living/M)
	if(!check_rights_for(src, R_MENTOR))
		return
	var/orbiting = TRUE
	if(!isobserver(usr))
		holder.following = M
		usr.reset_perspective(M)
		add_verb(src,/client/proc/mentor_unfollow)
		to_chat(usr, span_info("Click the <a href='?_src_=mentor;mentor_unfollow=1;[HrefToken(TRUE)]'>\"Stop Following\"</a> button here or in the Mentor tab to stop following [key_name(M)]."))
		orbiting = FALSE
	else
		var/mob/dead/observer/O = usr
		O.ManualFollow(M)
	to_chat(GLOB.admins, span_mentor(span_prefix("MENTOR:</span> <EM>[key_name(usr)]</EM> is now [orbiting ? "orbiting" : "following"] <EM>[key_name(M)][key_name(M)][orbiting ? " as a ghost" : ""].")))
	log_admin_private("[key_name(usr)] [orbiting ? "is now orbiting" : "began following"][key_name(M)][orbiting ? " as a ghost" : ""].")

/client/proc/mentor_unfollow()
	set category = "Mentor"
	set name = "Stop Following"
	set desc = "Stop following the followed."

	if(!check_rights_for(src, R_MENTOR))
		return
	usr.reset_perspective()
	remove_verb(src,/client/proc/mentor_unfollow)
	to_chat(GLOB.admins, span_prefix("MENTOR:</span> <EM>[key_name(usr)]</EM> is no longer following <EM>[key_name(holder.following)]."))
	log_admin_private("[key_name(usr)] stopped following [key_name(holder.following)].")
	holder.following = null
