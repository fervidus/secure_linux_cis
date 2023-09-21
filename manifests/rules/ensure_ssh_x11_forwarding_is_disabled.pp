# @api private
#
# @summary Ensure SSH X11 forwarding is disabled
#
class secure_linux_cis::rules::ensure_ssh_x11_forwarding_is_disabled {
  include secure_linux_cis::sshd_service

  file_line { 'ensure ssh x11 forwarding is disabled':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'X11Forwarding no',
    match  => '^X11Forwarding',
    multiple  => true,
    notify => Class['secure_linux_cis::sshd_service'],
  }

  file_line { 'ensure ssh x11 forwarding is disabled on per-user basis':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => '	X11Forwarding no',
    match  => '^[\\s]+X11Forwarding',
    multiple  => true,
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
