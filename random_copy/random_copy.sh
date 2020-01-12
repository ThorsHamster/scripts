#!/bin/bash
#
# Copies randomly mp3 files from "SOURCE" to "DESTINATION"

readonly SOURCE="/SOURCE/"
readonly DESTINATION="/DESTINATION/"
readonly FOLDERNAME="RandomMusik"
readonly MAXSONGS=3
readonly MAXFOLDERS=1

if [ ! -d ${SOURCE} ]; then
  echo "SOURCE not found!"
  exit 1
fi

if [ ! -d ${DESTINATION} ]; then
  echo "DESTINATION not found!"
  exit 1
fi

find ${SOURCE} -type f -iname '*.mp3' | shuf |
  for ((M=0; M<MAXFOLDERS; M++)); do
    mkdir ${DESTINATION}${FOLDERNAME}$M
      for ((N=0; N<MAXSONGS; N++)); do
        read -r line || break;
        mv -f "${line}" "${DESTINATION}${FOLDERNAME}$M"
        echo $N of ${MAXSONGS}
      done
  done
