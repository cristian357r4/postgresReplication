#!/bin/bash
echo "Ejecutando after m1"
sudo su postgres <<EOF
cd ~
ssh-keyscan m2 >> .ssh/known_hosts
pg_ctlcluster 9.5 main stop
rsync -rv 9.5 m2:~/
pg_ctlcluster 9.5 main start
EOF