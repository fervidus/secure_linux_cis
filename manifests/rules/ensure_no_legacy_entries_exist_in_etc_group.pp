#  Ensure no legacy "+" entries exist in /etc/group (Scored)
#
#
# Description:
# The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration
# file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms.
#
# @summary  Ensure no legacy "+" entries exist in /etc/group (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_legacy_entries_exist_in_etc_group

class secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_group {

  if $facts[ 'plus_group' ] {
    notify { 'pg':
      message  => 'Not in compliance with CIS  (Scored). You have "+" entries in /etc/group. Check the plus_group fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
