# @api private
#
class secure_linux_cis::distribution::debian10::cis_5_2_14 {
  include secure_linux_cis::rules::ensure_only_strong_mac_algorithms_are_used
}
