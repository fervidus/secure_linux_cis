# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_20 {
  include secure_linux_cis::rules::ensure_system_wide_crypto_policy_is_not_over_ridden
}
