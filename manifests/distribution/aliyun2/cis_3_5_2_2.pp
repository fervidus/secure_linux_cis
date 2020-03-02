# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_3_5_2_2 {
  include secure_linux_cis::rules::ensure_ipv6_loopback_traffic_is_configured
}
