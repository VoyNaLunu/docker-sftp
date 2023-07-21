#!/bin/bash

#generate keys for ssh server
ssh-keygen -A


#add ftp user
adduser $USER_NAME --home /srv/sftp

#set password for ftp user
echo -e "$USER_PASS\n$USER_PASS" | passwd $USER_NAME

#create ftp folder
mkdir -p /srv/sftp

#give ftp user ownership of the folder
chown $USER_NAME:$USER_NAME /srv/sftp

#set rights for the folder
chmod -R 764 /srv/sftp

#replace tmp user set in sshd config with newly created ftp user
sed -i "s/tmp/$USER_NAME/g" /etc/ssh/sshd_config.d/sftp.conf

#start sshd in non detached mode
exec /usr/sbin/sshd -D -e -p 8022
