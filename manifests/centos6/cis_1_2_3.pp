#
class secure_linux_cis::cis_centos6::cis_1_2_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_gpg_keys_are_configured
}
