# @api private
#
# @summary Ensure no legacy "+" entries exist in /etc/shadow 
#
class secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_shadow (
  Boolean $enforced = true,
) {
  if $facts[ 'plus_shadow' ] {
    notify { 'ps':
      message  => 'Not in compliance with CIS  (Scored). You have "+" entries in /etc/shadow. Check the plus_shadow fact for details', #lint:ignore:140chars
      #schedule => 'harden_schedule',
      loglevel => 'warning',
    }
  }
}
