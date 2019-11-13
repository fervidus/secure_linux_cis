#
class secure_linux_cis::cis_oracle8::cis_6_2_15 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_all_groups_in_etc_passwd_exist_in_etc_group
}
