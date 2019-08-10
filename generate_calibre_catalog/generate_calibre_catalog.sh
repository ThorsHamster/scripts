#!/bin/bash
#
# Generates ebook catalog out of calibre.

readonly CALIBRE_OUTPUT_FILE=ebooks.csv # has to end on .csv or .xml
readonly OUTPUT_FILE=ebooks.txt

# start calibre for generating catalog
calibredb catalog ${CALIBRE_OUTPUT_FILE} --fields "authors, title"
# sort in alphabetically order
sort ${CALIBRE_OUTPUT_FILE} > ${OUTPUT_FILE}
rm ${CALIBRE_OUTPUT_FILE}
# remove "
sed -i -e 's/"//g' ${OUTPUT_FILE}
