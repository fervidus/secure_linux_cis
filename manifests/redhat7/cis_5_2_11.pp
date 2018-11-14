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
#   include secure_linux_cis::redhat7::cis_5_2_11
class secure_linux_cis::redhat7::cis_5_2_11 (
  Boolean $enforced = true,
  Array $approved_mac_algorithms = ['hmac-sha2-512-etm@openssh.com','hmac-sha2-256-etm@openssh.com','umac-128-etm@openssh.com',
                                    'hmac-sha2-512','hmac-sha2-256','umac-128@openssh.com']
) {

  if $enforced {

    $acceptable_values = [
      'hmac-sha2-512-etm@openssh.com',
      'hmac-sha2-256-etm@openssh.com',
      'umac-128-etm@openssh.com',
      'hmac-sha2-512',
      'hmac-sha2-256',
      'umac-128@openssh.com'
    ]

    $approved_mac_algorithms.each |$algorithm| {

      if !($algorithm in $acceptable_values) {

        fail("MAC Algorithm ${algorithm} does not match CIS standards. Please use CIS standard 5.2.11 for reference")
      }
    }

    $mac_algorithm_array = join($approved_mac_algorithms,',')

    file_line { 'ssh mac algorithms':
      ensure => 'present',
      path   => '/etc/ssh/sshd_config',
      line   => "MACs ${mac_algorithm_array}",
      match  => '^#?MACs',
    }
  }
}
