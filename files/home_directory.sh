#!/bin/bash
< /etc/passwd grep -Ev '^(root|halt|sync|shutdown)' | awk -F: '($7 !~ "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read -r user dir; do
  if [ ! -d "$dir" ]; then
    echo "The home directory ($dir) of user $user does not exist."
  fi
done
