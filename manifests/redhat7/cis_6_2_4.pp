# 6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored)
#
#
# Description:
# The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration
# file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms.
#
# @summary 6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_6_2_4
class secure_linux_cis::redhat7::cis_6_2_4 (
  Boolean $enforced = true,
) {

  if $enforced {
    if $facts[ 'plus_group' ] {
      notify { 'pg':
        message  => 'Not in compliance with CIS 6.2.4 (Scored). You have "+" entries in /etc/group. Check the plus_group fact for details',#lint:ignore:140chars
        loglevel => 'warning',
      }
    }
  }
}
