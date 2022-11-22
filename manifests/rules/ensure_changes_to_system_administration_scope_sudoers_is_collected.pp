# @api private
#
# @summary Ensure changes to system administration scope (sudoers) is collected 
#
class secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected {
  Class['secure_linux_cis::rules::ensure_changes_to_system_administration_scope_sudoers_is_collected']
  ~> Class['secure_linux_cis::reboot']
  file_line { 'audit.rules sudoers 1':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /etc/sudoers -p wa -k scope',
  }

  file_line { 'audit.rules sudoers 2':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /etc/sudoers.d/ -p wa -k scope',
  }
}
