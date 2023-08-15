# @api private
#
# @summary Ensure accounts in /etc/passwd use shadowed passwords 
#
class secure_linux_cis::rules::ensure_accounts_in_etc_passwd_use_shadowed_passwords {
  exec { 'Ensure accounts in /etc/passwd use shadowed passwords':
    command   => "/usr/bin/sed -e 's/^\\([a-zA-Z0-9_]*\\):[^:]*:/\\1:x:/' -i /etc/passwd",
    onlyif    => "/usr/bin/egrep -qv '^[^:]+:x:' /etc/passwd",
    logoutput => true,
  }
}
