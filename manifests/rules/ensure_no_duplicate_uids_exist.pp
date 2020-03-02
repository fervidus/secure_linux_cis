# @api private
# 6 Ensure no duplicate UIDs exist (Scored)
#
#
# Description:
# Although the useradd program will not let you create a duplicate User ID (UID),
# it is possible for an administrator to manually edit the /etc/passwd file and change the UID field.
#
# @summary 6 Ensure no duplicate UIDs exist (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_duplicate_uids_exist
class secure_linux_cis::rules::ensure_no_duplicate_uids_exist(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/dup_uid.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/dup_uid.sh'),
    }
    unless $facts['duplicate_uid'].empty {
      notify { 'du':
        message  => 'Not in compliance with CIS 6 (Scored). There are duplicate UIDs in /etc/passwd. Check the duplicate_uid fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
