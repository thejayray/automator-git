#!/bin/bash

TEMP=$(getopt -o '' -n $(basename $0) -- "$@")

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

eval set -- "$TEMP"

while true; do
  case "$1" in
    -- ) shift; break ;;
  esac
done

RELEASEDIR="Automator-Git/"

if [ ! -d $RELEASEDIR ]
then
    mkdir $RELEASEDIR
fi
RELEASEDIR=$(python -c "import os,sys; print os.path.realpath(sys.argv[1])" $RELEASEDIR)

for dir in Git*
do
    pushd "$dir"

    if xcodebuild -target "$dir" build
    then
        cp -rv build/Release/"$dir".action $RELEASEDIR
    fi
    popd
done

tar czf Automator-Git.tar.gz Automator-Git/
