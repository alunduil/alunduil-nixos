#!/bin/sh

# 1. Check if in enabled window
# 2. Prepare SSH command
# 3. Local Snapshot list (dataset → (name, timestamp)) a.k.a. map_source
# 4. Remote volume with readonly list (name → readonly) a.k.a. remote_zfslist
# 5. Create remote volumes readonly (mkdir -p) if not on remote
# 6. Remote Snapshot list (dataset → (name, timestamp)) a.k.a. map_target strip remotefs_final and prepend localfs to match snaps locally
# 7. Find last common snapshot:
#    a) if found, sync all snapshots on local since common
#       i) if follow delete, delete all snaps on remote not listed on local
#    b) otherwise nuke and repave (None : ..)?
#    c) if dataset not on remote just pave new
# 8. Remove datasets on the remote that aren't local


HOST=groton.alunduil.com
PORT=22
SSH_IDENTITY_FILE=/home/alunduil/.ssh/id_rsa
USER=alunduil

REMOTEFS=volume-11f20cf1-b1b1-4d83-a356-56212ce80221/backups/alunduil/laptop
LOCALFS=elijah-boot
REMOTEFS_FINAL=${REMOTEFS}

sshcmd="ssh
	-i ${SSH_IDENTITY_FILE}
	-o BatchMode=yes
	-o StrictHostKeyChecking=yes
	-o ConnectTimeout=7
	-l ${USER}
	-p ${PORT}
	${HOST}
	"

zfscmd="zfs
	list
	-H
	-t snapshot
	-p
	-o name,creation
	-r
	\"elijah-boot\"
	"

rzfscmd="zfs
	list
	-H
	-o name,readonly
	-t filesystem,volume
	-r
	\"${REMOTEFS}\"
	"

rzfscmd="zfs
	create
	-o readonly=on
	"
