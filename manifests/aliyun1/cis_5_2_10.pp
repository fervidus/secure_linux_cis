#
class secure_linux_cis::cis_aliyun1::cis_5_2_10 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled
}
