#
class secure_linux_cis::cis_centos6::cis_2_3_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_nis_client_is_not_installed
}
