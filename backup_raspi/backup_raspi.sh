#!/bin/bash
#
# Backups raspberry pi home folder. Ready raspi passwort from passwd.txt

 # set your values here
readonly RASPI_IP="127.0.0.1"
readonly RASPI_PORT="22"
readonly RASPI_USER="pi"
readonly RASPI_BACKUP_FOLDER="/home/"${RASPI_USER}/
readonly RASPI_PASSWD_FILE="passwd.txt"
readonly BACKUP_FOLDER_NAME="PI_Backup_""$(date +"%d-%m-%Y-%H-%M")"

mkdir "${BACKUP_FOLDER_NAME}"

sshpass -f "./${RASPI_PASSWD_FILE}" rsync -avr -e 'ssh -p '${RASPI_PORT} \
  --include ".ssh" \
  --exclude ".*/" ${RASPI_USER}@${RASPI_IP}:${RASPI_BACKUP_FOLDER} \
  ./"${BACKUP_FOLDER_NAME}"
