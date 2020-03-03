# @param enforced Should this rule be enforced
# @api private
# A description of what this class does
#
# Description:
#
#
# Rationale:
#
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::ensure_only_approved_mac_algorithms_are_used
class secure_linux_cis::rules::ensure_only_approved_mac_algorithms_are_used(
    Boolean $enforced = true,
) {
  if $enforced {
    include ::secure_linux_cis::service
    $acceptable_values = [
      'hmac-sha2-512-etm@openssh.com',
      'hmac-sha2-256-etm@openssh.com',
      'umac-128-etm@openssh.com',
      'hmac-sha2-512',
      'hmac-sha2-256',
      'umac-128@openssh.com',
    ]
    $::secure_linux_cis::approved_mac_algorithms.each |$algorithm| {
      unless $algorithm in $acceptable_values {
        fail("MAC Algorithm ${algorithm} does not match CIS standards. Please use CIS standard 1 for reference")
      }
    }
    $mac_algorithm_array = join($::secure_linux_cis::approved_mac_algorithms,',')
    file_line { 'ssh mac algorithms':
      ensure   => 'present',
      schedule => 'harden_schedule',
      path     => '/etc/ssh/sshd_config',
      line     => "MACs ${mac_algorithm_array}",
      match    => '^#?MACs',
      notify   => Exec['reload sshd'],
    }
  }
}
