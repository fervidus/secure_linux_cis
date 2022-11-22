# @api private
#
# @summary Ensure system-wide crypto policy is not over-ridden 
#
class secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_over_ridden {
  unless $facts['crypto_policy_sshd'] {
    warning('System-wide Crypto policy for sshd over-ridden.')
  }
}
