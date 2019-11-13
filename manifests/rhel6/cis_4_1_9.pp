#
class secure_linux_cis::cis_rhel6::cis_4_1_9 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_session_initiation_information_is_collected
}
