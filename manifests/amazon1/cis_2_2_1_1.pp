#
class secure_linux_cis::cis_amazon1::cis_2_2_1_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_time_synchronization_is_in_use
}
