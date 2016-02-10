#!/bin/bash
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > pgdg.list
sudo mv pgdg.list /etc/apt/sources.list.d
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-9.5
sudo su postgres << EOF
 cd ~
 /usr/lib/postgresql/9.5/bin/psql -c "CREATE USER swii WITH SUPERUSER PASSWORD 'swii'"
 echo "Creando base de datos swii"
 /usr/lib/postgresql/9.5/bin/createdb swii -O swii
 sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/9.5/main/postgresql.conf
 sed -i "s/127.0.0.1\/32/0.0.0.0\/0/" /etc/postgresql/9.5/main/pg_hba.conf
 pg_ctlcluster 9.5 main restart
EOF