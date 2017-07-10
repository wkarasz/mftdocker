#!/bin/bash
cd /opt/msodbcsql-11.0.2270.0
./build_dm2.sh --accept-warning --download-url=file:///opt/unixODBC-2.3.0.tar.gz
cd /tmp/unixODBC.tmp/unixODBC-2.3.0; make install
echo "[MSSQL]" >> /etc/odbc.ini
echo "Driver = ODBC Driver 11 for SQL Server" >> /etc/odbc.ini 
echo "Server = tcp:192.168.99.1,1433" >> /etc/odbc.ini
#cd /opt/msodbcsql-11.0.2270.0
#./install.sh install --accept-license