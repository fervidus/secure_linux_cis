#
class secure_linux_cis::centos7::cis_6_2_10 {
  include secure_linux_cis::rules::ensure_users_dot_files_are_not_group_or_world_writable
}
