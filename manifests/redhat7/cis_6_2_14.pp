# 6.2.14 Ensure no users have .rhosts files (Scored)
#
#
# Description:
# While no .rhosts files are shipped by default, users can easily create them.
#
# @summary 6.2.14 Ensure no users have .rhosts files (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_14
class secure_linux_cis::redhat7::cis_6_2_14 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/share/applications/cis_scripts/rhost.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/rhost.sh'),
    }

    if !($facts['rhost_files'].empty) {

      notify { 'rf':
        message  => 'Not in compliance with CIS 6.2.14 (Scored). A user(s) has .rhost files in their home directory. Check the rhost_files fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
