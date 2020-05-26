# @api private
# 0 Ensure no world writable files exist (Scored)
#
# Description:
# Unix-based systems support variable settings to control access to files. World writable files are the least secure. See the chmod(2)
# man page for more information.
#
# @summary 0 Ensure no world writable files exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_world_writable_files_exist
class secure_linux_cis::rules::ensure_no_world_writable_files_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/ensure_no_world_writable.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/ensure_no_world_writable.sh'),
    }
    if $facts['world_writable'] {
      notify { 'ww':
        message  => '[0] You have one or more world writable files. Check the world_writable fact for details.',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
