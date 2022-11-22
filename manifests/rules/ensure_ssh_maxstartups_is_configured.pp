# @api private
#
# @summary Ensure SSH MaxStartups is configured 
#
class secure_linux_cis::rules::ensure_ssh_maxstartups_is_configured {
  include secure_linux_cis::sshd_service

  file_line { 'ssh max startups':
    ensure => present,
    path   => '/etc/ssh/sshd_config',
    line   => "MaxStartups ${secure_linux_cis::max_startups}",
    match  => '^\s*MaxStartups',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
