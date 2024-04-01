/obj/machinery/door/airlock/external/glass/emp_proof
	name = "emp proof airlock"

/obj/machinery/door/airlock/external/glass/emp_proof/Initialize(mapload, ...)
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_ALL)

/obj/machinery/power/apc/auto_name/emp_proof
	name = "emp proof apc"

/obj/machinery/power/apc/auto_name/emp_proof/Initialize(mapload, ndir)
	. = ..()
	AddElement(/datum/element/empprotection, EMP_PROTECT_ALL)

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/power/apc/auto_name/emp_proof, APC_PIXEL_OFFSET)
