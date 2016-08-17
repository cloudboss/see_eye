#!/bin/sh

app=${1}

if [ -z ${app} ]; then
    echo "Usage: ${0} <app>"
    exit 1
fi

git clone /repo ${app}
cd ${app}
ls
