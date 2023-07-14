# @api private
#
# @summary Ensure SSH MaxAuthTries is set to 4 or less
#
class secure_linux_cis::rules::ensure_ssh_maxauthtries_is_set_to_4_or_less {
  include secure_linux_cis::sshd_service

  file_line { 'ensure ssh maxauthtries is set to 4 or less':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'MaxAuthTries 4',
    match  => '^MaxAuthTries\\s+([5-9]|[1-9][0-9]+)',
    multiple  => true,
    notify => Class['secure_linux_cis::sshd_service'],
  }

  file_line { 'ensure ssh maxauthtries is set to 4 or less on per-user basis':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => '	MaxAuthTries 4',
    match  => '^[\\s]+MaxAuthTries\\s+([5-9]|[1-9][0-9]+)',
    multiple  => true,
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
