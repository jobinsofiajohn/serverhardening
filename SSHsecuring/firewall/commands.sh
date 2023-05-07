firewall-cmd --permanent --zone=public --remove-port=22/tcp #here we are using firewall to block incoming traffics on default port 22 which allowing access through port 2000
firewall-cmd --reload 
