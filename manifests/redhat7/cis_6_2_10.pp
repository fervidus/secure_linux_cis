# 6.2.10 Ensure users' dot files are not group or world writable (Scored)
#
#
# Description:
# While the system administrator can establish secure permissions for users' "dot" files, the users can easily override these.
#
# @summary 6.2.10 Ensure users' dot files are not group or world writable (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_10
class secure_linux_cis::redhat7::cis_6_2_10 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/dot_file_wr.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/dot_file_wr.sh'),
    }

    if $facts['dot_file_writable'] != '' {

      notify { 'dfw':
        message  => 'Not in compliance with CIS 6.2.10 (Scored). There are DOT files that are either group or world writable. Check the dot_file_writable fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
