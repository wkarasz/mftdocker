# mftdocker
TIBCO MFT Docker Scripts

## How to use
This is dockerization project for TIBCO MFT.

To install, you will first need to download Java JDK, JCE Policy Files, and the MFT install zip file.  Place the file in your repo directory.

There are hard-coded values in the install_prep1.sh file.  Verify your Java version matches or adjust accordingly.

## MFT Configuration
The project ships with a default SilentInstall.xml and keystore.jks.  These files will probably not be of much value to you unless you're using the same database names and values {DBname=docker, DBuser=docker, DBpass=docker, DBhost=192.168.99.1)

Delete these two files from the repo and replace with the SilentInstall.xml and keystore.jks generated when running the MFT silent setup.

## Docker Commands to Run
`cd` into your MFT project directory e.g. mftdocker/cc

`docker build -t mftcc:8.0.0 .`

`docker run -it --rm -p 8443:8443 mftcc:8.0.0`

Launch your web-browser and verify you are able to connect to the Command Center GUI
