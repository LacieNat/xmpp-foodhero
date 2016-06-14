#!/bin/sh

echo
echo "       -=- ejabberd post installation script -=- "
echo "              (c) 2005-2016 ProcessOne "
echo 
echo "* Checking ejabberd installation"
id=$(id -u)
[ $id -eq 0 ] && {
  useradd -M ejabberd 2>/dev/null
  usermod -d /home/ubuntu/ejabberd-16.04 ejabberd
  chown -R ejabberd /home/ubuntu/ejabberd-16.04/database
  chown -R ejabberd /home/ubuntu/ejabberd-16.04/conf
  chown -R ejabberd /home/ubuntu/ejabberd-16.04/logs
  chown ejabberd /home/ubuntu/ejabberd-16.04
  sed -i -e "s/INSTALLUSER=root/INSTALLUSER=ejabberd/" /home/ubuntu/ejabberd-16.04/bin/ejabberdctl
}
echo 
echo "* Starting ejabberd instance"
cd /home/ubuntu/ejabberd-16.04/bin
./ejabberdctl start
./ejabberdctl started
[ $? -eq 0 ] && {
  echo
  echo "* Creating administrator user"
  ./ejabberdctl register "$1" "$2" "$3"
  echo
  echo "* Stopping ejabberd instance"
  ./ejabberdctl stop
  ./ejabberdctl stopped
  echo "==> Setup finished"
} || {
  echo "* WARNING ! ejabberd can not start"
  echo "Admin user is not created"
  echo "Please check your configuration"
}
