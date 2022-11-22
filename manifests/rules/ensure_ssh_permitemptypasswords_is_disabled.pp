# @api private
#
# @summary Ensure SSH PermitEmptyPasswords is disabled 
#
class secure_linux_cis::rules::ensure_ssh_permitemptypasswords_is_disabled {
  include secure_linux_cis::sshd_service

  file_line { 'ssh permit empty password':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => 'PermitEmptyPasswords no',
    match  => '^\s*PermitEmptyPasswords',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
