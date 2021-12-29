if [ "$(id -un)" != "root" ]
        then echo "Please run this script as root or with sudo before continuing"
        exit
fi
echo "please enter the name of the ubuntu user that will be running docker commands on this server"
read line
if id "$line" >/dev/null 2>&1; then
        echo "user exists, continuing"
else
        echo "user does not exist, stopping"
		exit
fi
apt-get remove lxc-docker
apt-get purge lxc-docker
apt-get remove docker-engine
apt-get purge docker-engine
apt-get -y install apt-transport-https ca-certificates curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce
service docker start
usermod -aG docker $line
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo "============================================================================================================"
echo "Please log out of this session and then log in again"
echo "Run 'docker login url.to.private.registry.here' when you log in again, and fill in your registry credentials"
echo "============================================================================================================"
echo " "
echo " "
