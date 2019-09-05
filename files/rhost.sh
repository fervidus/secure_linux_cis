#!/bin/bash
< /etc/passwd egrep -v '^(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read dir; do
  for file in $dir/.rhosts; do
    if [ ! -h "$file" -a -f "$file" ]; then
      echo ".rhosts file in $dir"
    fi
  done
done
