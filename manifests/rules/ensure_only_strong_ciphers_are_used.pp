# @api private
#
# @summary Ensure only strong Ciphers are used 
#
class secure_linux_cis::rules::ensure_only_strong_ciphers_are_used {
  include secure_linux_cis::sshd_service

  $ciphers_array = join($secure_linux_cis::approved_ciphers, ',')

  file_line { 'ssh ciphers':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "Ciphers ${ciphers_array}",
    match  => '^#?Ciphers',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
