#!/bin/bash

# install MFT CC
cd /opt/mftcc
sed -i -- "s/dockerhostname/`hostname`/g" SilentInstall.xml
nohup ./install.sh silent &
sleep 120

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" INT QUIT TERM

# start service in background here
/opt/mftcc/server/bin/startup.sh

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

# stop service and clean up here
echo "stopping MFT Command Center"
/opt/mftcc/server/bin/shutdown.sh
sqlcmd -U docker -P docker -S MSSQL -D -Q "delete from dbo.Config where HostName = '`hostname`_CC'"

echo "exited $0"