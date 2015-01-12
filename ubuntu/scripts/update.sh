echo "==> Updating list of repositories"
apt-get -y update

echo "==> Performing dis-upgrade (all packages and kernel)"
apt-get -y dist-upgrade --force-yes
reboot
sleep 60
