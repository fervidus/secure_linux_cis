#
class secure_linux_cis::centos7::cis_3_7 {
  include secure_linux_cis::rules::ensure_wireless_interfaces_are_disabled
}
