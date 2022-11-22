# @api private
#
# @summary Ensure system administrator actions (sudolog) are collected 
#
class secure_linux_cis::rules::ensure_system_administrator_actions_sudolog_are_collected {
  Class['secure_linux_cis::rules::ensure_system_administrator_actions_sudolog_are_collected']
  ~> Class['secure_linux_cis::reboot']
  file_line { 'audit.rules sudo.log 1':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /var/log/sudo.log -p wa -k actions',
  }
}
