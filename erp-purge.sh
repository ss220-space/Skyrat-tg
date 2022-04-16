#!/bin/bash
# Removes objects specified in erp-objects.txt from all .dmm files

set -e

SCRIPT=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT")

cd $SCRIPT_DIR

OBJECTS=$(< erp-objects.txt)

for OBJ in $OBJECTS
do
	#find . -type f -path "*.dmm" -print0 | xargs -0 grep -P -z -o -i "$OBJ.*,\n"
	#find . -type f -path "*.dmm" -print0 | xargs -0 grep -P -z -o -i "$OBJ.*{(.|\n)+?\},\n"
	find . -type f -path "*.dmm" -exec sed -z -i -r "s#$OBJ.?,\n##g" {} \;
	find . -type f -path "*.dmm" -exec sed -z -i -r "s#$OBJ.?\{([^}]|\n)+?\},\n##g" {} \;
done
