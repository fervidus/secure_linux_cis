#
class secure_linux_cis::cis_ubuntu18::cis_1_7_1_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_local_login_warning_banner_is_configured_properly
}
