#!/bin/sh

echo
echo "       -=- ejabberd pre uninstallation script -=- "
echo "              (c) 2005-2016 ProcessOne "
echo 
echo "* Stopping ejabberd instance"
/home/ubuntu/ejabberd-16.04/bin/ejabberdctl stop 
/home/ubuntu/ejabberd-16.04/bin/ejabberdctl stopped
/home/ubuntu/ejabberd-16.04/bin/epmd -names | grep -q name || {
  echo "* Stopping Erlang Portmapper Deamon"
  /home/ubuntu/ejabberd-16.04/bin/epmd -kill
}
echo "* backup current config"
cp -r /home/ubuntu/ejabberd-16.04/conf /home/ubuntu/ejabberd-16.04/conf.$(date +%y%m%d)
echo 
echo "==> Pre uninstallation tasks finished"
