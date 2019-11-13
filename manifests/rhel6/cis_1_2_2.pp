#
class secure_linux_cis::cis_rhel6::cis_1_2_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_gpgcheck_is_globally_activated
}
