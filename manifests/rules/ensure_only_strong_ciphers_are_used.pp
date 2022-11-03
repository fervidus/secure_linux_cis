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
