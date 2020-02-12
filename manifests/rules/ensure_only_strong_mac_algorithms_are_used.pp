# @param enforced Should this rule be enforced
# @api private
# Ensure only strong MAC algorithms are used
#
# Description:
# This variable limits the types of MAC algorithms that SSH can use during communication.
#
# Rationale:
# MD5 and 96-bit MAC algorithms are considered weak and have been shown to increase
# exploitability in SSH downgrade attacks. Weak algorithms continue to have a great deal of
# attention as a weak spot that can be exploited with expanded computing power. An
# attacker that breaks the algorithm could take advantage of a MiTM position to decrypt the
# SSH tunnel and capture credentials and information
# @summary Only enable strong MAC algorithms
#
# @example
#   include secure_linux_cis::ensure_only_strong_mac_algorithms_are_used
class secure_linux_cis::rules::ensure_only_strong_mac_algorithms_are_used(
    Boolean $enforced = true,
) {
  if $enforced {
    # Looks like the same check
    include ::secure_linux_cis::rules::ensure_only_approved_mac_algorithms_are_used
  }
}
