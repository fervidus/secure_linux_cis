# @api private
#  Ensure iptables is not enabled (Scored)
#
# Description:
# IPtables is an application that allows a system administrator to configure
# the IPv4 and IPv6 tables, chains and rules provided by the Linux kernel
# firewall.
# IPtables is installed as a dependency with firewalld.
#
# Rationale:
# Running firewalld and IPtables concurrently may lead to conflict, therefore
# IPtables should be stopped and masked when using firewalld.
#
# @summary  Ensure iptables is not enabled
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_iptables_is_not_enabled
class secure_linux_cis::rules::ensure_iptables_is_not_enabled {
    package {'iptables-services':
      ensure => absent,
    }
}
