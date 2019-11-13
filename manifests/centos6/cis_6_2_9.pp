#
class secure_linux_cis::cis_centos6::cis_6_2_9 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_users_own_their_home_directories
}
