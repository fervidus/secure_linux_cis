# 6.1.11 Ensure no unowned files or directories exist (Scored)
#
# Description:
# Sometimes when administrators delete users from the password file they neglect to remove all files owned by those users from the system.
#
# @summary 6.1.11 Ensure no unowned files or directories exist (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_1_11
class secure_linux_cis::redhat7::cis_6_1_11 (
  Boolean $enforced = true,
) {

  if $enforced {

      if $facts['unowned_user_files'] {

        notify { 'uf':
          message  => '[6.1.11] You have files or directories that are not owned by a user. Check the unowned_user_files fact for details.',
          loglevel => 'warning',
        }
      }
  }
}
