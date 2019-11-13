#
class secure_linux_cis::cis_rhel7::cis_2_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_discard_services_are_not_enabled
}
