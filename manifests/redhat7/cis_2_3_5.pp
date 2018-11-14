# 2.3.5 Ensure LDAP client is not installed (Scored)
#
# Description:
# The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP.
# It is a service that provides a method for looking up information from a central database.
#
# Rationale:
# If the system will not need to act as an LDAP client, it is recommended that the software
# be removed to reduce the potential attack surface.
#
# @summary 2.3.5 Ensure LDAP client is not installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_3_5
class secure_linux_cis::redhat7::cis_2_3_5 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'openldap-clients':
      ensure => purged,
    }
  }
}
