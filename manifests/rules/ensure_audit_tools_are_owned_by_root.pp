# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_audit_tools_are_owned_by_root
class secure_linux_cis::rules::ensure_audit_tools_are_owned_by_root {
  file { ['/sbin/auditctl', '/sbin/aureport', '/sbin/ausearch', '/sbin/autrace', '/sbin/auditd', '/sbin/augenrules']:
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 'go-w',
  }
}
