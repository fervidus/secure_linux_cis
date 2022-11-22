# @api private
#
# @summary Ensure SSH Idle Timeout Interval is configured 
#
class secure_linux_cis::rules::ensure_ssh_idle_timeout_interval_is_configured {
  include secure_linux_cis::sshd_service

  if $secure_linux_cis::client_alive_interval > 300 or $secure_linux_cis::client_alive_interval < 1 {
    fail('The Client Alive Interval has been manually set past the 1 - 300 threshold')
  }
  file_line { 'ssh alive interval':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "ClientAliveInterval ${secure_linux_cis::client_alive_interval}",
    match  => '^\s*ClientAliveInterval',
    notify => Class['secure_linux_cis::sshd_service'],
  }
  file_line { 'ssh alive count max':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "ClientAliveCountMax ${secure_linux_cis::client_alive_count_max}",
    match  => '^\s*ClientAliveCountMax',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
