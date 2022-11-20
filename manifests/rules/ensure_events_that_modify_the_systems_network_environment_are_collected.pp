# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_events_that_modify_the_systems_network_environment_are_collected {
  $system_audit_rules = @("SYSTEMAUDITRULES"/L)
    -a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale
    -a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale
    -w /etc/issue -p wa -k system-locale
    -w /etc/issue.net -p wa -k system-locale
    -w /etc/hosts -p wa -k system-locale
    -w /etc/sysconfig/network -p wa -k system-locale
    | SYSTEMAUDITRULES

  file { '/etc/audit/rules.d/50-system_local.rules':
    ensure  => file,
    content => $system_audit_rules,
  }
}
