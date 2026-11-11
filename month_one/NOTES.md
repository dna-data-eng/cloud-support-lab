# Month one  notes

# Month 1 notes

## Lab 1: Ubuntu and sudo user
What I did: Installed Ubuntu-24.04 on Windows with WSL, then created my Linux user, dna, with sudo rights.
Problem and fix: I forgot my Linux password. I reset it from the root shell with wsl -d Ubuntu-24.04 -u root, then passwd dna.
What I learned: WSL runs a real Linux system inside Windows. sudo lets a normal user run admin commands after entering their password.

## Lab 2: Searching logs with grep, awk, and sed
What I did: Created access.log with eight sample web server lines and counted the 404 responses for each URL.
Problem and fix: Used grep to find the 404 lines, awk to print the URL column ($6), then sort and uniq -c to count each URL. Used sed to replace 404 with 410 on screen only. The file didn't change.
What I learned: The pipe (|) passes one command's output into the next, so each tool does one small job.

## Lab 3: Nginx with systemctl and journalctl
What I did: Installed Nginx, checked it with systemctl status nginx, and confirmed it serves pages with curl -I http://localhost, which returned 200 OK.
Problem and fix: sudo rejected my password, so I installed Nginx from the root shell. The journalctl error filter returned no entries, which means no errors were logged.
What I learned: systemctl shows whether a service is running. journalctl shows its logs.

## Lab 4: SSH keys and password login
What I did: Created an ed25519 key pair with ssh-keygen, installed the public key with ssh-copy-id, and tested the key login with a passphrase. Then I turned off password login with a setting file in /etc/ssh/sshd_config.d/.
Problem and fix: My first attempt to delete the setting file failed with "Permission denied," so I used sudo rm. I also moved the old keys to a backup folder and made a new pair, so the setup started clean.
What I learned: A private key proves who you are, and the server checks it against the public key. Turning off passwords blocks guessing attacks. Test the key login before turning off passwords, so you don't lock yourself out.

## Lab 5: Disk check script and cron
What I did: Wrote check_disk.sh to read the root filesystem's usage percentage and warn above 85%. Scheduled it with cron to run every 5 minutes, logging to ~/disk-check.log.
Problem and fix: A decimal threshold (0.9) printed OK because the comparison failed. I changed the script to check that the threshold and the usage are whole numbers, and to exit with an error if they aren't. I tested 85, 0.9, and 0 to confirm OK, ERROR, and WARNING.
What I learned: A script should fail loudly instead of printing a false OK. cron runs repetitive tasks even when no terminal is open.
