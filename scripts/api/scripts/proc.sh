#!/bin/bash
#exec env --ignore-environment /bin/bash
#export TERM=xterm-color
#base64 | tr -d \\n
#stty rows 40 cols 120
#/bin/bash -l

wget -q --show-progress -O ~/.ec/scripts/proc-bootstrap.sh https://raw.githubusercontent.com/EC-Release/sdk/disty/scripts/api/scripts/proc-bootstrap.sh
chmod +x ~/.ec/scripts/proc-bootstrap.sh
source ~/.ec/scripts/proc-bootstrap.sh "$@"
