# @api private
# 1 Ensure no users have .forward files (Scored)
#
#
# Description:
# The .forward file specifies an email address to forward the user's mail to.
#
# @summary 1 Ensure no users have .forward files (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_no_users_have_forward_files
class secure_linux_cis::rules::ensure_no_users_have_forward_files(
    Boolean $enforced = true,
) {
  if $enforced {
    file { '/usr/share/cis_scripts/forward.sh':
      ensure   => file,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0700',
      content  => file('secure_linux_cis/forward.sh'),
    }
    unless $facts['forward_files'].empty {
      notify { 'ff':
        message  => 'Not in compliance with CIS 1 (Scored). There are .forward files on the system. Check the forward_files fact for details',#lint:ignore:140chars
        schedule => 'harden_schedule',
        loglevel => 'warning',
      }
    }
  }
}
