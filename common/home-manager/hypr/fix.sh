#!/usr/bin/env bash
sleep 2
killall -e xdg-desktop-portal-wlr
killall xdg-desktop-portal
/usr/bin/xdg-desktop-portal-wlr &
sleep 2
/usr/bin/xdg-desktop-portal &
