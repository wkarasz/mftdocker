FROM centos:6.6
MAINTAINER wkarasz@tibco.com
ADD msodbcsql-11.0.2270.0.tar.gz /opt/
COPY jdk-8u131-linux-x64.tar.gz jce_policy-8.zip cpan_instructions.txt  install_prep1.sh install_prep2.sh /opt/
COPY build_dm2.sh /opt/msodbcsql-11.0.2270.0/
ENV JAVA_HOME=/opt/java/jdk1.8.0_131 JRE_HOME=/opt/java/jdk1.8.0_131/jre TERM=dumb
RUN cd /opt && ./install_prep1.sh
COPY unixODBC-2.3.0.tar.gz /opt/
RUN cd /opt && ./install_prep2.sh
ADD TIB_mftcc_8.0.0_all.zip /opt
RUN cd /opt && ./install_MFT.sh
ADD sqljdbc4.jar SilentInstall.xml keystore.jks mft_governor2.sh /opt/mftcc/
EXPOSE 8443
CMD ["/bin/sh", "/opt/mftcc/mft_governor2.sh"]