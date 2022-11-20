# @api private
class secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_future_or_fips {
  unless $facts['is_crypto_policy_future'] {
    warning('Legacy crypto policies exist and should be turned off.')
  }
}
