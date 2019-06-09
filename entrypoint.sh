#!/bin/bash
set -e

./nmbd
./winbindd
./smbd --foreground --log-stdout
