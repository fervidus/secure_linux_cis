# @api private
#
class secure_linux_cis::distribution::oracle8::cis_3_4_4_2_3 {
  include secure_linux_cis::rules::ensure_ipv6_outbound_and_established_connections_are_configured
}
