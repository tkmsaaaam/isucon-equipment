#!/bin/bash
echo "------cpu------"
cat /proc/cpuinfo
echo "------meminfo------"
cat /proc/meminfo
echo "------free------"
free -h
echo "------services------"
systemctl list-units --type=service --state=running
echo "systemctl cat foo.service"
echo "------system一覧------"
echo "/usr/lib/systemd/system"
sudo ls /usr/lib/systemd/system
echo "/etc/systemd/system"
sudo ls /etc/systemd/system
echo "sudo cat path/name.service"
