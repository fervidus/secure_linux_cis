# 3.6.1 Ensure iptables is installed (Scored)
#
# Description:
# iptables allows configuration of the IPv4 tables in the linux kernel and the rules stored
# within them. Most firewall configuration utilities operate as a front end to iptables.
#
# Rationale:
# iptables is required for firewall management and configuration.
#
# @summary 3.6.1 Ensure iptables is installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_3_6_1
class secure_linux_cis::redhat7::cis_3_6_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    class { '::firewall': }

    resources { 'firewall':
      purge => true,
    }
  }
}
