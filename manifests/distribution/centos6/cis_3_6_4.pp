# @api private
#
class secure_linux_cis::distribution::centos6::cis_3_6_4 {
  include secure_linux_cis::rules::ensure_outbound_and_established_connections_are_configured
}
