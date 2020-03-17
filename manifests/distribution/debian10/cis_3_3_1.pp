# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_3_1 {
  include secure_linux_cis::rules::ensure_source_routed_packets_are_not_accepted
}
