# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_4_3_4 {
  include secure_linux_cis::rules::ensure_loopback_traffic_is_configured
}
