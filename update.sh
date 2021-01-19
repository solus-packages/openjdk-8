#!/bin/bash
VERSION="$1"
REVISION="ga"
BASEURI="http://hg.openjdk.java.net/jdk8u/jdk8u"
set -e

# Main tarball
wget -nc "${BASEURI}/jdk8u${VERSION}-${REVISION}.tar.bz2"

function fetch_and_emit()
{
    wget -nc ${BASEURI}/$1/archive/jdk8u${VERSION}-${REVISION}.tar.bz2 -O $1-u${VERSION}-${REVISION}.tar.bz2
}

# subproject tarballs
for i in corba hotspot jaxp jaxws jdk langtools nashorn; do
    fetch_and_emit $i
done

sha256sum *tar.bz2
