#
class secure_linux_cis::cis_suse12::cis_6_2_18 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_duplicate_user_names_exist
}
