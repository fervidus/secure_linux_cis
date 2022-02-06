# @api private
#  Ensure nftables base chains exist(Scored)
#
# Description:
# Chains are containers for rules. They exist in two kinds, base chains and regular chains. A base chain is an entry point for packets
# from the networking stack, a regular chain may be used as jump target and is used for better rule organization.
#
# Rationale:
# If a base chain doesn't exist with a hook for input, forward, and delete, packets that would flow through those chains will not be
# touched by nftables.
#
# @summary  Ensure nftables base chains exist
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_nftables_default_deny_firewall_policy
class secure_linux_cis::rules::ensure_nftables_default_deny_firewall_policy {

}
