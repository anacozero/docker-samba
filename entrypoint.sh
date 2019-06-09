#!/bin/bash
set -e

/etc/init.d/nmbd restart
/etc/init.d/winbind restart
/etc/init.d/smbd restart

