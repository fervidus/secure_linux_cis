#!/bin/bash
< /etc/passwd grep -Ev '^(root|halt|sync|shutdown)' | awk -F: '($7 !~ "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; do
  if [ -d "$dir" ]; then
    owner=$(stat -L -c "%U" "$dir")
    if [ "$owner" != "$user" ]; then
      echo "The home directory ($dir) of user $user is owned by $owner."
    fi
  fi
done
