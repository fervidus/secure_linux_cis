# @api private
# 2 Ensure no ungrouped files or directories exist (Scored)
#
# Description:
# Sometimes when administrators delete users or groups from the system they neglect to remove all files owned by those users or groups.
#
# @summary 2 Ensure no ungrouped files or directories exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_ungrouped_files_or_directories_exist
class secure_linux_cis::rules::ensure_no_ungrouped_files_or_directories_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/ensure_no_ungrouped.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/ensure_no_ungrouped.sh'),
    }
    if $facts['unowned_group_files'] {
      notify { 'gf':
        message  => '[2] You have files or directories that are not owned by a group. Check the unowned_group_files fact for details.',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
