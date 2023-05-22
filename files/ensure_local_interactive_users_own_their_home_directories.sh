#!/usr/bin/env bash
{
  output=""
  valid_shells="^($( sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d '|' - ))$"
  awk -v pat="$valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd | while read -r user home; do
    owner="$(stat -L -c "%U" "$home")"
    if [ "$owner" != "$user" ]; then
      echo -e "\n- User \"$user\" home directory \"$home\" is owned by user \"$owner\"\n - changing ownership to \"$user\"\n"
      chown "$user" "$home"
    fi
  done
}
