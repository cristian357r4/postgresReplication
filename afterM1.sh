#!/bin/bash
echo "Ejecutando after m1"
sudo su postgres <<EOF
cd ~
ssh-keyscan m2 >> .ssh/known_hosts
pg_ctlcluster 9.5 main restart
pg_ctlcluster 9.5 main stop
rsync --exclude "9.5/main/walSender.sh" --exclude "9.5/main/walFilesMaster/*" -rv 9.5 m2:~/
pg_ctlcluster 9.5 main start
EOF