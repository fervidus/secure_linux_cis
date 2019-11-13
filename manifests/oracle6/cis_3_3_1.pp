#
class secure_linux_cis::cis_oracle6::cis_3_3_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_ipv6_router_advertisements_are_not_accepted
}
