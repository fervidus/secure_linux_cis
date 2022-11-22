# @api private
#
# @summary Ensure the audit configuration is immutable 
#
class secure_linux_cis::rules::ensure_the_audit_configuration_is_immutable {
  Class['secure_linux_cis::rules::ensure_the_audit_configuration_is_immutable']
  ~> Class['secure_linux_cis::reboot']
  file_line { 'audit.rules make immutable':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-e 2',
  }
}
