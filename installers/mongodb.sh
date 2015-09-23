# Add MongoDB.org's public key to apt
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

# Add MongoDB repo and update package list
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
apt-get -qq update

# Install official MongoDB package
apt-get -y install mongodb-org

# Tell user it is running
echo ""
service mongod status
