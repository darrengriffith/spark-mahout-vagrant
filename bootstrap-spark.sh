#!/usr/bin/env bash

echo ======================
echo == PREPARING CENTOS ==
echo ======================

yum -y update

# For Python
yum -y groupinstall development
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel

# For Mahout
yum -y install opencl-headers
yum -y install redhat-lsb-core


echo =======================
echo == INSTALLING Java 8 ==
echo =======================

yum -y install java-1.8.0-openjdk

echo "" >> /etc/profile
echo "## Setting JAVA_HOME for all USERS ##" >> /etc/profile
echo "export JAVA_HOME=/usr" >> /etc/profile


echo ======================
echo == INSTALLING Scala ==
echo ======================

cd /vagrant
tar -xvf scala-2.11.11.tgz
mv scala-2.11.11 /opt/scala
sudo mv scala-2.11.11 /opt/scala

alternatives --install /usr/bin/scala scala /opt/scala/bin/scala 2
alternatives --install /usr/bin/scalac scalac /opt/scala/bin/scalac 2
alternatives --install /usr/bin/scaladoc scaladoc /opt/scala/bin/scaladoc 2
alternatives --install /usr/bin/scalap scalap /opt/scala/bin/scalap 2

echo "" >> /etc/profile
echo "## Setting SCALA_HOME for all USERS ##" >> /etc/profile
echo "export SCALA_HOME=/opt/scala" >> /etc/profile


echo =======================
echo == INSTALLING Python ==
echo =======================

cd /vagrant
tar -xvf Python-3.6.3.tgz
cd Python-3.6.3
./configure
make
make altinstall

yum -y install epel-release
yum -y install python-pip

pip install virtualenv

echo "## Adding Python to the path for all USERS ##" >> /etc/profile
echo "export PATH=/usr/local/bin:\$PATH" >> /etc/profile

rm -r /vagrant/Python-3.6.3


echo ======================
echo == INSTALLING Spark ==
echo ======================

cd /vagrant
tar -xvf spark-2.2.0-bin-hadoop2.7.tgz
mv spark-2.2.0-bin-hadoop2.7 /opt/spark

echo "" >> /etc/profile
echo "## Setting SPARK env for all USERS ##" >> /etc/profile
echo "export SPARK_HOME=/opt/spark" >> /etc/profile
echo "export PATH=\$SPARK_HOME/bin:\$PATH" >> /etc/profile
echo "export PYSPARK_PYTHON=python3.6" >> /etc/profile


echo =======================
echo == INSTALLING Mahout ==
echo =======================

cd /vagrant
tar -xvf apache-mahout-distribution-0.13.0.tar.gz
mv apache-mahout-distribution-0.13.0 /opt/mahout

echo "## Adding Mahout to the classpath for all USERS ##" >> /etc/profile
echo "export CLASSPATH=/opt/mahout/mahout-core-0.13.0.jar:\$CLASSPATH" >> /etc/profile
echo "export CLASSPATH=/opt/mahout/mahout-core-0.13.0-job.jar:\$CLASSPATH" >> /etc/profile
echo "export CLASSPATH=/opt/mahout/mahout-integration-0.13.0.jar:\$CLASSPATH" >> /etc/profile
echo "export CLASSPATH=/opt/mahout/mahout-math-0.13.0.jar:\$CLASSPATH" >> /etc/profile

echo "export MAHOUT_HOME=/opt/mahout" >> /etc/profile
echo "export MAHOUT_LOCAL=true" >> /etc/profile

# This is interactive and needs to be run by a user
#
#cd /vagrant
#tar -xvf opencl_runtime_16.1.1_x64_rh_6.4.0.25.tgz
#cd opencl_runtime_16.1.1_x64_rh_6.4.0.25
#./install.sh
