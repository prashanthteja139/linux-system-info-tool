#!/bin/bash

# ====================================================
# Linux System Information Tool
# Author: Prashanth Teja
# Description: Displays key system statistics in a clean, colorized format.
# ====================================================

# Define color codes
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${CYAN}=============================="
echo -e "   LINUX SYSTEM INFORMATION"
echo -e "==============================${RESET}"

# Get hostname
HOSTNAME=$(hostname)

# Get OS info
OS=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')

# Get uptime
UPTIME=$(uptime -p)

# Get CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')

# Get total and used memory
MEM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')
MEM_USED=$(free -h | awk '/Mem:/ {print $3}')

# Get disk usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

# Get IP Address
IP_ADDR=$(hostname -I | awk '{print $1}')

# Get logged-in users
USERS=$(who | wc -l)

echo -e "${GREEN}Hostname:${RESET} $HOSTNAME"
echo -e "${GREEN}Operating System:${RESET} $OS"
echo -e "${GREEN}Uptime:${RESET} $UPTIME"
echo -e "${GREEN}CPU Usage:${RESET} $CPU_USAGE"
echo -e "${GREEN}Memory Usage:${RESET} $MEM_USED / $MEM_TOTAL"
echo -e "${GREEN}Disk Usage:${RESET} $DISK_USAGE"
echo -e "${GREEN}IP Address:${RESET} $IP_ADDR"
echo -e "${GREEN}Logged-in Users:${RESET} $USERS"

echo -e "${CYAN}==============================${RESET}"
echo -e "Last Checked: $(date)"
echo -e "${CYAN}==============================${RESET}"
