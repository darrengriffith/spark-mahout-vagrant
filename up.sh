#!/bin/bash

cp ~/.vagrant.d/insecure_private_key .

#
# Get install files
#

if [ ! -f Python-3.6.3.tgz ]; then
  curl -O https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
fi

if [ ! -f apache-mahout-distribution-0.13.0.tar.gz ]; then
  curl -O http://apache.mirrors.hoobly.com/mahout/0.13.0/apache-mahout-distribution-0.13.0.tar.gz
fi

if [ ! -f scala-2.11.11.tgz ]; then
  curl -O https://downloads.lightbend.com/scala/2.11.11/scala-2.11.11.tgz
fi

if [ ! -f spark-2.2.0-bin-hadoop2.7.tgz ]; then
  curl -O https://d3kbcqa49mib13.cloudfront.net/spark-2.2.0-bin-hadoop2.7.tgz
fi

if [ ! -f opencl_runtime_16.1.1_x64_rh_6.4.0.25.tgz ]; then
  curl -O http://registrationcenter-download.intel.com/akdlm/irc_nas/9019/opencl_runtime_16.1.1_x64_rh_6.4.0.25.tgz
fi

#
# Start VM
#

vagrant up
