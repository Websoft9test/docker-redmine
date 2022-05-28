apt update
apt install -y mariadb-client
app_pass=$(echo -n $REDMINE_PASSWORD | sha1sum|awk 'BEGIN{ORS=""}{print $1}'|sha1sum|awk '{print $1}')
mysqladmin -uroot -p$REDMINE_PASSWORD -h 127.0.0.1 redmine -e "update users set hashed_password = '$app_pass', salt ='', admin = 1 where login = 'admin';"

/docker-entrypoint.sh rails server -b 0.0.0.0
