#
class secure_linux_cis::cis_aliyun1::cis_6_2_10 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_users_dot_files_are_not_group_or_world_writable
}
