#
class secure_linux_cis::cis_aliyun1::cis_1_3_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_aide_is_installed
}
