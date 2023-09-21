# @api private
#
# @summary Ensure SSH MaxSessions is set to 10 or less
#
class secure_linux_cis::rules::ensure_ssh_maxsessions_is_set_to_10_or_less {
  include secure_linux_cis::sshd_service

  file_line { 'ensure ssh maxsessions is set to 10 or less':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'MaxSessions 10',
    match  => '^MaxSessions\\s+(1[1-9]|[2-9][0-9]|[1-9][0-9][0-9]+)',
    multiple  => true,
    notify => Class['secure_linux_cis::sshd_service'],
  }

  file_line { 'ensure ssh maxsessions is set to 10 or less on per-user basis':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => '	MaxSessions 10',
    match  => '^[\\s]+MaxSessions\\s+(1[1-9]|[2-9][0-9]|[1-9][0-9][0-9]+)',
    multiple  => true,
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
