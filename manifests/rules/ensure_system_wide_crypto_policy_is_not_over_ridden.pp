# @api private
#
# @summary Ensure system-wide crypto policy is not over-ridden 
#
class secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_over_ridden {
  if $facts['crypto_policy_sshd'] {
    alert('System-wide Crypto policy for sshd over-ridden. This is not CIS compliant (Scored)')
  }
}
