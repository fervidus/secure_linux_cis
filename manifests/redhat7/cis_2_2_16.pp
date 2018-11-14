# 2.2.16 Ensure NIS Server is not enabled (Scored)
#
# Description:
# The Network Information Service (NIS) (formally known as Yellow Pages) is a
# client-server directory service protocol for distributing system configuration files.
# The NIS server is a collection of programs that allow for the distribution of configuration files.
#
# Rationale:
# The NIS service is inherently an insecure system that has been vulnerable to DOS attacks,
# buffer overflows and has poor authentication for querying NIS maps.
# NIS generally been replaced by such protocols as Lightweight Directory Access Protocol (LDAP).
# It is recommended that the service be disabled and other, more secure services be used
#
# @summary 2.2.16 Ensure NIS Server is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_16
class secure_linux_cis::redhat7::cis_2_2_16 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'ypserv':
      ensure => stopped,
      enable => false,
    }
  }
}
