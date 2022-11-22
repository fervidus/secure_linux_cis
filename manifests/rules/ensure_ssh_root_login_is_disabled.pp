# @api private
#
# @summary Ensure SSH root login is disabled 
#
class secure_linux_cis::rules::ensure_ssh_root_login_is_disabled {
  include secure_linux_cis::sshd_service

  file_line { 'ssh permit root login':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitRootLogin no',
    match  => '^#?PermitRootLogin',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
