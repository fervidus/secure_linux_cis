# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_4_4_1_2 {
  include secure_linux_cis::rules::ensure_loopback_traffic_is_configured
}
