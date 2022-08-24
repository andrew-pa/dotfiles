#!/bin/bash
echo "Making backup of $HOME at /mnt/jeff/backup/$HOSTNAME/snapshot_$(date +%F).tar.gz"
dnf repoquery --userinstalled > /home/andrew/installed-packages
tar --exclude-backups --exclude-caches --exclude="/home/andrew/.cache/*" --exclude="/home/andrew/.var/*" --exclude="/home/andrew/.local/*" --exclude-vcs-ignores -cf - $HOME | pigz --best > "/mnt/jeff/backup/$HOSTNAME/snapshot_$(date +%F).tar.gz"
