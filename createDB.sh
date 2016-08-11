#!/bin/bash
database=replicada
clave=replicada
cd ~
sudo cp /vagrant/after* ~vagrant/
sudo chmod +x ~vagrant/after*
echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > pgdg.list
sudo mv pgdg.list /etc/apt/sources.list.d
sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-9.5
sudo su postgres << EOF
 cd ~
 /usr/lib/postgresql/9.5/bin/psql -c "CREATE USER $database WITH SUPERUSER PASSWORD '$clave'"
 echo "Creando base de datos $database"
 /usr/lib/postgresql/9.5/bin/createdb $database -O $database
 sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/9.5/main/postgresql.conf
 sed -i "s/127.0.0.1\/32/0.0.0.0\/0/" /etc/postgresql/9.5/main/pg_hba.conf
 ########### Adicionando usuario de replica #################
createuser repslave1 -s --replication
psql -c "ALTER ROLE repslave1 WITH PASSWORD 'repslave1';"
echo "host replication repslave1  172.28.128.0/24  trust" >> /etc/postgresql/9.5/main/pg_hba.conf
cp /vagrant/walSender.sh /var/lib/postgresql/9.5/main/
mkdir /var/lib/postgresql/9.5/main/walFilesMaster
 pg_ctlcluster 9.5 main restart
EOF