#
class secure_linux_cis::cis_centos7::cis_4_1_12 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_use_of_privileged_commands_is_collected
}
