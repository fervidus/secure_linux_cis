# @api private
#  Ensure system is disabled when audit logs are full (Scored)
#
# Description:
# The auditd daemon can be configured to halt the system when the audit logs are full.
#
# Rationale:
# In high security contexts, the risk of detecting unauthorized access or nonrepudiation
# exceeds the benefit of the system's availability.
#
# @summary  Ensure system is disabled when audit logs are full (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_system_is_disabled_when_audit_logs_are_full
class secure_linux_cis::rules::ensure_system_is_disabled_when_audit_logs_are_full(
    Boolean $enforced = true,
) {
  require ::secure_linux_cis::rules::ensure_auditd_service_is_enabled

  if $enforced {
    file_line { 'space_left_action':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/auditd.conf',
      line     => 'space_left_action = email',
      match    => '^space_left_action',
    }
    file_line { 'action_mail_acct':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/auditd.conf',
      line     => 'action_mail_acct = root',
      match    => '^action_mail_acct',
    }
    file_line { 'admin_space_left_action':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/auditd.conf',
      line     => 'admin_space_left_action = halt',
      match    => '^admin_space_left_action',
    }
  }
}
