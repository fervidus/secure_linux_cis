# @api private
#  Ensure no legacy "+" entries exist in /etc/shadow (Scored)
#
#
# Description:
# The character + in various files used to be markers for systems to insert data from NIS maps at a certain point
# in a system configuration file. These entries are no longer required on most systems, but may exist in files that have been imported
# from other platforms.
#
# @summary  Ensure no legacy "+" entries exist in /etc/shadow (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_legacy_entries_exist_in_etc_shadow
class secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_shadow(
    Boolean $enforced = true,
) {
  if $enforced {
    if $facts[ 'plus_shadow' ] {
      notify { 'ps':
        message  => 'Not in compliance with CIS  (Scored). You have "+" entries in /etc/shadow. Check the plus_shadow fact for details', #lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
