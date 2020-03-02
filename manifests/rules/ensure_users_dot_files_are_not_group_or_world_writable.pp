# @api private
# 0 Ensure users' dot files are not group or world writable (Scored)
#
#
# Description:
# While the system administrator can establish secure permissions for users' "dot" files, the users can easily override these.
#
# @summary 0 Ensure users' dot files are not group or world writable (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_users_dot_files_are_not_group_or_world_writable
class secure_linux_cis::rules::ensure_users_dot_files_are_not_group_or_world_writable(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/dot_file_wr.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/dot_file_wr.sh'),
    }
    unless $facts['dot_file_writable'].empty {
      notify { 'dfw':
        message  => 'Not in compliance with CIS 0 (Scored). There are DOT files that are either group or world writable. Check the dot_file_writable fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
