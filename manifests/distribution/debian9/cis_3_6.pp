# @api private
#
class secure_linux_cis::distribution::debian9::cis_3_6 {
  include secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled
}
