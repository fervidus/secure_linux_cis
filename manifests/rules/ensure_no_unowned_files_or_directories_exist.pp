# @api private
# 1 Ensure no unowned files or directories exist (Scored)
#
# Description:
# Sometimes when administrators delete users from the password file they neglect to remove all files owned by those users from the system.
#
# @summary 1 Ensure no unowned files or directories exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_unowned_files_or_directories_exist
class secure_linux_cis::rules::ensure_no_unowned_files_or_directories_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/ensure_no_unowned.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/ensure_no_unowned.sh'),
    }
    if $facts['unowned_user_files'] {
      notify { 'uf':
        message  => '[1] You have files or directories that are not owned by a user. Check the unowned_user_files fact for details.',
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
