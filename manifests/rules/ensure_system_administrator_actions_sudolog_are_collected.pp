# @api private
# 6 Ensure system administrator actions (sudolog) are collected (Scored)
#
# Description:
# Monitor the sudo log file. If the system has been properly configured to disable the use of
# the su command and force all administrators to have to log in first and then use sudo to
# execute privileged commands, then all administrator commands will be logged to
# /var/log/sudo.log . Any time a command is executed, an audit event will be triggered as
# the /var/log/sudo.log file will be opened for write and the executed administration
# command will be written to the log.
#
# Rationale:
# Changes in /var/log/sudo.log indicate that an administrator has executed a command or
# the log file itself has been tampered with. Administrators will want to correlate the events
# written to the audit trail with the records written to /var/log/sudo.log to verify if
# unauthorized commands have been executed.
#
# @summary 6 Ensure system administrator actions (sudolog) are collected (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_system_administrator_actions_sudolog_are_collected
class secure_linux_cis::rules::ensure_system_administrator_actions_sudolog_are_collected(
    Boolean $enforced = true,
) {
  Class['::secure_linux_cis::rules::ensure_system_administrator_actions_sudolog_are_collected']
  ~> Class['::secure_linux_cis::reboot']

  if $enforced {
    file_line { 'audit.rules sudo.log 1':
      ensure   => present,
      schedule => 'harden_schedule',
      path     => '/etc/audit/rules.d/audit.rules',
      line     => '-w /var/log/sudo.log -p wa -k actions',
    }
  }
}
