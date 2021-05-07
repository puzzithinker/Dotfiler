#!/bin/sh
now=$(date +"%m/%d/%Y @ %T")
echo "Last Update : $now"
apt update -y && apt full-upgrade -y
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
apt-get autoclean -y && apt-get clean -y
apt-get autoremove -y
python3 -m pip install --user -U pipx
go get -u all
pipx upgrade-all
