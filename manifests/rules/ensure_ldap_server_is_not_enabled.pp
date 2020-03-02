# @api private
#  Ensure LDAP server is not enabled (Scored)
#
# Description:
# The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP.
# It is a service that provides a method for looking up information from a central database.
#
# Rationale:
# If the system will not need to act as an LDAP server,
# it is recommended that the software be disabled to reduce the potential attack surface.
#
# @summary  Ensure LDAP server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ldap_server_is_not_enabled
class secure_linux_cis::rules::ensure_ldap_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'slapd':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
