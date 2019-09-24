# 6.2.17 Ensure no duplicate GIDs exist (Scored)
#
#
# Description:
# Although the groupadd program will not let you create a duplicate Group ID (GID), it is possible for an administrator
# to manually edit the /etc/group file and change the GID field.
#
# @summary 6.2.17 Ensure no duplicate GIDs exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_17
class secure_linux_cis::redhat7::cis_6_2_17 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/usr/share/cis_scripts/dup_gid.sh':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0700',
      content => file('secure_linux_cis/dup_gid.sh'),
    }

    if !($facts['duplicate_gid'].empty) {

      notify { 'dg':
        message  => 'Not in compliance with CIS 6.2.17 (Scored). There are duplicate GIDs that exist in /etc/group. Check the duplicate_gid fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
