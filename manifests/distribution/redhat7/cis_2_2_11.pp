# 2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)
#
# Description:
# dovecot is an open source IMAP and POP3 server for Linux based systems.
#
# Rationale:
# Unless POP3 and/or IMAP servers are to be provided by this system,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::distribution::redhat7::cis_2_2_11
class secure_linux_cis::distribution::redhat7::cis_2_2_11 (
  Boolean $enforced = true,
) {

  if $enforced {

    case $facts['os']['family'] {
      'RedHat': {
        $services = [
          'dovecot',
          'cyrus-imap',
        ]

        service { $services:
          ensure => stopped,
          enable => false,
        }

      }
      'Debian': {
        package { 'exim4':
          ensure => absent,
        }
      }
      default: {
      }

    }
  }
}
