#
class secure_linux_cis::distribution::rhel6::cis_3_3_1 {
  include secure_linux_cis::rules::ensure_ipv6_router_advertisements_are_not_accepted
}
