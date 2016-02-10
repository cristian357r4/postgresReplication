#/bin/bash
#sudo hostname m1
echo "m1" > hostname
sudo mv hostname /etc/hostname
sudo sed -i s/vagrant-VirtualBox/m1/ /etc/hosts
cp /vagrant/trustedCertificatePostgres.sh .
chmod +x trustedCertificatePostgres.sh
./trustedCertificatePostgres.sh
