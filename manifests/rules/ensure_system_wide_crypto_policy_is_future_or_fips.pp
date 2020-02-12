# @param enforced Should this rule be enforced
# @api private
# @example
#   include secure_linux_cis::ensure_system_wide_crypto_policy_is_future_or_fips
class secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_future_or_fips(
    Boolean $enforced = true,
) {
  if $enforced {
    unless $facts['is_crypto_policy_future'] {
      warning('Legacy crypto policies exist and should be turned off.')
    }
  }
}
