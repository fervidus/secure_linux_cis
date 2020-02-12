# @api private
#
class secure_linux_cis::distribution::oracle8::cis_3_4_2_2 {
  include secure_linux_cis::rules::ensure_nftables_is_not_enabled
}
