#
class secure_linux_cis::cis_centos6::cis_3_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ip_forwarding_is_disabled
}
