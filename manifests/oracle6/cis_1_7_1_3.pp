#
class secure_linux_cis::cis_oracle6::cis_1_7_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_remote_login_warning_banner_is_configured_properly
}
