vim /etc/host.conf

order bind,hosts
multi on

systemctl restart NetworkManager

// note : we have done ip spoofing protection in sysctl.conf hardening
