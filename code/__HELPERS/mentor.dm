/client/proc/is_mentor() // admins are mentors too.
	if(check_rights_for(src, R_MENTOR))
		return TRUE
