# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_2_2 {
  include secure_linux_cis::rules::ensure_ip_forwarding_is_disabled
}
