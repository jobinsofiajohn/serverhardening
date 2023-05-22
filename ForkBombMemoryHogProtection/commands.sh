vim /etc/security/limits.conf
* hard core 0
* hard rss 10000
* hard nproc 200
save and exit

vim /etc/security/limits.d/20-nproc.conf

*          soft    nproc     100
save and exit

vim /etc/pam.d/login

session required pam_limits.so

save and exit
hfjhf