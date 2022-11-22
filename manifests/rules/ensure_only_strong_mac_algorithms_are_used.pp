# @api private
#
# @summary Ensure only strong MAC algorithms are used 
#
class secure_linux_cis::rules::ensure_only_strong_mac_algorithms_are_used {
  include secure_linux_cis::sshd_service

  $mac_algorithm_array = join($secure_linux_cis::approved_mac_algorithms,',')

  file_line { 'ssh mac algorithms':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "MACs ${mac_algorithm_array}",
    match  => '^#?MACs',
    notify => Class['secure_linux_cis::sshd_service'],
  }
}
