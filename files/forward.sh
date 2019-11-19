#!/bin/bash
< /etc/passwd grep -Ev '^(root|halt|sync|shutdown)' | awk -F: '($7 !~ "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read dir; do
  for file in $dir/.forward; do
    if [ ! -h "$file" ] && [ -f "$file" ]; then
      echo "warning $dir/.forward file exists"
    fi
  done
done
