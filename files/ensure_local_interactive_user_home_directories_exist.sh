#!/usr/bin/env bash
{
valid_shells="^($( sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d '|' - ))$"
awk -v pat="$valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd | while read -r user home; do
    if [ ! -d "$home" ]; then
      echo -e "\n- User \"$user\" home directory \"$home\" doesn't exist\n- creating home directory \"$home\"\n"
        mkdir "$home"
        chmod g-w,o-wrx "$home"
        chown "$user" "$home"
    fi
  done
}
