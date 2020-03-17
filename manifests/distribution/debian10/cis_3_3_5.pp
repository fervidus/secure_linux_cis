# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_3_5 {
  include secure_linux_cis::rules::ensure_broadcast_icmp_requests_are_ignored
}
