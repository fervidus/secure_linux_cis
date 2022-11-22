# @api private
#
# @summary Ensure events that modify the system's Mandatory Access Controls are collected 
#
class secure_linux_cis::rules::ensure_events_that_modify_the_systems_mandatory_access_controls_are_collected {
  $system_audit_rules = @(SYSTEMAUDITRULES/L)
    -w /etc/selinux/ -p wa -k MAC-policy
    -w /usr/share/selinux/ -p wa -k MAC-policy
    | SYSTEMAUDITRULES

  file { '/etc/audit/rules.d/50-MAC_policy.rules':
    ensure  => file,
    content => $system_audit_rules,
  }
}
