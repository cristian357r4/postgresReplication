#/bin/bash
#sudo hostname m2
echo "m2" > hostname
sudo mv hostname /etc/hostname
sudo sed -i "s/vagrant-VirtualBox/m2/" /etc/hosts
sudo sed  -i "s/.*wal_level.*=.*/wal_level = 'hot_standby'/" /etc/postgresql/9.5/main/postgresql.conf
sudo sed  -i "s/.*archive_mode.*=.*/archive_mode = on" /etc/postgresql/9.5/main/postgresql.conf
sudo sed  -i "s/.*archive_command.*=.*/archive_command = '\/var\/lib\/postgresql\/9.5\/main\/walSender.sh %p %f'/" /etc/postgresql/9.5/main/postgresql.conf
sudo sed  -i "s/.*archive_timeout.*=.*/archive_timeout = 1200/" /etc/postgresql/9.5/main/postgresql.conf
sudo sed  -i "s/.*max_wal_senders.*=.*/max_wal_senders = 2/" /etc/postgresql/9.5/main/postgresql.conf
sudo sed  -i "s/.*wal_sender_delay.*=.*/wal_sender_delay = 200ms/" /etc/postgresql/9.5/main/postgresql.conf
sudo sed  -i "s/.*wal_keep_segments.*=.*/wal_keep_segments = 100/" /etc/postgresql/9.5/main/postgresql.conf
sudo sed  -i "s/.*hot_standby.*=.*/hot_standby = on/" /etc/postgresql/9.5/main/postgresql.conf
########### Certificados de Confianza ######################3
ip_dhcp='172.16.28.4'
echo "$ip_dhcp $(hostname) " >> /etc/hosts
sudo cp /vagrant/id_rs* ~postgres/
sudo chown postgres.postgres ~postgres/id_rs*
echo "172.16.28.3 m1" >> /etc/hosts
#Creating security certificates
sudo su postgres << EOF
 cd ~
 mkdir .ssh
 mv id_rs* .ssh
 cat .ssh/id_rsa.pub > .ssh/authorized_keys
 chmod 600 .ssh/id_rs*
 ssh-keyscan m1 >> .ssh/known_hosts
EOF