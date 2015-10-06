apt-get -y install \
	python-dev \
	python-pip \
	python-virtualenv \
	virtualenvwrapper \
	libffi-dev \
	libssl-dev

echo ""
echo "Q: please add the following lines to $HOME/.profile"
echo ""
echo "# Virtualenv"
echo "export WORKON_HOME=\"$HOME/.virtualenvs\""
echo ". /usr/share/virtualenvwrapper/virtualenvwrapper.sh"
echo ""

