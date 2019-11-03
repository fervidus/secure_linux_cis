#!/bin/bash
< /etc/passwd grep -Ev '^(root|halt|sync|shutdown)' | awk -F: '($7 !~ "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read dir; do
  for file in $dir/.netrc; do
    if [ ! -h "$file" ] && [ -f "$file" ]; then
      echo "warning $dir/.netrc file exists"
    fi
  done
done
