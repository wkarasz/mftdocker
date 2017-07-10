FROM centos:6.6
MAINTAINER wkarasz@tibco.com
COPY jdk-8u131-linux-x64.tar.gz jce_policy-8.zip cpan_instructions.txt msodbcsql-11.0.2270.0.tar.gz install_prep1.sh install_prep2.sh /opt/
ADD build_dm2.sh /opt/msodbcsql-11.0.2270.0/
ENV JAVA_HOME=/opt/java/jdk1.8.0_131 JRE_HOME=/opt/java/jdk1.8.0_131/jre TERM=dumb
RUN cd /opt && ./install_prep1.sh
COPY unixODBC-2.3.0.tar.gz /opt/
RUN cd /opt && ./install_prep2.sh
# comment && export PATH=$PATH:/opt/java/jdk1.8.0_131/bin:/opt/java/jdk1.8.0_131/jre/bin
ADD TIB_mftcc_8.0.0_all.zip /opt
RUN unzip /opt/TIB_mftcc_8.0.0_all.zip -d /opt/mftcc && chmod 544 /opt/mftcc/install.sh && rm -f /opt/TIB_mftcc_8.0.0_all.zip
ADD sqljdbc4.jar SilentInstall.xml keystore.jks mft_governor2.sh /opt/mftcc/
EXPOSE 8443
CMD ["/bin/sh", "/opt/mftcc/mft_governor2.sh"]