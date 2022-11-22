# @api private
#
# @summary Ensure no legacy "+" entries exist in /etc/passwd 
#
class secure_linux_cis::rules::ensure_no_legacy_entries_exist_in_etc_passwd (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts[ 'plus_passwd' ] {
      notify { 'pp':
        message  => 'Not in compliance with CIS  (Scored). You have "+" entries in /etc/passwd. Check the plus_passwd fact for details', #lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
