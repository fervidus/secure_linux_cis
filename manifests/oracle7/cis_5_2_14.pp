#
class secure_linux_cis::cis_oracle7::cis_5_2_14 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_access_is_limited
}
