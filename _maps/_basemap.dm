//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic-noerp\CentCom_skyrat.dmm" //SKYRAT EDIT ADDITION - SMMS

#include "map_files\generic-noerp\CentCom_skyrat_z2.dmm" //SKYRAT EDIT ADDITION - SMMS

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Mining\Lavaland.dmm"
		#include "map_files\debug\runtimestation.dmm"
		#include "map_files\debug\multiz.dmm"
		#include "map_files\Deltastation-noerp\DeltaStation2.dmm"
		#include "map_files\KiloStation-noerp\KiloStation.dmm"
		#include "map_files\MetaStation-noerp\MetaStation.dmm"
		#include "map_files\IceBoxStation-noerp\IceBoxStation.dmm"
		#include "map_files\IceBoxStation-noerp\IcemoonUnderground_Below.dmm"
		#include "map_files\tramstation\tramstation.dmm"
		// SKYRAT EDIT ADDITON START - Compiling our modular maps too!
		#include "map_files\Deltastation-noerp\DeltaStation2_skyrat.dmm"
		#include "map_files\KiloStation-noerp\KiloStation_skyrat.dmm"
		#include "map_files\MetaStation-noerp\MetaStation_skyrat.dmm"
		#include "map_files\IceBoxStation-noerp\IceBoxStation_skyrat.dmm"
		#include "map_files\tramstation\tramstation_skyrat-noerp.dmm"
		#include "map_files\Blueshift-noerp\BlueShift_upper.dmm"
		#include "map_files\Blueshift-noerp\BlueShift_middle.dmm"
		#include "map_files\Blueshift-noerp\BlueShift_lower.dmm"
		#include "map_files\NSSJourney-noerp\NSSJourney.dmm"
		#include "map_files\tramstation\tramstation_skyrat-noerp.dmm"
		// The mining maps
		#include "map_files\Mining\Icemoon.dmm"
		#include "map_files\Mining\Rockplanet.dmm"
		#include "map_files\Mining\TidalLock.dmm"
		// SKYRAT EDIT END

		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
