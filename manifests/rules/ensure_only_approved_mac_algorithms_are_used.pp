# @param enforced Should this rule be enforced
# @api private
# A description of what this class does
#
# Description:
#
#
# Rationale:
#
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::ensure_only_approved_mac_algorithms_are_used
class secure_linux_cis::rules::ensure_only_approved_mac_algorithms_are_used {
  include secure_linux_cis::rules::ensure_only_strong_mac_algorithms_are_used
}
