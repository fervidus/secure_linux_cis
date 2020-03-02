# @api private
#  Ensure NIS Client is not installed (Scored)
#
# Description:
# The Network Information Service (NIS), formerly known as Yellow Pages, is a client-server
# directory service protocol used to distribute system configuration files. The NIS client ( ypbind )
# was used to bind a machine to an NIS server and receive the distributed configuration files.
#
# Rationale:
# The NIS service is inherently an insecure system that has been vulnerable to DOS attacks,
# buffer overflows and has poor authentication for querying NIS maps. NIS generally has been
# replaced by such protocols as Lightweight Directory Access Protocol (LDAP). It is recommended that the service be removed.
#
# @summary  Ensure NIS Client is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nis_client_is_not_installed
class secure_linux_cis::rules::ensure_nis_client_is_not_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'Suse': {
        package { ['ypbind', 'nis']:
          ensure   => absent,
          schedule => 'harden_schedule',
        }
      }
      default: {
        package { ['ypbind', 'nis']:
          ensure   => purged,
          schedule => 'harden_schedule',
        }
      }
    }
  }
}
