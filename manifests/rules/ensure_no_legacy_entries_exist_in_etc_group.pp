# @api private
#
# @summary Ensure no legacy "+" entries exist in /etc/group 
#
class secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_group (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts[ 'plus_group' ] {
      notify { 'pg':
        message  => 'Not in compliance with CIS  (Scored). You have "+" entries in /etc/group. Check the plus_group fact for details',#lint:ignore:140chars
        #schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
