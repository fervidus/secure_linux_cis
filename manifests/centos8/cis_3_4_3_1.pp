#
class secure_linux_cis::centos8::cis_3_4_3_1 {
  include secure_linux_cis::rules::ensure_iptables_are_flushed
}
