#
class secure_linux_cis::suse12::cis_1_1_2 {
  include secure_linux_cis::rules::ensure_separate_partition_exists_for_tmp
}