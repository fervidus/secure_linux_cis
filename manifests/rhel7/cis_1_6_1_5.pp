#
class secure_linux_cis::cis_rhel7::cis_1_6_1_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_the_mcs_translation_service_mcstrans_is_not_installed
}
