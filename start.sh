#!/bin/bash
set -e

/etc/init.d/nmbd restart
/etc/init.d/winbind restart
