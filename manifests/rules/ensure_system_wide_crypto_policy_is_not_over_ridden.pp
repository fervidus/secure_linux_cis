# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_over_ridden
class secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_over_ridden (
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['crypto_policy_sshd'] {
      warning('System-wide Crypto policy for sshd over-ridden.')
    }
  }
}
