#
class secure_linux_cis::cis_ubuntu16::cis_1_1_13 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_separate_partition_exists_for_home
}
