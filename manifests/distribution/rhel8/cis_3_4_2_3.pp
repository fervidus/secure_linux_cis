# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_4_2_3 {
  include secure_linux_cis::rules::ensure_nftables_is_not_enabled
}
