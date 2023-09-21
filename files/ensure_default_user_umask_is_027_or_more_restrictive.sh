#!/usr/bin/env bash 
{ 
    for f in /etc/bashrc /etc/profile /etc/profile.d/*.sh ; do 

        # TODO: does not work with symbolic umasks yet
        test -f "$f"  && awk -i inplace 'match($0, /(^|[^\w])umask\s+([^\s]+)/, capvar) { print (capvar[2] >= 027? $0: gensub(/(^|[^\w])umask\s+([^\s]+)/, "\\1umask 027", "g")) } !/(^|[^\w])umask\s+([^\s]+)/ { print $0 }' $f
    done 

    awk -i inplace 'match($0, /(^|[^\w])UMASK\s+([^\s]+)/, capvar) { print (capvar[2] >= 027? $0: gensub(/(^|[^\w])UMASK\s+([^\s]+)/, "\\1UMASK 027", "g")) } !/(^|[^\w])UMASK\s+([^\s]+)/ { print $0 }' /etc/login.defs
}
