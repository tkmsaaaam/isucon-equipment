#!/bin/bash
echo "------cpu------"
cat /proc/cpuinfo
echo "------meminfo------"
cat /proc/meminfo
echo "------free------"
free -h
echo "------services------"
systemctl list-units --type=service --state=running
