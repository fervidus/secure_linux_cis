#
class secure_linux_cis::cis_aliyun1::cis_6_1_10 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_no_world_writable_files_exist
}
