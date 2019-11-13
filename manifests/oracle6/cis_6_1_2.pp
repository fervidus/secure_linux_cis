#
class secure_linux_cis::cis_oracle6::cis_6_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_permissions_on_etc_passwd_are_configured
}
