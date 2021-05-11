# @api private
#  Ensure firewall rules exist for all open ports (Scored)
#
# Description:
# Any ports that have been opened on non-loopback addresses need firewall rules to govern
# traffic.
#
# Rationale:
# Without a firewall rule configured for open ports default firewall policy will drop all
# packets to these ports.
#
# @summary  Ensure firewall rules exist for all open ports (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_firewall_rules_exist_for_all_open_ports
class secure_linux_cis::rules::ensure_firewall_rules_exist_for_all_open_ports {
    # This is enforced elswhere in rules, as all configurations are purged and defined by Puppet
    # SEE: secure_linux_cis class
}
