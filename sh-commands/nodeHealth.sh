#!/bin/bash

############
# Author : Akash
# Date   : 28-12-2024
#
# This script outputs the node health information, 
# including disk usage, memory usage, and CPU information.
#
# Version: v1.1
############

# Function to check memory usage

set -x #debug mode

check_memory_usage() {
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        echo "Memory Usage (Windows):"
        wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Format:List
    else
        echo "Memory Usage (Linux/Unix):"
        free -h
    fi
}

# Display disk usage
echo "Disk Usage:"
df -h

# Display CPU information
echo "Number of Processors:"
nproc

# Display memory usage
check_memory_usage



