#
class secure_linux_cis::distribution::rhel7::cis_2_2_1_1 {
  include secure_linux_cis::rules::ensure_time_synchronization_is_in_use
}
