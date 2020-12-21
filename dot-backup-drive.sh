#!/bin/bash

set -e
set -x

function notify_error {
    notify-send "Error backing up to Drive" "~/.backup-drive.sh"
}

trap notify_error err

LOCAL_DIR=~/Backup
MD5SUM=$(tar -cPf - ~/.Secrets | md5sum | awk '{print $1}')

rsync -ahev ~/.ssh ~/.Secrets
rsync -ahev ~/.gnupg ~/.Secrets

rm -f ~/.v4ult.tar.gz

tar -czf ~/.v4ult.tar.gz ~/.Secrets

if [[ ! -f ~/.v4ult.tar.gz.md5sum ]] || [[ $(cat ~/.v4ult.tar.gz.md5sum) != ${MD5SUM} ]]; then
    echo ${MD5SUM} > ~/.v4ult.tar.gz.md5sum
    gpg --encrypt -r smainklh@gmail.com --trust-model always --batch --yes --output ${LOCAL_DIR}/v4ult.tar.gz.gpg ~/.v4ult.tar.gz
fi

rclone sync ~/Backup remote:Backup -P
