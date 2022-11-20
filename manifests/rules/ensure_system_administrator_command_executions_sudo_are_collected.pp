# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_system_administrator_command_executions_sudo_are_collected {
  $system_audit_rules = @(SYSTEMAUDITRULES/L)
    -a always,exit -F arch=b64 -C euid!=uid -F euid=0 -F auid>=1000 -F auid!=4294967295 -S execve -k actions
    -a always,exit -F arch=b32 -C euid!=uid -F euid=0 -F auid>=1000 -F auid!=4294967295 -S execve -k actions
    | SYSTEMAUDITRULES

  file { '/etc/audit/rules.d/50-actions.rules':
    ensure  => file,
    content => $system_audit_rules,
  }
}
