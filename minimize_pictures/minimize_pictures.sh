#!/bin/bash
#
# Minimizes pictures with help of ImageMagick
# Package ImageMagick has to be installed first

readonly SIZE=1024x1024
readonly SEARCH_FOLDER="/SEARCH_FOLDER/"

output_folder=${SEARCH_FOLDER}/small
count=$(find ${SEARCH_FOLDER}/* -prune -iname '*.jpg' | wc -l)
files=$(find ${SEARCH_FOLDER}/* -prune -iname '*.jpg' -printf "%f\n")
current=0

mkdir -p ${output_folder}

for file in ${files}; do
  current=$[${current}+1]
  orig_file=${SEARCH_FOLDER}/${file}
  rel=$(echo - | awk -v v1="${current}" -v v2="${count}" '{ print int(v1/v2*100)}')
  echo [processing] "${current}/${count}" \("${rel}"%\) "${file}"
  convert "${orig_file}" -sample ${SIZE} -auto-orient "${output_folder}/${file}"
done
echo [finished]
