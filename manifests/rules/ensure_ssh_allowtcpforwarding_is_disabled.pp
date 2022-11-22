# @api private
#
# @summary Ensure SSH AllowTcpForwarding is disabled 
#
class secure_linux_cis::rules::ensure_ssh_allowtcpforwarding_is_disabled {
  include secure_linux_cis::sshd_service

  file_line { 'ssh tcpforward':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'AllowTcpForwarding no',
    match  => '^#?[\r\n\f\v ]?AllowTcpForwarding',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
