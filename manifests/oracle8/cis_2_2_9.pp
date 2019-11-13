#
class secure_linux_cis::cis_oracle8::cis_2_2_9 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ftp_server_is_not_enabled
}
