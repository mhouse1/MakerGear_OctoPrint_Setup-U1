#!/bin/sh

sudo ~/oprint/bin/python2.7 ~/.octoprint/scripts/changeNetconnectdPassword.py $1
echo "Password changed."
sudo systemctl netconnectd restart
echo "Netconnect restarted."