# Get and install InfluxDB
wget http://influxdb.s3.amazonaws.com/influxdb_0.9.4.2_amd64.deb
sudo dpkg -i influxdb_0.9.4.2_amd64.deb

# Tell user it is running
echo ""
sudo /etc/init.d/influxdb start
