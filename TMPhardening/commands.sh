// /tmp file hardening

chmod 1777 /tmp

// /var/tmp hardening

chmod 1777 /var/tmp

// /dev/shm hardening

chmod 1777 /dev/shm

vim /etc/fstab

tmpfs /dev/shm tmpfs defaults,nosuid,noexec 0 0



