#!/usr/bin/env bash
{
  output=""
  valid_shells="^($( sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d '|' - ))$"
  awk -v pat="$valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd | while read -r user home; do
        owner="$(stat -L -c "%U" "$home")"
        [ "$owner" != "$user" ] && output="$output\n - User \"$user\" home directory \"$home\" is owned by user \"$owner\""
  done
  if [ -z "$output" ]; then
    echo -e "\n- PASS: - All local interactive users have a home directory\n"
  else
    echo -e "\n- FAIL:\n$output\n"
    exit 1
  fi
}
