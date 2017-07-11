FROM centos:6.6
MAINTAINER wkarasz@tibco.com
COPY jdk-8u131-linux-x64.tar.gz jce_policy-8.zip cpan_instructions.txt install_prep1.sh install_prep2.sh /opt/
ADD msodbcsql-11.0.2270.0.tar.gz /opt/
ADD build_dm2.sh /opt/msodbcsql-11.0.2270.0/
ENV JAVA_HOME=/opt/java/jdk1.8.0_131 JRE_HOME=/opt/java/jdk1.8.0_131/jre TERM=dumb
RUN cd /opt && ./install_prep1.sh
COPY unixODBC-2.3.0.tar.gz /opt/
RUN cd /opt && ./install_prep2.sh
ADD TIB_mftis_8.0.0_all.zip /opt
RUN unzip /opt/TIB_mftis_8.0.0_all.zip -d /opt/mftis && chmod 544 /opt/mftis/install.sh && rm -f /opt/TIB_mftis_8.0.0_all.zip
ADD sqljdbc4.jar SilentInstall.xml keystore.jks mft_governor2.sh /opt/mftis/
EXPOSE 7443 21 22 990 46464 47777 56565
CMD ["/bin/sh", "/opt/mftis/mft_governor2.sh"]