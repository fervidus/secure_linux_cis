#
class secure_linux_cis::cis_centos6::cis_2_2_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ntp_is_configured
}
