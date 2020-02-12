# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_4_4_1_3 {
  include secure_linux_cis::rules::ensure_outbound_and_established_connections_are_configured
}
