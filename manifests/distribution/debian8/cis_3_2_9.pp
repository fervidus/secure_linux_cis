# @api private
#
class secure_linux_cis::distribution::debian8::cis_3_2_9 {
  include secure_linux_cis::rules::ensure_ipv6_router_advertisements_are_not_accepted
}
