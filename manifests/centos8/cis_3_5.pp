#
class secure_linux_cis::centos8::cis_3_5 {
  include secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled
}
