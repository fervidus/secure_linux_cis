# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_6 {
  include secure_linux_cis::rules::ensure_ipv6_is_disabled
}
