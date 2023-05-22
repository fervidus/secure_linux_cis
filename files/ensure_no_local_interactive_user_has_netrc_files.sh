#!/usr/bin/env bash
{
  perm_mask='0177'
  valid_shells="^($( sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d '|' - ))$"
  awk -v pat="$valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd | while read -r user home; do
  if [ -f "$home/.netrc" ]; then
    echo -e "\n- User \"$user\" file: \"$home/.netrc\" exists\n - removing file: \"$home/.netrc\"\n"
    rm -f "$home/.netrc"
  fi
 done
}
