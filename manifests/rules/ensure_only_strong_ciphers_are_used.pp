# @api private
# A description of what this class does
#
# Description:
# This variable limits the ciphers that SSH can use during communication.
#
# Rationale:
# Weak ciphers that are used for authentication to the cryptographic module cannot be relied
# upon to provide confidentiality or integrity, and system data may be compromised
#
# @summary Make sure only approved ciphers are used
#
# @param enforced Should this rule be enforced
# @param approved_ciphers
#
# @example
#   include secure_linux_cis::rules::ensure_only_strong_ciphers_are_used
class secure_linux_cis::rules::ensure_only_strong_ciphers_are_used (
    Boolean $enforced = true,
    Array $approved_ciphers = [
      'chacha20-poly1305@openssh.com',
      'aes256-gcm@openssh.com',
      'aes128-gcm@openssh.com',
      'aes256-ctr',
      'aes192-ctr',
      'aes128-ctr'
    ]
) {
  if $enforced {
    include ::secure_linux_cis::service
    $acceptable_values = [
      'chacha20-poly1305@openssh.com',
      'aes256-gcm@openssh.com',
      'aes128-gcm@openssh.com',
      'aes256-ctr',
      'aes192-ctr',
      'aes128-ctr'
    ]
    $approved_ciphers.each |$cipher| {
      unless $cipher in $acceptable_values {
        fail("Cipher ${cipher} does not match CIS standards. Please use CIS standard 5.2.13 for reference")
      }
    }
    $ciphers_array = join($approved_ciphers,',')
    file_line { 'ssh ciphers':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => "Ciphers ${ciphers_array}",
      match    => '^#?Ciphers',
      notify   => Exec['reload sshd'],
    }
  }
}
