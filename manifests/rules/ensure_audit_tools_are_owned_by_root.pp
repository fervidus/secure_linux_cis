# @api private
#
# @summary Ensure audit tools are owned by root 
#
class secure_linux_cis::rules::ensure_audit_tools_are_owned_by_root {
  file { ['/sbin/auditctl', '/sbin/aureport', '/sbin/ausearch', '/sbin/autrace', '/sbin/auditd', '/sbin/augenrules']:
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => 'go-w',
  }
}
