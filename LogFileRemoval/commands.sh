// apache old log file removal

tail /var/log/httpd/access_log >> file.log && mv file.log /var/log/httpd/access_log // there are multiple log files under\
/var/log/httpd , do the same for all of those

// mail old file removal

 tail /var/log/maillog >> file.log && mv file.log /var/log/maillog

 // mysql old log file removal

  tail /var/log/mariadb/mariadb.log >> file.log && mv file.log /var/log/mariadb/mariadb.log

  // dns (bind) log file removal , log files General Query Log: /var/log/named/query.log, Zone Transfer Log: /var/log/named/xferlog, DNS Resolver Log: /var/log/named/resolver.log

tail /var/log/named/query.log >> file.log && mv file.log /var/log/named/query.log

do the same for other log files

// ftp log file, pure-ftpd

grep -i 'ftpd' /var/log/messages || tail >> file.log && mv file.log /var/log/messages



