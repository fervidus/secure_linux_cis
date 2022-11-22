# @api private
#
# @summary Ensure events that modify user/group information are collected 
#
class secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected {
  Class['secure_linux_cis::rules::ensure_events_that_modify_user_group_information_are_collected']
  ~> Class['secure_linux_cis::reboot']
  file_line { 'audit.rules user/group 1':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /etc/group -p wa -k identity',
  }
  file_line { 'audit.rules user/group 2':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /etc/passwd -p wa -k identity',
  }
  file_line { 'audit.rules user/group 3':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /etc/gshadow -p wa -k identity',
  }
  file_line { 'audit.rules user/group 4':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /etc/shadow -p wa -k identity',
  }
  file_line { 'audit.rules user/group 5':
    ensure => present,
    path   => '/etc/audit/rules.d/audit.rules',
    line   => '-w /etc/security/opasswd -p wa -k identity',
  }
}
