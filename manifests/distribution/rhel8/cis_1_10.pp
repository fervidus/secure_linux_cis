# @api private
#
class secure_linux_cis::distribution::rhel8::cis_1_10 {
  include secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_legacy
}
