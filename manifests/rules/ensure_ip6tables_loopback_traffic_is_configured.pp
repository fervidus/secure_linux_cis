# @api private
#  Ensure iptables is installed (Scored)
#
# Description:
# iptables allows configuration of the IPv4 tables in the linux kernel and the rules stored
# within them. Most firewall configuration utilities operate as a front end to iptables.
#
# Rationale:
# iptables is required for firewall management and configuration.
#
# @summary  Ensure iptables is installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ip6tables_loopback_traffic_is_configured
class secure_linux_cis::rules::ensure_ip6tables_loopback_traffic_is_configured {
    include secure_linux_cis::rules::ensure_iptables_is_installed
}
