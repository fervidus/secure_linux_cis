# @api private
# 5 Ensure changes to system administration scope (sudoers) is collected (Scored)
#
# Description:
# Monitor scope changes for system administrations. If the system has been properly
# configured to force system administrators to log in as themselves first and then use the
# sudo command to execute privileged commands, it is possible to monitor changes in scope.
# The file /etc/sudoers will be written to when the file or its attributes have changed. The
# audit records will be tagged with the identifier "scope."
#
# Rationale:
# Changes in the /etc/sudoers file can indicate that an unauthorized change has been made
# to scope of system administrator activity.
#
# @summary 5 Ensure changes to system administration scope (sudoers) is collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_changes_to_system_administration_scope_sudoers_is_collected
class secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected(
    Boolean $enforced = true,
) {

  Class['::secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    file_line { 'audit.rules sudoers 1':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /etc/sudoers -p wa -k scope',
    }

    file_line { 'audit.rules sudoers 2':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /etc/sudoers.d/ -p wa -k scope',
    }
  }
}
