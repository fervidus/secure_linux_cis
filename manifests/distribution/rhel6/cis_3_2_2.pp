#
class secure_linux_cis::distribution::rhel6::cis_3_2_2 {
  include secure_linux_cis::rules::ensure_icmp_redirects_are_not_accepted
}
