# @api private
# Description:
# Key exchange is any method in cryptography by which cryptographic keys are exchanged
# between two parties, allowing use of a cryptographic algorithm. If the sender and receiver
# wish to exchange encrypted messages, each must be equipped to encrypt messages to be
# sent and decrypt messages received
#
# Rationale:
# Key exchange methods that are considered weak should be removed. A key exchange
# method may be weak because too few bits are used, or the hashing algorithm is considered
# too weak. Using weak algorithms could expose connections to man-in-the-middle attacks
#
# @summary Make sure only approved key exchange methods are used
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
