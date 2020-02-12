# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_1_1 {
  include secure_linux_cis::rules::ensure_IP_forwarding_is_disabled
}
