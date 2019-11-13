#
class secure_linux_cis::cis_debian8::cis_5_4_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_default_group_for_the_root_account_is_gid_0
}
