#!/bin/bash
set -e

echo $PASS | kinit -V $UNAME@$REALM
net ads join -U"$UNAME"%"$PASS"


/etc/init.d/nmbd restart
/etc/init.d/winbind restart


exec "$@"
