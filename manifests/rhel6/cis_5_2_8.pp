#
class secure_linux_cis::cis_rhel6::cis_5_2_8 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_root_login_is_disabled
}
