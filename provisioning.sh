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


#kafka
wget http://mirrors.hostingromania.ro/apache.org/kafka/2.4.0/kafka_2.12-2.4.0.tgz
tar -xzf kafka_2.12-2.4.0.tgz
#cd kafka_2.12-2.4.0
ls -l  kafka_2.12-2.4.0 > content.out

#Set Swappiness value to 10 instead of 60
sysctl -w vm.swappiness=10
cat /proc/sys/vm/swappiness



