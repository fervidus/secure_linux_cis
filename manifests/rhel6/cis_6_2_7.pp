#
class secure_linux_cis::cis_rhel6::cis_6_2_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_all_users_home_directories_exist
}
