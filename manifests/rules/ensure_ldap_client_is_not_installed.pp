# @api private
#  Ensure LDAP client is not installed (Scored)
#
# Description:
# The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP.
# It is a service that provides a method for looking up information from a central database.
#
# Rationale:
# If the system will not need to act as an LDAP client, it is recommended that the software
# be removed to reduce the potential attack surface.
#
# @summary  Ensure LDAP client is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ldap_client_is_not_installed
class secure_linux_cis::rules::ensure_ldap_client_is_not_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'Suse': {
        package { ['openldap-clients', 'ldap-utils']:
          ensure   => absent,
          schedule => 'harden_schedule',
        }
      }
      default: {
        package { ['openldap-clients', 'ldap-utils']:
          ensure   => purged,
          schedule => 'harden_schedule',
        }
      }
    }
  }
}
