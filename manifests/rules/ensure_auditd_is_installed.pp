# @api private
#  Ensure auditd is installed (Scored)
#
#
# Description:
# auditd is the userspace component to the Linux Auditing System. It's responsible for
# writing audit records to the disk
#
# Rationale:
# The capturing of system events provides system administrators with information to allow
# them to determine if unauthorized access to their system is occurring.
#
# @summary  Ensure auditd is installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_auditd_is_installed
class secure_linux_cis::rules::ensure_auditd_is_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    # Note: CIS also wants package auditd installed. This is a dependency of
    # audispd-plugins, and also managed by
    # secure_linux_cis::ensure_auditd_service_is_enabled, so should not be
    # listed in this class also.
    package { 'audispd-plugins':
      ensure   => installed,
      schedule => 'harden_schedule',
    }
  }
}
