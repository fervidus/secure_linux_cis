#
class secure_linux_cis::distribution::rhel6::cis_1_1_6 {
  include secure_linux_cis::rules::ensure_separate_partition_exists_for_var
}
