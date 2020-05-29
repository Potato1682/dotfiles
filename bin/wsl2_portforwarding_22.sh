#!/bin/bash
#
# © Potato1682.
# Discord: Potato1682#9684
# EMail: contact@potato1682.ml
#
# Important: this file only work in WSL 2. WSL 1 execute not work properly!
#

IP=$(ifconfig eth0 | grep 'inet ' | awk '{print $2}')

netsh.exe interface portproxy delete v4tov4 listenport=22
netsh.exe interface portproxy add    v4tov4 listenport=22 connectaddress=$IP

# End of file
