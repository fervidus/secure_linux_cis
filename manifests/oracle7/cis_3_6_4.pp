#
class secure_linux_cis::cis_oracle7::cis_3_6_4 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_outbound_and_established_connections_are_configured
}
