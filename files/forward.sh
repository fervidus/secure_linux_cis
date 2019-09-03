#!/bin/bash
cat /etc/passwd | egrep -v '^(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; do
  if [ ! -h "$dir/.forward" -a -f "$dir/.forward" ]; then
    echo ".forward file $dir/.forward exists"
  fi
done
