#
class secure_linux_cis::cis_rhel6::cis_6_2_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_root_is_the_only_uid_0_account
}
