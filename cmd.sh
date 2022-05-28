app_pass=$(echo -n $APP_PASSWORD | sha1sum|awk 'BEGIN{ORS=""}{print $1}'|sha1sum|awk '{print $1}')
mysqladmin -uroot -p$APP_PASSWORD -h 127.0.0.1 redmine -e "update users set hashed_password = '$app_pass', salt ='', admin = 1 where login = 'admin';"
