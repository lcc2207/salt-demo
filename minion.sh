#!/bin/bash

cat <<EOF >/etc/yum.repos.d/salt.repo
[saltstack-repo]
name=SaltStack repo for Red Hat Enterprise Linux $releasever
baseurl=https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest
enabled=1
gpgcheck=1
gpgkey=https://repo.saltstack.com/yum/redhat/7/x86_64/latest/SALTSTACK-GPG-KEY.pub
       https://repo.saltstack.com/yum/redhat/7/x86_64/latest/base/RPM-GPG-KEY-CentOS-7
EOF

yum install salt-minion

cat <<EOF >/etc/salt/minion
master: $salt_master
EOF
