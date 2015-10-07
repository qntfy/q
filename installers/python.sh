apt-get -y install \
	python-dev \
	python-pip \
	python-virtualenv \
	virtualenvwrapper \
	libffi-dev \
	libssl-dev

echo "export WORKON_HOME=\"$HOME/.virtualenvs\"" >> ~/.profile
echo ". /usr/share/virtualenvwrapper/virtualenvwrapper.sh" >> ~/.profile
