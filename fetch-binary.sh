#!/bin/sh

### this will fetch phantomjs binary package

# app version
BINVER=1.9.2
# operating system
OS=linux
# architecture
ARCH=x86_64


BINTARBALL="phantomjs-${BINVER}-${OS}-${ARCH}.tar.bz2"
#CHKSUMFILE=SHASUMS.txt
TARGETDIR=binpkg
# base download url
BASEURL="https://phantomjs.googlecode.com/files/"

# cheap verify if we're on an rpm or dpkg system
if [ -e /etc/redhat-release ]
then
    PKGTOOL=rpm
else
    PKGTOOL=dpkg
fi

# install wget if it is missing
echo "### Verifying wget is installed"
if [ "${PKGTOOL}" == "rpm" ]
then
    rpm -q wget || yum install wget
else
    dpkg -s wget || apt-get --yes install wget
fi

# download binary tarball
mkdir -p ${TARGETDIR}
echo "### Downloading app binary tarball, if not present"
[ -e ${TARGETDIR}/${BINTARBALL} ] || wget -O ${TARGETDIR}/${BINTARBALL} "${BASEURL}/${BINTARBALL}"

# download checksum
##echo "### Downloading checksum file, if not present"
##wget -O ${TARGETDIR}/${CHKSUMFILE} "${BASEURL}/${CHKSUMFILE}"
##cd ${TARGETDIR}
### verify checksum, consider flipping a table if it fails
##echo "### Verifying checksum of tarball"
##grep node-v${BINVER}-${OS}-${ARCH}.tar.gz SHASUMS.txt  | sha1sum -c || echo ### ERROR in download, delete from ${TARGETDIR} and try again
##cd ..
