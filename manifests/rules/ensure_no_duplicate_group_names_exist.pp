# @api private
# 9 Ensure no duplicate group names exist (Scored)
#
#
# Description:
# Although the groupadd program will not let you create a duplicate group name, it is possible for an administrator to manually edit
# the /etc/group file and change the group name.
#
# @summary 9 Ensure no duplicate group names exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_duplicate_group_names_exist
class secure_linux_cis::rules::ensure_no_duplicate_group_names_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/dup_group.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/dup_group.sh'),
    }
    unless $facts['duplicate_group'].empty {
      notify { 'dgrp':
        message  => 'Not in compliance with CIS 9 (Scored). There is a duplicate group name(s) in /etc/group. Check the duplicate_group fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
