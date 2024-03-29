#!/bin/sh

ssh root@SSH_ADDR <<EOF
  cd blogprojectdrf
  git pull 
  source env/bin/activate
  ./manage.py migrate
  sudo systemctl restart nginx
  sudo service gunicorn restart
  sudo service nginx restart
  exit
EOF