#
class secure_linux_cis::cis_centos7::cis_4_1_13 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_successful_file_system_mounts_are_collected
}
