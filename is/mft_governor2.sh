#!/bin/bash

# install MFT IS
cd /opt/mftis
sed -i -- "s/dockerhostname/`hostname`/g" SilentInstall.xml
nohup ./install.sh silent &
sleep 120

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" INT QUIT TERM

# start service in background here
/opt/mftis/server/bin/startup.sh

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

# stop service and clean up here
echo "stopping MFT Internet Server"
/opt/mftis/server/bin/shutdown.sh
sqlcmd -U docker -P docker -S MSSQL -D -Q "delete from dbo.Config where HostName = '`hostname`'"

echo "exited $0"