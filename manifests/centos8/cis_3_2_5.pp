#
class secure_linux_cis::centos8::cis_3_2_5 {
  include secure_linux_cis::rules::ensure_broadcast_ICMP_requests_are_ignored
}
