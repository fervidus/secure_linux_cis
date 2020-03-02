# @api private
# 6 Ensure NIS Server is not enabled (Scored)
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
# @summary 6 Ensure NIS Server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nis_server_is_not_enabled
class secure_linux_cis::rules::ensure_nis_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { ['ypserv', 'nis']:
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
