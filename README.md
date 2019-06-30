# Archive-downloads

Archive-downloads is a simple script to keep downloads clean.

## How it Works?

Each time script is executed, it takes files **older than today** from your downloads directory and move them to archive directory what you defined.

## Requirements

Linux and installed PHP interpreter.

## Usage

1. Change constants in archive-downloads.sh, and save file:

   ```php
   define('USERNAME', 'yourLinuxUserName');
   define('DOWNLOADS_DIR_NAME', 'downloadsDirName');
   define('ARCHIVE_DIR_NAME', 'yourArchiveDirName');
   ```
   e.g.:
   ```php
   define('USERNAME', 'paul');
   define('DOWNLOADS_DIR_NAME', 'Downloads');
   define('ARCHIVE_DIR_NAME', 'archive');
   ```
   with above settings, script will search files in /home/paul/Downloads/, and move files to 
   /home/paul/Downloads/archive/{Y-m-d}/
2. Move script:
   
   ```bash
   $ sudo mv archive-downloads.sh /usr/bin/archive-downloads.sh
   ```
3. Make script executable:

   ```bash
   $ sudo chmod +x /usr/bin/archive-downloads.sh
   ```
4. Check if the script works correctly:
   ```bash
   $ /usr/bin/archive-downloads.sh
   ```
5. Add script to crontab:

   ```bash
   $ sudo crontab -e
   ```
   at end of opened file add command below and save:
   ```text
   @reboot /usr/bin/archive-downloads.sh
   ```
6. All done, on every restart your downloads will be archived!
