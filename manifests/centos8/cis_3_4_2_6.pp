#
class secure_linux_cis::centos8::cis_3_4_2_6 {
  include secure_linux_cis::rules::ensure_iptables_is_not_enabled
}
