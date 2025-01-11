#!/bin/bash

echo "Executing commonly used Linux commands..."

# 1. Display system information
echo "System Information:"
uname -a

# 2. Show disk usage
echo "Disk Usage:"
df -h

# 3. List active processes
echo "Active Processes:"
ps aux | head -10

# 4. Check memory usage
echo "Memory Usage:"
free -h

# 5. List files and directories in the current directory
echo "Files and Directories:"
ls -lah

# 6. Check the current working directory
echo "Current Working Directory:"
pwd

# 7. Display network information
echo "Network Information:"
ifconfig

# 8. Display current user and hostname
echo "Current User and Hostname:"
whoami
hostname

# 9. Search for a pattern in a file (replace 'pattern' and 'file.txt')
# Uncomment and update the following line if needed
# grep 'pattern' file.txt

# 10. Check system uptime
echo "System Uptime:"
uptime

# 11. Show the last 10 lines of a log file (replace 'file.log')
# Uncomment and update the following line if needed
# tail -n 10 file.log

# 12. Show system date and time
echo "Current Date and Time:"
date

# 13. List all users logged in
echo "Logged in Users:"
who

# 14. Display system kernel version
echo "Kernel Version:"
uname -r

echo "Linux commands executed successfully."
