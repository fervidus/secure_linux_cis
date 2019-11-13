#
class secure_linux_cis::cis_oracle7::cis_3_6_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_loopback_traffic_is_configured
}
