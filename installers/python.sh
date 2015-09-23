apt-get -y install \
	python-dev \
	python-pip \
	python-virtualenv \
	virtualenvwrapper

echo ""
echo "Q: please add the following lines to $HOME/.profile"
echo ""
echo "# Virtualenv
echo "export WORKON_HOME=\"$HOME/.virtualenvs\""
echo ". /usr/local/bin/virtualenvwrapper.sh"
echo ""

