yum install mailx
firewall-cmd --add-service=pop3 --permanent 
firewall-cmd --add-service=pop3s --permanent
firewall-cmd --add-service=smtp --permanent 
firewall-cmd --add-service=smtps --permanent 
firewall-cmd --add-service=imap --permanent 
firewall-cmd --add-service=imaps --permanent
firewall-cmd --reload


hostnamectl set-hostname jobinsofiajohn.tech

vim /etc/hosts

add 103.150.30.161 jobinsofiajohn.tech
yum update

yum install exim
systemctl enable exim
systemctl start exim
yum install file perl-Mail-SPF.noarch openssl
mkdir /root/SSL/mail.hostname -p 
cd /root/SSL/mail.hostname

openssl req -nodes -x509 -newkey rsa:2048 -keyout mail.hostname.key -out mail.hostname.crt -days 365

cp mail.hostname.crt mail.hostname.key /etc/ssl/
cp /etc/exim/exim.conf{,.orig}
vim /etc/exim/exim.conf

primary_hostname = jobinsofiajohn.tech
domainlist local_domains = @ : jobinsofiajohn.tech
tls_certificate = /etc/ssl/mail.hostname.crt
tls_privatekey = /etc/ssl/mail.hostname.key

local_delivery:
  driver = appendfile
 # file = /var/mail/$local_part_data
  delivery_date_add
  envelope_to_add
  return_path_add
  group = mail
  mode = 0660
  directory = $home/Maildir
  maildir_format
  maildir_use_size_file


dovecot_login:
driver = dovecot
public_name = LOGIN
server_socket = /var/run/dovecot/auth-client
server_set_id = $auth1


dovecot_plain:
driver = dovecot
public_name = PLAIN
server_socket = /var/run/dovecot/auth-client
server_set_id = $auth1

save and exit

yum install dovecot -y 
systemctl start dovecot
systemctl enable dovecot


 vim /etc/dovecot/conf.d/10-ssl.conf
ssl_cert = </etc/ssl/mail.hostname.crt
ssl_key = </etc/ssl/mail.hostname.key

vim /etc/dovecot/conf.d/10-auth.conf

disable_plaintext_auth = no

vim /etc/dovecot/conf.d/10-mail.conf
mail_location = maildir:~/Maildir

vim /etc/dovecot/conf.d/10-master.conf

unix_listener auth-userdb {
mode = 0660
user = exim
}
systemctl restart exim
systemctl restart dovecot

/.chkrootkit.sh -q >> mail -s "ckkrootkit scan report" jobinjohn819@gmail.com


