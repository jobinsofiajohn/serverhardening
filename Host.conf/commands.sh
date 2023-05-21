vim /etc/host.conf

order bind,hosts
multi on

systemctl restart NetworkManager

