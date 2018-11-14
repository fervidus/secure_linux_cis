# 6.2.5 Ensure root is the only UID 0 account (Scored)
#
#
# Description:
# Any account with UID 0 has superuser privileges on the system.
#
# @summary 6.2.5 Ensure root is the only UID 0 account (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_5
  class secure_linux_cis::redhat7::cis_6_2_5 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts['root_uid'] and $facts[ 'root_uid'] != 'root' {
      notify { 'ru':
        message  => 'Not in compliance with CIS 6.2.5 (Scored). One or more users have superuser privileges on the system other than Root. Check the root_uid fact for details', # lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
