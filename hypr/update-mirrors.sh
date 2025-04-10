#!/bin/bash
rate-mirrors arch | sudo /usr/bin/tee /etc/pacman.d/mirrorlist
