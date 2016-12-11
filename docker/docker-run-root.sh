#!/bin/sh
#set -x
#Fix user home directory permissions 
#  if needed and exec docker-run script

RUN_USER="debian-tor"
USER_DIR="/var/lib/tor"

DIR_OWNER=`stat -c '%U' "$USER_DIR"`

if [ "$DIR_OWNER" != "$RUN_USER" ]; then
	chown -R "$RUN_USER:$RUN_USER" "$USER_DIR"
fi

[ -f "$USER_DIR/torrc" ] || cp /var/tmp/torrc $USER_DIR/torrc
chown "$RUN_USER:$RUN_USER" $USER_DIR/torrc

exec /usr/bin/tor --defaults-torrc $USER_DIR/torrc
