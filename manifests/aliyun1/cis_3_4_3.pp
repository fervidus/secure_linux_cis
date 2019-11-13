#
class secure_linux_cis::cis_aliyun1::cis_3_4_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_etc_hosts_deny_is_configured
}
