#
class secure_linux_cis::cis_amazon2::cis_3_2_6 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_bogus_icmp_responses_are_ignored
}
