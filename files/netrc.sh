#!/bin/bash
< /etc/passwd egrep -v '^(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read dir; do
  for file in $dir/.netrc; do
    if [ ! -h "$file" -a -f "$file" ]; then
      echo ".netrc file $dir/.netrc exists"
    fi
  done
done
