#
class secure_linux_cis::cis_ubuntu16::cis_5_4_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_default_user_shell_timeout_is_900_seconds_or_less
}
