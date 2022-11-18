#!/usr/bin/env bash
{
  perm_mask='0022'
  valid_shells="^($( sed -rn '/^\//{s,/,\\\\/,g;p}' /etc/shells | paste -s -d '|' - ))$"
  awk -v pat="$valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd | while read -r user home; do
    find "$home" -type f -name '.*' | while read -r dfile; do
      mode=$( stat -L -c '%#a' "$dfile" )
      if [ $(( $mode & $perm_mask )) -gt 0 ]; then
        echo -e "\n- Modifying User \"$user\" file: \"$dfile\"\n- removing group and other write permissions"
        chmod go-w "$dfile"
      fi
    done
  done
}