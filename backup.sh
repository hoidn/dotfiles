# rsync backup job
sudo rsync -aAXvz --bwlimit=2000 --delete / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/lost+found"} pi@`cat pi`:/home/pi/usbdrive/backups/bk.0/
