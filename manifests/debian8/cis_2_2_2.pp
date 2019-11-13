#
class secure_linux_cis::cis_debian8::cis_2_2_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_x_window_system_is_not_installed
}
