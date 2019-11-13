#
class secure_linux_cis::cis_rhel6::cis_3_2_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_source_routed_packets_are_not_accepted
}
