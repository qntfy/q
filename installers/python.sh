apt-get -y install \
	python-dev \
	python-pip \
	python-virtualenv \
	virtualenvwrapper \
	libffi-dev \
	libssl-dev \
  libyaml-dev

echo ""
echo "# virtualenv & virtualenvwrapper"
echo "export WORKON_HOME=\"$HOME/.virtualenvs\"" >> ~/.profile
echo ". /usr/share/virtualenvwrapper/virtualenvwrapper.sh" >> ~/.profile

echo ""
echo "HEY! in your shell, type this:
echo ""
echo "    $ . ~/.profile"
echo ""
