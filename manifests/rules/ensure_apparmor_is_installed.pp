# @api private
#  Ensure apparmor is installed (Scored)
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
class secure_linux_cis::rules::ensure_apparmor_is_installed {
  package { ['apparmor', 'apparmor-utils']:
    ensure   => installed,
  }
}
