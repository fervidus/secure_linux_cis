#
class secure_linux_cis::distribution::centos8::cis_3_2_2 {
  include secure_linux_cis::rules::ensure_ICMP_redirects_are_not_accepted
}
