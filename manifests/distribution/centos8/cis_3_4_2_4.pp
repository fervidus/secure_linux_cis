# @api private
#
class secure_linux_cis::distribution::centos8::cis_3_4_2_4 {
  include secure_linux_cis::rules::ensure_network_interfaces_are_assigned_to_appropriate_zone
}
