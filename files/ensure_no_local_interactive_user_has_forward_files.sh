#!/usr/bin/env bash
{
  output=""
  fname=".forward"
  valid_shells="^($( sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d '|' - ))$"
  awk -v pat="$valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd | (while read -r user home; do
    if [ -f "$home/$fname" ]; then
      echo -e "$output\n- User \"$user\" file: \"$home/$fname\" exists\n - removing file: \"$home/$fname\"\n"
      rm -r "$home/$fname"
    fi
  done
  )
}