#
class secure_linux_cis::distribution::centos7::cis_3_2_5 {
  include secure_linux_cis::rules::ensure_broadcast_icmp_requests_are_ignored
}
