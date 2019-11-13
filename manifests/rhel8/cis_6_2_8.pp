#
class secure_linux_cis::cis_rhel8::cis_6_2_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_users_home_directories_permissions_are_750_or_more_restrictive
}
