#
class secure_linux_cis::cis_debian8::cis_6_2_19 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_duplicate_group_names_exist
}
