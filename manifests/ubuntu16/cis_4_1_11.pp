#
class secure_linux_cis::cis_ubuntu16::cis_4_1_11 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected
}
