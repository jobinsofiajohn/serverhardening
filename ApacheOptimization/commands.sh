// changing Multi-Processing Module (MPM)

 vim /etc/httpd/conf.modules.d/00-mpm.conf 

LoadModule mpm_event_module modules/mod_mpm_event.so

save and exit

// Allocate RAM wisely for Apache

 vim /etc/httpd/conf/httpd.conf 

 <IfModule mpm_event_module>
    StartServers 3
    MinSpareThreads          25
    MaxSpareThreads          75
    ThreadLimit                      64
    ThreadsPerChild          25
    MaxRequestWorkers    30
    MaxConnectionsPerChild    1000
</IfModule>

save and exit

 systemctl restart httpd
