# @api private
#  Ensure apparmor is installed (Scored)
#
#
# Description:
# AppArmor provides Mandatory Access Controls.
#
# Rationale:
# Without a Mandatory Access Control system installed only the default Discretionary Access
# Control system will be available.
#
# @summary  Ensure apparmor is installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_apparmor_is_installed
class secure_linux_cis::rules::ensure_apparmor_is_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    package { ['apparmor', 'apparmor-utils']:
      ensure   => installed,
      schedule => 'harden_schedule',
    }
  }
}
