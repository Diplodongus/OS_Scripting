#!/bin/bash

# Define log file
LOG_FILE="/var/log/auto_update.log"

# Record the date and time of this script run
echo "Starting update at $(date)" | sudo tee -a $LOG_FILE

# Update package lists
if ! sudo apt-get update 2>>$LOG_FILE >>$LOG_FILE; then
    echo "Failed to update package lists at $(date)" | sudo tee -a $LOG_FILE
else
    echo "Package lists updated successfully at $(date)" | sudo tee -a $LOG_FILE
fi

# Upgrade all packages
if ! sudo apt-get -y upgrade 2>>$LOG_FILE >>$LOG_FILE; then
    echo "Failed to upgrade packages at $(date)" | sudo tee -a $LOG_FILE
else
    echo "Packages upgraded successfully at $(date)" | sudo tee -a $LOG_FILE
fi

# Clean up
if ! sudo apt-get -y autoremove 2>>$LOG_FILE >>$LOG_FILE; then
    echo "Failed to remove unnecessary packages at $(date)" | sudo tee -a $LOG_FILE
else
    echo "Unnecessary packages removed successfully at $(date)" | sudo tee -a $LOG_FILE
fi

echo "Update process completed at $(date)" | sudo tee -a $LOG_FILE
echo "--------------------------------------------------------" | sudo tee -a $LOG_FILE
