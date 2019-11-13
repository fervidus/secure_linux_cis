#
class secure_linux_cis::cis_rhel7::cis_3_2_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_secure_icmp_redirects_are_not_accepted
}
