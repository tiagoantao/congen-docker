#!/bin/bash
vncserver :1 -geometry 1024x768
cd noVNC
/usr/sbin/sshd
./utils/launch.sh --vnc localhost:5901 --listen 6080 
