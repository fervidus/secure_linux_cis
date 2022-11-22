# @api private
#
# @summary Ensure SSH HostbasedAuthentication is disabled 
#
class secure_linux_cis::rules::ensure_ssh_hostbasedauthentication_is_disabled {
  include secure_linux_cis::sshd_service

  file_line { 'ssh host based authentication':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => 'HostbasedAuthentication no',
    match  => '^HostbasedAuthentication',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
