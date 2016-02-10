#/bin/bash
#sudo hostname m2
echo "m2" > hostname
sudo mv hostname /etc/hostname
sudo sed -i s/vagrant-VirtualBox/m2/ /etc/hosts
cp /vagrant/trustedCertificatePostgres.sh .
chmod +x trustedCertificatePostgres.sh
./trustedCertificatePostgres.sh