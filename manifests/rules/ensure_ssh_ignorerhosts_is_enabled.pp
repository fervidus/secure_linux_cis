# @api private
#
# @summary Ensure SSH IgnoreRhosts is enabled 
#
class secure_linux_cis::rules::ensure_ssh_ignorerhosts_is_enabled {
  include secure_linux_cis::sshd_service

  file_line { 'ssh ignore rhosts':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => 'IgnoreRhosts yes',
    match  => '^#?IgnoreRhosts',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
