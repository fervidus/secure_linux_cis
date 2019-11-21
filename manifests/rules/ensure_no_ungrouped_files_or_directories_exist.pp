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

class secure_linux_cis::rules::ensure_no_ungrouped_files_or_directories_exist {

  if $facts['unowned_group_files'] {
    notify { 'gf':
      message  => '[2] You have files or directories that are not owned by a group. Check the unowned_group_files fact for details.',
      loglevel => 'warning',
    }
  }
}
