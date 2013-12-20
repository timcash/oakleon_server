#!/bin/bash
sudo -i
mv oakleon.service /media/state/units
systemctl daemon-reload
systemctl restart local-enable.service
docker ps
