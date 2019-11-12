#!/bin/bash
#
# Searches for duplicated files in folder and subfolder

readonly SEARCH_PATH="/SEARCH_PATH/"

readonly TEMP_FILE=myTempfileName
find ${SEARCH_PATH} -type f  > ${TEMP_FILE}
< ${TEMP_FILE} sed 's_.*/__' | sort | uniq -d |
while read file_name; do
  grep "${file_name}" ${TEMP_FILE}
done
rm -f ${TEMP_FILE}
