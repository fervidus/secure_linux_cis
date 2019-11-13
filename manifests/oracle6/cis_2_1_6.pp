#
class secure_linux_cis::cis_oracle6::cis_2_1_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_tftp_server_is_not_enabled
}
