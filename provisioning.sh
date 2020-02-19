#!/usr/bin/env bash
# Configure environment
export SHELL=/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Install dependencies
apt-get update
apt-get install -yq --no-install-recommends \
wget \
build-essential \
python-dev \
ca-certificates \
bzip2 \
unzip \
pandoc \
openjdk-8-jre-headless

apt-get clean


# Set Swappiness value to 10 instead of 60
sysctl -w vm.swappiness=10
cat /proc/sys/vm/swappiness


#kafka
wget http://mirrors.hostingromania.ro/apache.org/kafka/2.4.0/kafka_2.12-2.4.0.tgz
tar -xzf kafka_2.12-2.4.0.tgz
#cd kafka_2.12-2.4.0
ls -l  kafka_2.12-2.4.0 > content.out

# Start zookeeper
sh kafka_2.12-2.4.0/bin/zookeeper-server-start.sh config/zookeeper.properties &

# Start Kafka server
sh kafka_2.12-2.4.0/bin/kafka-server-start.sh config/server.properties &

# Add Topic
sh kafka_2.12-2.4.0/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic ede_topic &

sh kafka_2.12-2.4.0/bin/kafka-topics.sh --list --bootstrap-server localhost:9092 > topics.out


