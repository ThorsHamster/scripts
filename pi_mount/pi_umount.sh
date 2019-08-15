#!/bin/bash
#
# Unmounts Raspberry Pi's samba share.

readonly MOUNT_FOLDER="/MOUNT_FOLDER/"

sudo umount ${MOUNT_FOLDER}
