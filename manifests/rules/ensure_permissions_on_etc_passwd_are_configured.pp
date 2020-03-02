# @api private
#  Ensure permissions on /etc/passwd- are configured (Scored)
#
# Description:
# The /etc/passwd- file contains backup user account information.
#
# @summary  Ensure permissions on /etc/passwd- are configured (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_permissions_on_etc_passwd_are_configured
class secure_linux_cis::rules::ensure_permissions_on_etc_passwd_are_configured(
    Boolean $enforced = true,
) {
  if $enforced {
    file {'/etc/passwd':
      ensure   => present,
      schedule => 'harden_schedule',
      owner    => 'root',
      group    => 'root',
      mode     => '0644',
    }
  }
}
