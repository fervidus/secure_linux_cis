#!/bin/bash
< /etc/passwd grep -Ev '^(root|halt|sync|shutdown)' | awk -F: '($7 !~ "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read dir; do
  for file in $dir/.[A-Za-z0-9]*; do
    if [ ! -h "$file" ] && [ -f "$file" ]; then
      fileperm="$(ls -ld "$file" | cut -f1 -d" ")"
      if [ "$(echo "$fileperm" | cut -c6)" != "-" ]; then
        echo "Group Write permission set on file $file"
      fi
      if [ "$(echo "$fileperm" | cut -c9)"  != "-" ]; then
        echo "Other Write permission set on file $file"
      fi
    fi
  done
done
