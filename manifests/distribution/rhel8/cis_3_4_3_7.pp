# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_4_3_7 {
  include secure_linux_cis::rules::ensure_nftables_service_is_enabled
}
