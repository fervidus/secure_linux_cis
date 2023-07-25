#!/usr/bin/env bash 
{ 
    # this script just changes inline all the occurences of TMOUT=xxx to TMOUT=yyy where yyy = 900 if yyy > 900
    # actually cares variable is properly exported as set readonly other manifest: 'ensure_default_user_shell_timeout_is_configured.pp'
    for f in "$BRC" /etc/profile /etc/profile.d/*.sh ; do 

        test -f "$f"  && awk -i inplace 'match($0, /(^|[^\w])TMOUT=([0-9]+)/, capvar) { print (capvar[2] <= 900? $0: gensub(/(^|[^\w])TMOUT=([0-9]+)/, "\\1TMOUT=900", "g")) } !/(^|\s+|[^\w])TMOUT=([0-9]+)/ { print $0 }' $f
    done 
}
