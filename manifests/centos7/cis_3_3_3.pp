#
class secure_linux_cis::cis_centos7::cis_3_3_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ipv6_is_disabled
}
