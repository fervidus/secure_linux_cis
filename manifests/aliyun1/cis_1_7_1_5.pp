#
class secure_linux_cis::cis_aliyun1::cis_1_7_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_issue_are_configured
}
