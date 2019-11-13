#
class secure_linux_cis::cis_ubuntu18::cis_3_3_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ipv6_redirects_are_not_accepted
}
