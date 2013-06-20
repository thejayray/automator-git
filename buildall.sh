#!/bin/bash

TEMP=$(getopt -o '' -n $(basename $0) -- "$@")

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

eval set -- "$TEMP"

while true; do
  case "$1" in
    -- ) shift; break ;;
  esac
done

for dir in Git*
do
    pushd "$dir"

    if xcodebuild -target "$dir" build
    then
        cp -r build/Release/"$dir".action ~/Library/Automator/
    fi
    popd
done
