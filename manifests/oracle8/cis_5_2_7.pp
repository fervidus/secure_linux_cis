#
class secure_linux_cis::cis_oracle8::cis_5_2_7 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ssh_hostbasedauthentication_is_disabled
}
