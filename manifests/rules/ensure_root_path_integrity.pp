# @api private
#  Ensure root PATH Integrity (Scored)
#
# @summary  Ensure root PATH Integrity (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_root_path_integrity
class secure_linux_cis::rules::ensure_root_path_integrity {
    file { '/usr/share/cis_scripts/root_path.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/root_path.sh'),
    }
    unless $facts['root_path'].empty {
      notify { 'rp':
        message  => 'Not in compliance with CIS  (Scored). There is a "." or other writable directory in the root executable path. Check the root_path fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
}
