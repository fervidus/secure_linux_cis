# @api private
# 7 Ensure no duplicate GIDs exist (Scored)
#
#
# Description:
# Although the groupadd program will not let you create a duplicate Group ID (GID), it is possible for an administrator
# to manually edit the /etc/group file and change the GID field.
#
# @summary 7 Ensure no duplicate GIDs exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_duplicate_gids_exist
class secure_linux_cis::rules::ensure_no_duplicate_gids_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/dup_gid.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/dup_gid.sh'),
    }
    unless $facts['duplicate_gid'].empty {
      notify { 'dg':
        message  => 'Not in compliance with CIS 7 (Scored). There are duplicate GIDs that exist in /etc/group. Check the duplicate_gid fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
