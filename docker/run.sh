#!/bin/bash
vncserver :1 -geometry 1024x768
cd noVNC
./utils/launch.sh --vnc localhost:5901 --listen 6080 &
/usr/sbin/sshd
