# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_actions_as_another_user_are_always_logged {
  $system_audit_rules = @(SYSTEMAUDITRULES/L)
    -a always,exit -F arch=b64 -C euid!=uid -F auid!=unset -S execve -k user_emulation
    -a always,exit -F arch=b32 -C euid!=uid -F auid!=unset -S execve -k user_emulation
    | SYSTEMAUDITRULES

  file { '/etc/audit/rules.d/50-user_emulation.rules':
    ensure  => file,
    content => $system_audit_rules,
  }

  Class['secure_linux_cis::rules::ensure_actions_as_another_user_are_always_logged']
  ~> Class['secure_linux_cis::refresh_mount_options']
}
