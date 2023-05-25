#!/bin/bash
ssh-keygen -A
addgroup $GROUP_NAME
adduser $USER_NAME -G $GROUP_NAME --home /srv/sftp
echo -e "$USER_PASS\n$USER_PASS" | passwd $USER_NAME
mkdir -p /srv/sftp \
chown $USER_NAME:$GROUP_NAME /srv/sftp
chmod -R 764 /srv/sftp
sed -i "s/tmp/$USER_NAME/g" /etc/ssh/sshd_config.d/sftp.conf
exec /usr/sbin/sshd -D -e -p 8022