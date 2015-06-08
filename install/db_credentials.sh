#!/bin/sh

DBUSER=$(echo $DATABASE_URL | awk -F '[:/@]*' '{print $2}')
DBPASS=$(echo $DATABASE_URL | awk -F '[:/@]*' '{print $3}')
DBHOST=$(echo $DATABASE_URL | awk -F '[:/@]*' '{print $4}')
DBPORT=$(echo $DATABASE_URL | awk -F '[:/@]*' '{print $5}')
DBNAME=$(echo $DATABASE_URL | awk -F '[:/@]*' '{print $6}')



echo > /app/drupal/site/default/settings.php << EOF
$databases['default']['default'] = array(
      'database' => '$DBNAME',
      'username' => '$DBUSER',
      'password' => '$DBPASS',
      'host' => '$DBHOST',
      'port' => '$DBPORT',
      'driver' => 'mysql',
      'prefix' => '',
);




EOF
