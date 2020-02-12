# @api private
#
class secure_linux_cis::distribution::centos6::cis_3_2_1 {
  include secure_linux_cis::rules::ensure_source_routed_packets_are_not_accepted
}
