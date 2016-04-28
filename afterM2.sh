#!/bin/bash
echo "Ejecutando after m2"
sudo su postgres <<EOF
cd ~
ssh-keyscan m1 >> .ssh/known_hosts
pg_ctlcluster 9.5 main start
EOF