#!/bin/bash
set -e

cp /etc/hosts ~/hosts.new
sed -i "/127.0.0.1.*/a 127.0.0.1       $HOSTNAME.$REALM $HOSTNAME" ~/hosts.new
cp ~/hosts.new /etc/hosts

echo $PASS | kinit -V $UNAME@$REALM
net ads join -U"$UNAME"%"$PASS"


/etc/init.d/nmbd restart
/etc/init.d/winbind restart
/etc/init.d/smbd restart

exec "$@"
