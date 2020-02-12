# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_iptables_are_flushed
class secure_linux_cis::rules::ensure_iptables_are_flushed(
    Boolean $enforced = true,
) {
  if $enforced {
    notify { 'ensure_iptables_are_flushed Still needs to be implemented.': }
  }
}
