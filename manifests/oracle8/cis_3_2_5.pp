#
class secure_linux_cis::cis_oracle8::cis_3_2_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_broadcast_icmp_requests_are_ignored
}
