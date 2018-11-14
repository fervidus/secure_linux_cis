# 2.3.1 Ensure NIS Client is not installed (Scored)
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
# @summary 2.3.1 Ensure NIS Client is not installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_3_1
class secure_linux_cis::redhat7::cis_2_3_1 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'ypbind':
      ensure => purged,
    }
  }
}
