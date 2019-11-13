#
class secure_linux_cis::cis_oracle6::cis_2_2_11 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_imap_and_pop3_server_is_not_enabled
}
