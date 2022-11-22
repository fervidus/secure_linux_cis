# @api private
#
# @summary Ensure only strong Key Exchange algorithms are used 
#
class secure_linux_cis::rules::ensure_only_strong_key_exchange_algorithms_are_used {
  include secure_linux_cis::sshd_service

  $kex_array = join($secure_linux_cis::approved_kex,',')

  file_line { 'ssh kex':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "KexAlgorithms ${kex_array}",
    match  => '^#?KexAlgorithms',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
