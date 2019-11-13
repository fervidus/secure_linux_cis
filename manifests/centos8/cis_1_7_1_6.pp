#
class secure_linux_cis::cis_centos8::cis_1_7_1_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_issue_net_are_configured
}
