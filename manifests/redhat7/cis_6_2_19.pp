# 6.2.19 Ensure no duplicate group names exist (Scored)
#
#
# Description:
# Although the groupadd program will not let you create a duplicate group name, it is possible for an administrator to manually edit
# the /etc/group file and change the group name.
#
# @summary 6.2.19 Ensure no duplicate group names exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_19
class secure_linux_cis::redhat7::cis_6_2_19 (
  Boolean $enforced = true,
) {

  if $enforced {

    file { '/tmp/cis_scripts/dup_group.sh':
      owner   => 'root',
      group   => 'root',
      mode    => '0711',
      content => file('secure_linux_cis/dup_group.sh'),
      # source => 'puppet:///modules/secure_linux_cis/dup_group.sh',
    }

    if !($facts['duplicate_group'].empty) {

      notify { 'dgrp':
        message  => 'Not in compliance with CIS 6.2.19 (Scored). There is a duplicate group name(s) in /etc/group. Check the duplicate_group fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
