### Setup Kafka user
if grep -q "^kafka:" /etc/passwd; then
    echo "kafka user already exists"
else
    useradd kafka -m
    echo -n "Password for kafka user:"
    passwd kafka
    adduser kafka sudo
fi

### Install Java
apt-get install default-jre -y

### Install zookeeper
apt-get install zookeeperd -y

### DL Kafka binaries
SUDO_GROUP=$(cat /etc/group | grep $SUDO_GID | cut -f 1 -d ":")

mkdir -p ~/src && chown $SUDO_USER:$SUDO_GROUP ~/src
mkdir -p ~/src/kafka && chown $SUDO_USER:$SUDO_GROUP ~/src/kafka

cd ~/src
wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
chown $SUDO_USER:$SUDO_GROUP kafka_2.11-0.8.2.1.tgz

cd ~/src/kafka
sudo -u $SUDO_USER tar zxf ../kafka_2.11-0.8.2.1.tgz --strip 1

### Support deleting topics (not on by default)
echo "" >> config/server.properties
echo "# Support topic deletes" >> config/server.properties
echo "delete.topic.enable = true" >> config/server.properties

nohup ~/src/kafka/bin/kafka-server-start.sh ~/src/kafka/config/server.properties > ~/src/kafka/kafka.log 2>&1 &

# You can test your setup using these two commands:
#
# echo "Hello, World" | ~/src/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic > /dev/null
#
# ~/src/kafka/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic TutorialTopic --from-beginning
