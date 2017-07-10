#!/bin/bash
yum -y install tar && yum -y install unzip && yum -y install wget && yum -y install perl && yum -y install perl-CPAN && yum -y install perl-DBI && yum -y install make && yum -y install perl-YAML && yum -y install gcc && yum -y install libuuid && yum -y install openssl && yum -y install e2fsprogs
cd /opt
mkdir -p /opt/java/
tar xzf /opt/jdk-8u131-linux-x64.tar.gz -C /opt/java
alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_131/bin/java 2 && alternatives --install /usr/bin/jar jar /opt/java/jdk1.8.0_131/bin/jar 2 && alternatives --install /usr/bin/javac javac /opt/java/jdk1.8.0_131/bin/javac 2 && alternatives --set jar /opt/java/jdk1.8.0_131/bin/jar && alternatives --set javac /opt/java/jdk1.8.0_131/bin/javac
cd /opt && unzip jce_policy-8.zip
mv -f /opt/UnlimitedJCEPolicyJDK8/*.jar /opt/java/jdk1.8.0_131/jre/lib/security/
echo export JAVA_HOME=/opt/java/jdk1.8.0_131 >> ~/.profile && echo export JRE_HOME=/opt/java/jdk1.8.0_131/jre >> ~/.profile && echo export PATH=$PATH:/opt/java/jdk1.8.0_131/bin:/opt/java/jdk1.8.0_131/jre/bin >> ~/.profile
export PATH=$PATH:/opt/java/jdk1.8.0_131/bin:/opt/java/jdk1.8.0_131/jre/bin