#!/bin/bash
echo "Making backup of $HOME at /mnt/jeff/backup/$HOSTNAME/snapshot_$(date +%F).tar.gz"
tar --exclude-backups --exclude-caches --exclude="/home/andrew/.var/*" --exclude="/home/andrew/.local/*" --exclude-vcs-ignores -cf - $HOME | pigz --best > "/mnt/jeff/backup/$HOSTNAME/snapshot_$(date +%F).tar.gz"
