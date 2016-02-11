#/bin/bash
# Stractig the DHCP IP give by virtualbox
ip_dhcp=`ifconfig eth1|grep "addr:"|nawk '{print substr($2,6)}'`
echo $ip_dhcp > /vagrant/ip$(hostname).txt
echo "$ip_dhcp $(hostname) " >> /etc/hosts
sudo cp /vagrant/id_rs* ~postgres/
sudo chown postgres.postgres ~postgres/id_rs*
#Creating security certificates
sudo su postgres << EOF
cd ~
mkdir .ssh
mv id_rs* .ssh
cat .ssh/id_rsa.pub > .ssh/authorized_keys
chmod 600 .ssh/id_rs*
EOF
