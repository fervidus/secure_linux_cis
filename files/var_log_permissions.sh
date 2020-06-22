#!/bin/sh
find /var/log -path '/var/log/puppet*' -prune -o -type f -perm /037 -print
