wget ftp://ftp.chkrootkit.org/pub/seg/pac/chkrootkit.tar.gz

yum install gcc glibc-static

tar -xzf chkrootkit.tar.gz
mkdir /usr/local/chkrootkit
mv chkrootkit-0.57/* /usr/local/chkrootkit
cd /usr/local/chkrootkit
make sense
cd
vim chkrootkit.sh

#!/bin/bash
cd /usr/local/chkrootkit
./chkrootkit -q
//save and exit

chmod u+x chrootkit.sh

./chkrootkit.sh // to run the script
