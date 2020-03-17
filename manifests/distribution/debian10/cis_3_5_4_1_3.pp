# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_5_4_1_3 {
  include secure_linux_cis::rules::ensure_outbound_and_established_connections_are_configured
}
