#!/bin/sh
if [ $# -lt 1 ]; then
    echo "usage: $0 <username@host>"
    echo " i.e.: $0 haozi@192.168.88.88 22"
    echo
    exit 1
fi

if [ -f "$HOME/.ssh/id_rsa.pub" ]; then
    echo ''
else
    ssh-keygen -t rsa
fi

target="$1"
port="$2"
ssh "$target" -p $port 'test -d .ssh || mkdir -m 0700 .ssh ; cat >>.ssh/authorized_keys && chmod 0600 .ssh/*' < ~/.ssh/id_rsa.pub
exit $?
