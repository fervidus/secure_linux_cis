# @api private
#
class secure_linux_cis::distribution::centos6::cis_3_7 {
  include secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled
}
