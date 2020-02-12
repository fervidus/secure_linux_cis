# @api private
#
class secure_linux_cis::distribution::rhel8::cis_3_4_3_5 {
  include secure_linux_cis::rules::ensure_outbound_and_established_connections_are_configured
}
