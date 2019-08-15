#!/bin/bash
#
# Mounts Raspberry Pi's samba share.

readonly RASPI_IP="127.0.0.1"
readonly RASPI_USER="pi"
readonly MOUNT_FOLDER="/MOUNT_FOLDER/"

sudo mount -t cifs //${RASPI_IP}/${RASPI_USER} ${MOUNT_FOLDER} \
  -o user=${RASPI_USER},uid=$(id -u),gid=$(id -g)
