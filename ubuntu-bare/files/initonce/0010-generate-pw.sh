#!/bin/bash

# generate new host keys
rm -rf /etc/ssh/ssh_host_*
ssh-keygen -A > /dev/null
# generate user's ssh key
mkdir /home/nitrous/.ssh
chmod 0700 /home/nitrous/.ssh
ssh-keygen -b 2048 -t rsa -N '' -C '' -f /home/nitrous/.ssh/id_rsa > /dev/null
chown -R nitrous:nitrous /home/nitrous/.ssh
# generate random password for nitrous user
RANDOM_PW=`tr -dc A-Za-z0-9_ < /dev/urandom | head -c24`
echo "nitrous:$RANDOM_PW" | chpasswd
echo
echo "**********************************************************************"
echo "*                                                                    *"
echo "*  Default password for user \"nitrous\" is $RANDOM_PW  *"
echo "*                                                                    *"
echo "*  Please remember to change it as soon as possible!                 *"
echo "*                                                                    *"
echo "**********************************************************************"
echo
