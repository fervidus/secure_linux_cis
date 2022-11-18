#!/usr/bin/env bash
{
  echo -e "\n- Start remediation - logfiles have appropriate permissions and ownership"
  find /var/log -type f | while read -r fname; do
    bname="$(basename "$fname")"
    case "$bname" in
      lastlog | lastlog.* | wtmp | wtmp.* | btmp | btmp.*)
        ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,2,4,6][0,4]\h*$' && echo -e "- changing mode on \"$fname\"" && chmod ug-x,o-wx "$fname"
        ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*root\h*$' && echo -e "- changing owner on \"$fname\"" && chown root "$fname"
        ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(utmp|root)\h*$' && echo -e "- changing group on \"$fname\"" && chgrp root "$fname"
      ;;
      secure | auth.log)
        ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,4]0\h*$'  && echo -e "- changing mode on \"$fname\"" && chmod u-x,g-wx,o-rwx "$fname"
        ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*(syslog|root)\h*$' && echo -e "- changing owner on \"$fname\"" && chown root "$fname"
        ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(adm|root)\h*$' && echo -e "- changing group on \"$fname\"" && chgrp root "$fname"
      ;;
      SSSD | sssd)
        ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,2,4,6]0\h*$' && echo -e "- changing mode on \"$fname\"" && chmod ug-x,o-rwx "$fname"
        ! stat -Lc "%U" "$fname" | grep -Piq -- '^\h*(SSSD|root)\h*$' && echo -e "- changing owner on \"$fname\"" && chown root "$fname"
        ! stat -Lc "%G" "$fname" | grep -Piq -- '^\h*(SSSD|root)\h*$' && echo -e "- changing group on \"$fname\"" && chgrp root "$fname"
      ;;
      gdm | gdm3)
        ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,2,4,6]0\h*$' && echo -e "- changing mode on \"$fname\"" && chmod ug-x,o-rwx
        ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*root\h*$' && echo -e "- changing owner on \"$fname\"" && chown root "$fname"
        ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(gdm3?|root)\h*$' && echo -e "- changing group on \"$fname\"" && chgrp root "$fname"
      ;;
      *.journal)
        ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,4]0\h*$' && echo -e "- changing mode on \"$fname\"" && chmod u-x,g-wx,o-rwx "$fname"          
        ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*root\h*$' && echo -e "- changing owner on \"$fname\"" && chown root "$fname"
        ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(systemd-journal|root)\h*$'  && echo -e "- changing group on \"$fname\"" && chgrp root "$fname"
      ;;
      *)
        ! stat -Lc "%a" "$fname" | grep -Pq -- '^\h*[0,2,4,6][0,4]0\h*$' && echo -e "- changing mode on \"$fname\"" && chmod u-x,g-wx,o-rwx "$fname"
        ! stat -Lc "%U" "$fname" | grep -Pq -- '^\h*(syslog|root)\h*$' && echo -e "- changing owner on \"$fname\"" && chown root "$fname"
        ! stat -Lc "%G" "$fname" | grep -Pq -- '^\h*(adm|root)\h*$' && echo -e "- changing group on \"$fname\"" && chgrp root "$fname"
      ;;
    esac
  done
  echo -e "- End remediation - logfiles have appropriate permissions and ownership\n"
}