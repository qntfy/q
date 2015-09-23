### Update package manager and packages
sudo apt-get -qq update


### Headless install
sudo env DEBIAN_FRONTEND=noninteractive apt-get -o DPkg::Options::=--force-confnew upgrade -q -y < /dev/null


### Install universal needs
sudo apt-get -y install \
    autoconf \
    automake \
    build-essential \
    curl \
    git \
    libtool \
    unzip
