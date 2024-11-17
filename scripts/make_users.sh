#!/bin/bash

set -eu

#user="${1}"

while read user; do
  pw="2025qiime2"
  useradd -m $user

  echo "${user}:${pw}" | chpasswd
  #mkdir -p -m 777 /home/${user}/notebook
  #chown ${user}: /home/${user}/notebook
  #echo "screenfetch" >> /home/${user}/.bashrc
done < /tmp/users.txt

