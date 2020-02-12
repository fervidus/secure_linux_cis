# @api private
#
class secure_linux_cis::distribution::ubuntu16::cis_3_1_1 {
  include secure_linux_cis::rules::ensure_ip_forwarding_is_disabled
}
