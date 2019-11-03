# 6.2.6 Ensure root PATH Integrity (Scored)
#
# @summary 6.2.6 Ensure root PATH Integrity (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_6_2_6
class secure_linux_cis::distribution::redhat7::cis_6_2_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/share/cis_scripts/root_path.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/root_path.sh'),
    }

    if $facts['root_path'] {
      notify { 'rp':
        message  => 'Not in compliance with CIS 6.2.6 (Scored). There is a "." or other writable directory in the root executable path. Check the root_path fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
