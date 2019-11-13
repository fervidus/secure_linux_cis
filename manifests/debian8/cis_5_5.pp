#
class secure_linux_cis::cis_debian8::cis_5_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_root_login_is_restricted_to_system_console
}
