# @param enforced Should this rule be enforced
# @api private
# Ensure only strong MAC algorithms are used
#
# Description:
# This variable limits the types of MAC algorithms that SSH can use during communication.
#
# Rationale:
# MD5 and 96-bit MAC algorithms are considered weak and have been shown to increase
# exploitability in SSH downgrade attacks. Weak algorithms continue to have a great deal of
# attention as a weak spot that can be exploited with expanded computing power. An
# attacker that breaks the algorithm could take advantage of a MiTM position to decrypt the
# SSH tunnel and capture credentials and information
# @summary Only enable strong MAC algorithms
#
# @example
#   include secure_linux_cis::ensure_only_strong_mac_algorithms_are_used
class secure_linux_cis::rules::ensure_only_strong_mac_algorithms_are_used {
  include secure_linux_cis::service

  $acceptable_values = [
    'hmac-sha2-512-etm@openssh.com',
    'hmac-sha2-256-etm@openssh.com',
    'hmac-sha2-512',
    'hmac-sha2-256',
  ]

  $secure_linux_cis::approved_mac_algorithms.each |$algorithm| {
    unless $algorithm in $acceptable_values {
      fail("MAC Algorithm ${algorithm} does not match CIS standards. Please use CIS standard 1 for reference")
    }
  }

  $mac_algorithm_array = join($secure_linux_cis::approved_mac_algorithms,',')

  file_line { 'ssh mac algorithms':
    ensure => 'present',
    path   => '/etc/ssh/sshd_config',
    line   => "MACs ${mac_algorithm_array}",
    match  => '^#?MACs',
    notify => Exec['reload sshd'],
  }
}
