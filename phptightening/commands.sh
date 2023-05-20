// Disable Remote PHP Code Execution

vim /etc/php.ini

allow_url_fopen=Off
allow_url_include=Off

save and exit

// Disable PHP Information Leakage

vim /etc/php.ini

expose_php=Off

save and exit

// Disable PHP Error Logs

vim /etc/php.ini

display_errors = Off
// optional
log_errors=On
error_log=/var/log/httpd/php_scripts_error.log
save and exit

// PHP Resource Control
vim /etc/php.ini


max_execution_time = 25
max_input_time = 25
memory_limit = 30M

//  Configure PHP File Uploads

file_uploads = Off

#or

file_uploads = On
upload_max_filesize = 1M
max_file_uploads = 1

// Disable Dangerous PHP Functions

vim /etc/php.ini
disable_functions=exec,passthru,shell_exec,system,proc_open,popen,curl_exec,curl_multi_exec,parse_ini_file,show_source
save and exit

//  Change SOAP Cache Directory

vim /etc/php.ini
soap.wsdl_cache_dir = /var/lib/php/soap_cache
save and exit

// Control PHP POST Size

vim /etc/php.ini
post_max_size=4M

save and exit

for performance you could enable opcache.so in config file


