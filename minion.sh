#!/bin/bash

cat <<EOF >/etc/yum.repos.d/salt.repo
[saltstack-repo]
name=SaltStack repo for Red Hat Enterprise Linux $releasever
baseurl=https://repo.saltstack.com/yum/redhat/7/x86_64/latest
enabled=1
gpgcheck=1
gpgkey=https://repo.saltstack.com/yum/redhat/7/x86_64/latest/SALTSTACK-GPG-KEY.pub
       https://repo.saltstack.com/yum/redhat/7/x86_64/latest/base/RPM-GPG-KEY-CentOS-7
EOF

yum install salt-minion -y

cat <<EOF >/etc/salt/minion
master: $salt_master
master_finger: $salt_master_pub
EOF

systemctl start salt-minion
