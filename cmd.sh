rails server -b 0.0.0.0
apt update
apt install -y mariadb-client
app_pass=$(echo -n $REDMINE_PASSWORD | sha1sum|awk 'BEGIN{ORS=""}{print $1}'|sha1sum|awk '{print $1}')
mysql -uroot -p$REDMINE_PASSWORD -h db redmine -e "update users set hashed_password = '$app_pass', salt ='', admin = 1 where login = 'admin';"

tail -f /dev/null

