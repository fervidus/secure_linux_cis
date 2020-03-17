# @api private
#
class secure_linux_cis::distribution::debian10::cis_3_1_2 {
  include secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled
}
