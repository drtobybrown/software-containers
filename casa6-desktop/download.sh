#!/usr/bin/env bash

if [ $# -lt 2 ]
then
  echo "usage: $0 <version> <"old"|"current">"
  exit 1
fi

RELEASE=$1
FILE="${RELEASE}.tar.xz"

if [ $2 == "old" ]; then
  URL="https://casa.nrao.edu/download/distro/casa/release/rhel//${FILE}"
elif [ $2 == "pipeline" ]; then
  URL="https://casa.nrao.edu/download/distro/casa-pipeline/release/linux/${FILE}"
else
  URL="https://casa.nrao.edu/download/distro/casa/release/rhel/${FILE}"
fi

# make sure we are in the source folder
HERE=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $HERE

if [ ! -e "$FILE" ]; then
    curl -O  $URL
else
    echo "$FILE already downloaded."
fi

FILE="admit"
URL="https://github.com/astroumd/${FILE}"
if [ ! -e "$FILE" ]; then
    git clone  $URL
else
    echo "$FILE already downloaded."
fi
