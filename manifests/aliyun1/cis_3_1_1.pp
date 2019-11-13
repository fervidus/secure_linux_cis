#
class secure_linux_cis::cis_aliyun1::cis_3_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ip_forwarding_is_disabled
}
