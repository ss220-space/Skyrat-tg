/*----- Template for ruins, prevents needing to re-type the filepath prefix -----*/
/datum/map_template/ruin/lavaland/nova
	prefix = "_maps/RandomRuins/LavaRuins/nova/"
/*------*/

/datum/map_template/ruin/lavaland/ash_walker
	name = "Lava-Ruin Ash Walker Nest"
	id = "ash-walker"
	description = "A race of unbreathing lizards live here, that run faster than a human can, worship a broken dead city, and are capable of reproducing by something involving tentacles? \
	Probably best to stay clear."
	prefix = "_maps/RandomRuins/LavaRuins/nova/"
	suffix = "lavaland_surface_ash_walker1.dmm"
	cost = 1000
	allow_duplicates = FALSE

/datum/map_template/ruin/lavaland/nova/interdyne_base
	name = "Lava-Ruin Interdyne Pharmaceutics Nova Sector Base 3c76928"
	id = "lava-base"
	description = "A planetside Interdyne research facility developing biological weapons; it is closely guarded by an elite team of agents."
	prefix = "_maps/RandomRuins/LavaRuins/nova/"
	suffix = "lavaland_surface_interdyne_base1.dmm"
	allow_duplicates = FALSE
	never_spawn_with = list(/datum/map_template/ruin/icemoon/underground/nova/interdyne_base)
	always_place = TRUE

/datum/map_template/ruin/lavaland/arena
	name = "Lava-Ruin Grand Arena"
	id = "arena"
	description = "An ancient gladiatorial arena containing a deadly warrior within."
	prefix = "_maps/RandomRuins/LavaRuins/nova/"
	suffix = "lavaland_surface_arena.dmm"
	cost = 0
	always_place = TRUE //WOULD BE UNFAIR IF SOMETHING THAT IS ALWAYS PLACED HAD A COST...
	allow_duplicates = FALSE
