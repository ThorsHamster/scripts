#!/bin/bash
#
# converts all umlaute in filenames to normal ascii

readonly CONVERT_PATH="/CONVERT_PATH/"

find ${CONVERT_PATH}/. -depth -name "*" \
  -execdir rename \
  's/Ä/Ae/g;s/Ö/Oe/g;s/Ü/Ue/g;s/ä/ae/g;s/ö/oe/g;s/ü/ue/g;s/ß/ss/g;' "{}" \;
