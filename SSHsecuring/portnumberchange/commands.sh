vim /etc/ssh/sshd_conifg     // Open the configuration file in vim. Change the options Port 22 from Port 2000
setenforce 0
firewall-cmd --permanent --add-port=2000/tcp // Make sure you add the new port number to your firewall so it doesn't block the incoming connection. 

firewall-cmd --reload

systemctl restart sshd
netstat -ntlp | grep sshd  //Restart the sshd service then use netstat command to confirm it

ssh root@103.150.30.161 -p 2000 //Testing: now you can connect from the client using ssh

