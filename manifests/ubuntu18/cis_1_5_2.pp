#
class secure_linux_cis::cis_ubuntu18::cis_1_5_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_xd_nx_support_is_enabled
}
