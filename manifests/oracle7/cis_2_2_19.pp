#
class secure_linux_cis::cis_oracle7::cis_2_2_19 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_telnet_server_is_not_enabled
}
