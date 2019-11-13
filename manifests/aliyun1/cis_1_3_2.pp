#
class secure_linux_cis::cis_aliyun1::cis_1_3_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_filesystem_integrity_is_regularly_checked
}
