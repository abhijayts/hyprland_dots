#!/bin/bash
loginctl terminate-user $USER
sleep 2
systemctl restart display-manager

