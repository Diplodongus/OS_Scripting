# Ubuntu Auto-Update Script

## Overview

This script automates the process of updating package lists, upgrading packages, and cleaning up unnecessary packages on Ubuntu systems. It includes basic error handling and logs its operations to a file, making it easier to monitor its activity and troubleshoot any issues that may arise.

## Installation

### 1. Script Setup

- Navigate to your preferred directory (e.g., `/usr/local/bin/`) and create the script file named `auto_update.sh`:

```bash
sudo nano /usr/local/bin/auto_update.sh
```

- Insert the contents provided in the section below.

- Make the script executable:

```bash
sudo chmod +x /usr/local/bin/auto_update.sh
```

### 2. Logging Setup

- Create a log file in `/var/log/` named `auto_update.log`:

```bash
sudo touch /var/log/auto_update.log
```

- Adjust the permissions as necessary to ensure the script can write to this file.

### 3. Cron Job Setup

- Edit your crontab to schedule the script:

```bash
crontab -e
```

- Add the following line to run the script daily at 2 AM:

```cron
0 2 * * * /usr/local/bin/auto_update.sh
```

## Usage

Once set up, the script will run automatically at the scheduled time. You can manually trigger the script using:

```bash
sudo /usr/local/bin/auto_update.sh
```

## Monitoring

To monitor the script's activity and any potential issues, check the log file located at `/var/log/auto_update.log`:

```bash
cat /var/log/auto_update.log
```

This file contains detailed logs of each run, including dates, times, and the outcome of each operation.

## Troubleshooting

- Ensure the script is executable and located in `/usr/local/bin/`.
- Verify that the cron job has been set up correctly and matches the system's time settings.
- Check the `/var/log/auto_update.log` file for any error messages or alerts.

For any issues not covered by the log file, manual execution of the script may provide additional output helpful for troubleshooting.

## Security Considerations

- Regularly review the permissions of the script and log file to ensure they're as restrictive as necessary.
- Monitor the contents of the log file to ensure that no sensitive information is being inadvertently logged.
