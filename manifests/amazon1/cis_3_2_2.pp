#
class secure_linux_cis::cis_amazon1::cis_3_2_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_icmp_redirects_are_not_accepted
}
