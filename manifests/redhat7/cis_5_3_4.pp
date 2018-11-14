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
#   include secure_linux_cis::redhat7::cis_5_3_4
class secure_linux_cis::redhat7::cis_5_3_4 (
  Boolean $enforced = true,
) {

    $services = [
      'system-auth',
      'password-auth'
    ]

    if $enforced {

      $services.each | $service | {

        file_line { "password hashing ${service}":
          ensure => 'present',
          path   => "/etc/pam.d/${service}",
          line   => 'password sufficient pam_unix.so sha512',
          match  => '^#?password sufficient pam_unix.so sha512',
      }
    }
  }
}
