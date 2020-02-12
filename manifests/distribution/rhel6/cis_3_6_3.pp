# @api private
#
class secure_linux_cis::distribution::rhel6::cis_3_6_3 {
  include secure_linux_cis::rules::ensure_loopback_traffic_is_configured
}
