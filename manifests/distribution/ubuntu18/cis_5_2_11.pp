# @api private
#
class secure_linux_cis::distribution::ubuntu18::cis_5_2_11 {
  include secure_linux_cis::rules::ensure_only_approved_mac_algorithms_are_used
}
