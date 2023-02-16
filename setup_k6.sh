#!/bin/bash
set -ex

if ! k6 version &> /dev/null
then
  echo "[setup] installing k6 ..."
  gpg --keyserver-options no-use-temp-files --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
  //echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list
  apt-get update
  apt-get install --nogpgcheck k6
  exit
fi
