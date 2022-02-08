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
#   include secure_linux_cis::ensure_iptables_rules_exist_for_all_open_ports
class secure_linux_cis::rules::ensure_iptables_rules_exist_for_all_open_ports {
}
