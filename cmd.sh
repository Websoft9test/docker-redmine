#! /bin/bash

echo $REDMINE_PASSWORD
app_pass=$(echo -n $REDMINE_PASSWORD | sha1sum|awk 'BEGIN{ORS=""}{print $1}'|sha1sum|awk '{print $1}')
echo $app_pass
sed -i "s/d033e22ae348aeb5660fc2140aec35850c4da997/$app_pass/g" /usr/src/redmine/db/migrate/001_setup.rb
cat /usr/src/redmine/db/migrate/001_setup.rb
/docker-entrypoint.sh rails server -b 0.0.0.0
