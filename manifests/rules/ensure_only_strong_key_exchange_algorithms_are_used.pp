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
#
# @summary Make sure only approved key exchange methods are used
#
# @param enforced Should this rule be enforced
# @param approved_kex
#
# @example
#   include secure_linux_cis::rules::ensure_only_strong_key_exchange_algorithms_are_used
class secure_linux_cis::rules::ensure_only_strong_key_exchange_algorithms_are_used (
    Boolean $enforced = true,
    Array $approved_kex = [
      'curve25519-sha256',
      'curve25519-sha256@libssh.org',
      'diffie-hellman-group14-sha256',
      'diffie-hellman-group16-sha512',
      'diffie-hellman-group18-sha512',
      'ecdh-sha2-nistp521',
      'ecdh-sha2-nistp384',
      'ecdh-sha2-nistp256',
      'diffie-hellman-group-exchange-sha256'
    ]
) {
  if $enforced {
    include ::secure_linux_cis::service
    $acceptable_values = [
      'curve25519-sha256',
      'curve25519-sha256@libssh.org',
      'diffie-hellman-group14-sha256',
      'diffie-hellman-group16-sha512',
      'diffie-hellman-group18-sha512',
      'ecdh-sha2-nistp521',
      'ecdh-sha2-nistp384',
      'ecdh-sha2-nistp256',
      'diffie-hellman-group-exchange-sha256'
    ]
    $approved_kex.each |$kex| {
      unless $kex in $acceptable_values {
        fail("Key exchange algorithm ${kex} does not match CIS standards. Please use CIS standard 5.2.15 for reference")
      }
    }
    $kex_array = join($approved_kex,',')
    file_line { 'ssh kex':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => "KexAlgorithms ${kex_array}",
      match    => '^#?KexAlgorithms',
      notify   => Exec['reload sshd'],
    }
  }
}
