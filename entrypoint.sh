#!/bin/sh
conf='${SSMTP_CONF}/ssmtp.conf'
custom_conf='${SSMTP_CONF}/ssmtp_custom.conf'
USE_TLS=${TLS:-'NO'}
USE_STARTTLS=${TLS:-'NO'}

[ ! $HOST ] && echo 'HOST is not set. eg: smtp.gmail.com' && exit 1
[ ! $PORT ] && echo 'PORT is not set. eg: 587' && exit 1
[ ! $AUTH_USER ] && echo 'AUTH_USER is not set. eg: xyz@gmail.com' && exit 1
[ ! $AUTH_PASS ] && echo 'AUTH_PASS is not set. eg: xyz' && exit 1

sed -i "s|{{ mailhub }}|${HOST}:${$PORT}|g" $custom_conf
sed -i "s|{{ AuthUser }}|$AUTH_USER|g" $custom_conf
sed -i "s|{{ AuthPass }}|$AUTH_PASS|g" $custom_conf
sed -i "s|{{ UseTLS }}|$USE_TLS|g" $custom_conf
sed -i "s|{{ UseSTARTTLS }}|$USE_STARTTLS|g" $custom_conf

rm -f $conf
mv $custom_conf $conf

exec "$@"