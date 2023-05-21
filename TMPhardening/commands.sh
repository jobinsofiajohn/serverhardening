// /tmp file hardening

cp -a /etc/fstab /etc/fstab.bak
dd if=/dev/zero of=/var/tempFS bs=1024 count=1048576
/sbin/mkfs.ext3 /var/tempFS
rsync -av /tmp/ /tmpbackup/

mount -o loop,noexec,nosuid,rw /var/tempFS /tmp


chmod 1777 /tmp
rsync -av /tmpbackup/ /tmp/
vim /etc/fstab
/var/tempFS /tmp ext3 loop,nosuid,noexec,rw 0 0
mount -o remount /tmp

df -h


// /var/tmp hardening

cp -av /var/tmp /tmp/tmp // create /tmp/tmp if it does not exist
ln -s /tmp/tmp /var/tmp

chmod 1777 /var/tmp

// /dev/shm hardening

chmod 1777 /dev/shm

vim /etc/fstab

tmpfs /dev/shm tmpfs defaults,nosuid,noexec 0 0



