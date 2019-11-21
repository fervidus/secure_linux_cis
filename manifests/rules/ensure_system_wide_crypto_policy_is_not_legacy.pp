# @example
#   include secure_linux_cis::ensure_system_wide_crypto_policy_is_not_legacy

class secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_legacy {
  if $facts['are_legacy_crypto_policies'] {
    warning('Legacy crypto policies exist and should be turned off.')
  }
}
