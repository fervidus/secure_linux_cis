# @api private
# 3 Ensure users' .netrc Files are not group or world accessible
#
#
# Description:
# While the system administrator can establish secure permissions for users' .netrc files, the users can easily override these.
#
# @summary 3 Ensure users' .netrc Files are not group or world accessible
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_users_netrc_files_are_not_group_or_world_accessible
class secure_linux_cis::rules::ensure_users_netrc_files_are_not_group_or_world_accessible(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/netrc_access.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/netrc_access.sh'),
    }
    unless $facts[ 'netrc_access' ].empty {
      notify { 'na':
        message  => 'Not in compliance with CIS 3 (Scored). There are .netrc files that are either group or world accessible. Check the netrc_access fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
