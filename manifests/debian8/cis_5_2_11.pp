#
class secure_linux_cis::cis_debian8::cis_5_2_11 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_only_approved_mac_algorithms_are_used
}
