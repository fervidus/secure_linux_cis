# 6.1.12 Ensure no ungrouped files or directories exist (Scored)
#
# Description:
# Sometimes when administrators delete users or groups from the system they neglect to remove all files owned by those users or groups.
#
# @summary 6.1.12 Ensure no ungrouped files or directories exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_1_12
class secure_linux_cis::redhat7::cis_6_1_12 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['unowned_group_files'] {
      notify { 'gf':
        message  => '[6.1.12] You have files or directories that are not owned by a group. Check the unowned_group_files fact for details.',
        loglevel => 'warning',
      }
    }
  }
}
